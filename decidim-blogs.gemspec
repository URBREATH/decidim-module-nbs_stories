# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "decidim/nbs/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.version = Decidim::Nbs.version
  s.authors = ["Isaac Massot Gil"]
  s.email = ["isaac.mg@coditramuntana.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://decidim.org"
  s.metadata = {
    "bug_tracker_uri" => "https://github.com/decidim/decidim/issues",
    "documentation_uri" => "https://docs.decidim.org/",
    "funding_uri" => "https://opencollective.com/decidim",
    "homepage_uri" => "https://decidim.org",
    "source_code_uri" => "https://github.com/decidim/decidim"
  }
  s.required_ruby_version = "~> 3.2.0"

  s.name = "decidim-nbs"
  s.summary = "Decidim nbs module"
  s.description = "A Blog component for decidim's participatory spaces."

  s.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").select do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w(app/ config/ db/ lib/ Rakefile README.md))
    end
  end

  s.add_dependency "decidim-admin", Decidim::Nbs.version
  s.add_dependency "decidim-comments", Decidim::Nbs.version
  s.add_dependency "decidim-core", Decidim::Nbs.version

  s.add_development_dependency "decidim-admin", Decidim::Nbs.version
  s.add_development_dependency "decidim-assemblies", Decidim::Nbs.version
  s.add_development_dependency "decidim-dev", Decidim::Nbs.version
  s.add_development_dependency "decidim-participatory_processes", Decidim::Nbs.version
end
