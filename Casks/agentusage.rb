cask "agentusage" do
  version "0.5.0"
  sha256 "c41a52bbe523ab5e0913ff9956a4520aafa53de88f2274f0686d553caff259f2"

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
