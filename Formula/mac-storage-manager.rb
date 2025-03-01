class MacStorageManager < Formula
  desc "Cross-platform tool to reclaim disk space by removing applications"
  homepage "https://github.com/NarekMosisian/mac-storage-manager"
  url "https://github.com/NarekMosisian/mac-storage-manager/archive/refs/tags/v2.0.2.tar.gz"
  sha256 "a33bba08e7c0f30371748b0561e4e85d3730aa5a5a724f7f7ad40aaaf76aa6ce"
  license "AGPL-3.0-only"

  depends_on "jq"
  depends_on "newt"

  def install
    folder = "mac-storage-manager-2.0.2"
    folder = "." unless File.directory?(folder)
    cd folder do
      rm_r "bin" if File.exist?("bin")
      chmod 0755, "application_size_checker.sh"
      libexec.install "application_size_checker.sh"
      pkgshare.install "sounds" if File.directory?("sounds")
    end

    (bin/"mac-storage-manager").write <<~EOS
      #!/bin/sh
      export MAC_STORAGE_MANAGER_SHARE=#{pkgshare}
      exec "#{libexec}/application_size_checker.sh" "$@"
    EOS
    (bin/"mac-storage-manager").chmod 0755
  end

  test do
    ENV["HOME"] = testpath
    (testpath/"sounds").mkpath
    ENV["MAC_STORAGE_MANAGER_SHARE"] = testpath
    if OS.mac?
      (testpath/"Applications/Dummy.app").mkpath
      (testpath/"Library/Application Support/Dummy").mkpath
      (testpath/"Library/Preferences").mkpath
      (testpath/"Library/Caches/Dummy").mkpath
      (testpath/"Library/Logs/Dummy").mkpath
      (testpath/"Library/Saved Application State/Dummy.savedState").mkpath
      dummy_app = "Dummy.app"
    else
      (testpath/"Applications/dummy.desktop").write <<~EOS
        [Desktop Entry]
        Name=Dummy
        Exec=dummy
      EOS
      dummy_app = "dummy.desktop"
    end
    output = shell_output("#{bin}/mac-storage-manager --test-run 2>&1")

    assert_match dummy_app, output
    log_file = testpath/"application_size_checker.log"
    assert_path_exists log_file
    log_content = File.read(log_file)
    assert_match "DEBUG: SOUND_PATH", log_content
  end
end
