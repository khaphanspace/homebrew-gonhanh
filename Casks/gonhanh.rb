cask "gonhanh" do
  version "1.0.93"
  sha256 "76efaed38548649f053a0cd091c41e1eceeeef0a292f753edbb3afe29af97e54"

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
    # must_succeed: false - allows first install when app doesn't exist yet
    system_command "/usr/bin/osascript",
         args: ["-e", 'tell application id "org.gonhanh.GoNhanh" to quit'],
         sudo: false,
         must_succeed: false
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
