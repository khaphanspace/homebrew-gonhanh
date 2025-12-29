cask "gonhanh" do
  version "1.0.94"
  sha256 "693498860fbc615638377c8df66dfe030a0e77d0b56f7d3cc117a42c35aea817"

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
