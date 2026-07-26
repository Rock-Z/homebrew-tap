cask "agentusage" do
  version "0.4.2"
  sha256 "09cfd600d4e8827c223ad35589dae51104cd1dea6bd672cce2cab1580d542c65"

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

  uninstall quit: "io.github.rock-z.agentusage"
end
