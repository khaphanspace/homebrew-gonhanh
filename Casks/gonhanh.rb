cask "gonhanh" do
  version "1.0.95"
  sha256 "03992c6182f8c4aaea6f031ffbdf012722fc2cd019bfa27a096a60098cc825ac"

  url "https://github.com/khaphanspace/gonhanh.org/releases/download/v#{version}/GoNhanh.dmg"
  name "Gõ Nhanh"
  desc "High-performance Vietnamese Input Method Engine for macOS"
  homepage "https://github.com/khaphanspace/gonhanh.org"

  auto_updates true

  livecheck do
    url :url
    strategy :github_latest
  end

  app "GoNhanh.app"

  preflight do
    system_command "/usr/bin/osascript",
         args: ["-e", 'tell application id "org.gonhanh.GoNhanh" to quit'],
         sudo: false
    sleep 1
  end

  uninstall quit: "org.gonhanh.GoNhanh"

  postflight do
    system_command "/usr/bin/xattr",
         args: ["-cr", "#{appdir}/GoNhanh.app"],
         sudo: false
    system_command "/usr/bin/open",
         args: ["-a", "GoNhanh"],
         sudo: false
  end

  zap trash: [
    "~/Library/Preferences/space.khaphan.gonhanh.plist",
    "~/Library/Application Support/GoNhanh",
  ]
end
