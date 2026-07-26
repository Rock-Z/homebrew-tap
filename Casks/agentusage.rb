cask "agentusage" do
  version "0.4.4"
  sha256 "5cf6b4ab8e98e8f8b74e5db6787af4397c2cac933f1e05d260e2aedf997840d2"

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
