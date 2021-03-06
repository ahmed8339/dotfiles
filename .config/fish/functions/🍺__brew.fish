# Updates Homebrew and installed formulae.
#
# Sequencing
# - Requires ruby, but works with system ruby.
function 🍺__brew
    echo "🍺  Homebrew - https://brew.sh"
    echo

    set -l custom_shells bash fish zsh

    set -l formulae \
        antigen \
        artifactory \
        artifactory-cli-go \
        autoconf \
        automake \
        babel \
        burl \
        carthage \
        certbot \
        vitorgalvao/tiny-scripts/cask-repair \
        cloc \
        cloudfoundry/tap/cf-cli \
        cmake \
        configen \
        coreutils \
        cowsay \
        curl \
        diff-so-fancy \
        direnv \
        docker \
        docker-compose \
        docker-machine \
        duti \
        findutils \
        fortune \
        gcovr \
        git \
        git-lfs \
        gnupg \
        go-jira \
        goaccess \
        gradle \
        groovy \
        heroku \
        hub \
        imagemagick \
        infer \
        jenv \
        jfrog-cli-go \
        jq \
        jsonlint \
        jsonpp \
        kotlin \
        kubernetes-helm \
        less \
        libssh2 \
        libtool \
        thoughtbot/formulae/liftoff \
        mas \
        maven \
        mint \
        mtr \
        nginx \
        ninja \
        node \
        nvm \
        packer \
        pacvim \
        pkg-config \
        postgresql \
        python3 \
        qemu \
        rename \
        ruby \
        screenresolution \
        shellcheck \
        sloccount \
        socat \
        sonar-scanner \
        sourcekitten \
        speedtest-cli \
        kylef/formulae/swiftenv \
        swiftgen \
        swiftlint \
        swiftplate \
        tailor \
        telnet \
        terminal-notifier \
        thefuck \
        tig \
        tmux \
        trash \
        travis \
        tree \
        uncrustify \
        utimer \
        vapor/tap/toolbox \
        wget \
        xctool \
        yarn \
        $custom_shells

    set -l formulae_no_flags (list -s $formulae)

    # Cleaning macvim with options generates error
    # Error: No available formula with the name "macvim --with-override-system-vim"
    set -l no_clean_formulae macvim ruby

    set -l uninstall android-sdk pivotal/tap/cloudfoundry-cli vim

    # --------------------------------------------------------------------------
    #
    # Preflight Checks
    #
    # --------------------------------------------------------------------------

    # Verify the user owns the Homebrew dir.
    if test $USER != (fileowner (brew_home)/Homebrew)
        if status is-login
            echo "You must be the owner of "(brew_home)"/Homebrew to run this command."
        end
        return 1
    end

    # Ensure Homebrew is installed.
    if not which -s brew
        echo "Installing Homebrew"
        ruby -e "(curl -fsSL 'https://raw.githubusercontent.com/Homebrew/install/master/install')"
    end

    # Update Homebrew
    brew update
    set -l installed (brew list --full-name)

    # --------------------------------------------------------------------------
    #
    # Uninstall
    #
    # --------------------------------------------------------------------------

    # Uninstall unwanted formulae
    set -l to_uninstall
    for formula in $uninstall
        if contains $formula $installed
            set to_uninstall $to_uninstall $formula
        end
    end
    if test -n "$to_uninstall"
        brew uninstall $to_uninstall
    end

    # --------------------------------------------------------------------------
    #
    # Upstall
    #
    # --------------------------------------------------------------------------

    # Update installed formulae
    set -l outdated_formulae (brew outdated)
    echo $outdated_formulae | tr ' ' \n
    brew upgrade

    # Install new formula
    set -l not_installed
    for formula in $formulae
        # Split flags off of formula name for is-installed check
        set -l formula_name (list -s $formula)
        if not contains $formula_name[1] $installed
            # Include formula flags when installing
            set not_installed $not_installed $formula
        end
    end
    if test -n "$not_installed"
        for formula in $not_installed
            echo "Installing $formula"
            brew install (list -s $formula)
        end
    end

    # --------------------------------------------------------------------------
    #
    # MacVIM
    #
    # --------------------------------------------------------------------------

    # MacVIM installed after all formulae because of issues with powerline in vim when python is updated
    # https://github.com/editorconfig/editorconfig/wiki/FAQ#when-using-the-vim-plugin-i-got-e887-sorry-this-command-is-disabled-the-pythons-site-module-could-not-be-loaded
    brew reinstall macvim --with-override-system-vim

    # --------------------------------------------------------------------------
    #
    # Post Install
    #
    # --------------------------------------------------------------------------

    # Git LFS
    if contains git-lfs $outdated_formulae
        # Update global git config
        git lfs install

        # Update system git config
        git lfs install --system
    end

    # Ruby
    set -l desired_ruby 2.5.1
    set -l previous_version 2.5.0_2
    set -l ruby_versions (brew_versions ruby)
    if not test $desired_ruby = (brew_active_version ruby)
        if contains -- $desired_ruby $ruby_versions
            brew switch ruby $desired_ruby
            brew link --overwrite ruby
            brew unlink ruby; and brew link --overwrite ruby

            # May need to purge old gems
            # http://stackoverflow.com/questions/9434002/how-to-solve-ruby-installation-is-missing-psych-error#answer-43843417
            set -l path (brew_home)/lib/ruby/gems/$previous_version/extensions
            if test $USER != (fileowner $path)
                echo "Fixing permissions on $path"
                sudo chown -R $USER (brew_home)/lib/ruby
                and rm -rf (brew_home)/lib/ruby/gems/
                and brew reinstall ruby
                # Postinstall shows permission errors
                or brew postinstall ruby
            end
        else
            echo "Ruby $desired_ruby is not installed."
        end
    end

    # Check whether custom shells are registered
    set -l system_shells_file /etc/shells
    set -l brew_binaries (brew_home)/bin
    set -l system_shells (grep "^$brew_binaries" $system_shells_file)
    for shell in $custom_shells
        set -l shell_path $brew_binaries/$shell
        if not contains $shell_path $system_shells
            if user_is_admin
                echo "Adding $shell_path to $system_shells_file"
                sudo sh -c 'echo '$shell_path' >> '$system_shells_file
            else
                echo "An admin needs to register $shell_path in $system_shells_file before it can be used."
            end
        end
    end

    # Update firewall rules if a new version of nginx was installed
    if contains "nginx" $outdated_formulae
        echo
        firewall_allow_nginx
    end

    # Cleanup
    for formula in $no_clean_formulae
        if contains $formula $formulae_no_flags
            set -l index (contains --index $formula $formulae_no_flags)
            set --erase formulae[$index]
        end
    end
    # Cleanup the remaining formulae
    brew cleanup --prune=30 $formulae_no_flags

    # Doctor
    brew doctor

    # Info
    brew info
end
