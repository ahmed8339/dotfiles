# Displays information about the current user.
function user
    printf "%s: %s <%s> [signingKey: %s]\n" \
        $USER \
        (user.name) \
        (user.email) \
        (user.signingkey) $argv
end
