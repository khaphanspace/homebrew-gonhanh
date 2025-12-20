cask "gonhanh" do
  version "1.0.78"
  sha256 "cadfe3661fb69c4635792af4c6771ccdfb4ee79242d38a889c6985693e3f8dae"

  url "https://github.com/khaphanspace/gonhanh.org/releases/download/v#{version}/GoNhanh.dmg"
  name "Gõ Nhanh"
  desc "High-performance Vietnamese Input Method Engine for macOS"
  homepage "https://github.com/khaphanspace/gonhanh.org"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "GoNhanh.app"

  postflight do
    system_command "/usr/bin/xattr",
         args: ["-cr", "#{appdir}/GoNhanh.app"],
         sudo: false
  end

  zap trash: [
    "~/Library/Preferences/space.khaphan.gonhanh.plist",
    "~/Library/Application Support/GoNhanh",
  ]
end
