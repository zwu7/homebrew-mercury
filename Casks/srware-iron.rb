cask "srware-iron-arm" do
  arch = Hardware::CPU.arm? ? "macARM" : "mac"

  version "135.0.0.0"

  url "https://www.srware.net/downloads/iron-#{arch}.dmg"
  name "SRWare Iron"
  desc "Privacy-focused web browser based on Chromium"
  homepage "https://www.srware.net/iron/"

  livecheck do
    url homepage
    regex(%r{macOS.*?Version:\s*(\d+(?:\.\d+)*)}i)
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Iron.app"

  uninstall quit: "com.srware.iron"

  zap trash: [
    "~/Library/Application Support/com.srware.iron",
    "~/Library/Caches/com.srware.iron",
    "~/Library/Preferences/com.srware.iron.plist",
    "~/Library/Saved Application State/com.srware.iron.savedState",
  ]

  caveats do
    <<~EOS
      SRWare Iron is a privacy-focused browser that removes tracking features found in standard Chromium browsers.
      
      Note: This cask is for Apple Silicon (ARM) Macs. If you have an Intel Mac, you may need a different version.
    EOS
  end

  if Hardware::CPU.arm?
    sha256 "3c66c21a6e8fcb34853aecee49bf57f11df1f669deeda1f9f41d73e854efa453"
  else
    # SHA256 for Intel version would go here
    # sha256 "..."
  end
end
