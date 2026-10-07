cask "agentusage" do
  version "0.6.0"
  sha256 "6c008c889bbf2f7bc669b21d232403ce9aad5228ce0347403d4ce1768392f005"

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
