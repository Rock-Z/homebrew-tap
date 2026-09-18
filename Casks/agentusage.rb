cask "agentusage" do
  version "0.4.6"
  sha256 "85198e4f7c3b6df75df3c1e481c34f4dfe606b2b2363985c367e3a70b0eed3a9"

  url "https://github.com/Rock-Z/AgentUsage/releases/download/v#{version}/AgentUsage-macos-universal.dmg"
  name "AgentUsage"
  desc "Menu-bar viewer for Codex and Claude usage"
  homepage "https://github.com/Rock-Z/AgentUsage"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "AgentUsage.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/AgentUsage.app"]
  end

  uninstall quit: "io.github.rock-z.agentusage"
end
