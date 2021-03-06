# Switch the active version of Xcode.
function xcswitch --argument-names version
    if not user_is_admin
        echo "You must be an admin to run this command."
        return 1
    end

    if test -z $version
        echo "Usage: xcswitch <version>"
        echo "Version format: 8.3.2"
        return 1
    end

    set -l xcode_path /Applications/Xcode-$version.app
    if not test -e $xcode_path
        echo $xcode_path does not exist.
        return 2
    end

    echo "Activating Xcode Version: $version"

    # Switch the version of Xcode on the system.
    xcss $xcode_path

    # Creat a symlink so tools, like SwiftLint, that assume Xcode was
    # Installed via the MAS use the correct version.
    pushd /Applications
    ln -fhs (basename $xcode_path) Xcode.app
    popd

    xclist
    echo "Activated "(string sub --length (string length $xcode_path) (xcsp))
end
