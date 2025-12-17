cask "gonhanh" do
  version "1.0.62"
  sha256 "8d08f57e9cfd5932ed9029bb3c6812e373fdabaf27b3df6c21fa164bc0eecadb"

  url "https://github.com/khaphanspace/gonhanh.org/releases/download/v#{version}/GoNhanh.dmg"
  name "Gõ Nhanh"
  desc "High-performance Vietnamese Input Method Engine for macOS"
  homepage "https://github.com/khaphanspace/gonhanh.org"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Gõ Nhanh.app"

  postflight do
    system_command "/usr/bin/xattr",
         args: ["-cr", "#{appdir}/Gõ Nhanh.app"],
         sudo: false
  end

  zap trash: [
    "~/Library/Preferences/space.khaphan.gonhanh.plist",
    "~/Library/Application Support/Gõ Nhanh",
  ]
end
