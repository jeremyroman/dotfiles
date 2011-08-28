class DotFiles < Thor
  include Thor::Actions
  source_root "~/.dotfiles"
  namespace :dotfiles

  desc "setup", "Gets ready to maintain dotfiles"
  def setup
    run "thor install \"#{__FILE__}\" --as dotfiles --force >/dev/null"
    inside "~/.dotfiles" do
      run "git submodule init"
    end
  end

  desc "install", "Installs the dotfiles"
  method_options :force => :boolean
  def install
    overrides = {"Thorfile" => false, "ssh_config" => ".ssh/config"}

    for file in dotfiles
      if overrides[file] != false
        dest = overrides[file] || ".#{file}"

        if File.directory?(dest) and not File.symlink?(dest)
          link_directory file, dest, options[:force]
        else
          link_file file, dest, options[:force]
        end
      end
    end
  end

  desc "update", "Updates the dotfiles"
  def update
    inside "~/.dotfiles" do
      run "git pull"
      run "git submodule update"
      run "thor dotfiles:setup"
    end

    run "thor dotfiles:install"
  end

  private

  def dotfiles
    dotfiles_dir = File.expand_path("~/.dotfiles")
    Dir.chdir(dotfiles_dir) { Dir["*"] }
  end
end

module ::Thor::Actions
  def link_directory(source, *args, &block)
    config = args.last.is_a?(Hash) ? args.pop : {}
    destination = args.first || source
    source = File.expand_path(find_in_source_paths(source.to_s))
    action LinkDirectory.new(self, destination, source, config)
  end

  class LinkDirectory < CreateLink
    def invoke!
      invoke_with_conflict_check do
        FileUtils.mkdir_p(File.dirname(destination))
        FileUtils.rm_rf(destination) if exists?
        File.symlink(render, destination)
      end
      given_destination
    end
  end
end
