cask "agentusage" do
  version "0.6.2"
  sha256 "86262b3d9b354b3ee6a738977953f2e5768bf837639cff17965ddd0bf385e264"

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
