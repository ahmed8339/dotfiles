# Reloads fish configuration or a single autoloaded function.
function reload --argument-names function_name
    if test -z $function_name
        source ~/.config/fish/config.fish
        return
    else if functions --query $function_name
        source ~/.config/fish/functions/$function_name.fish
        func $function_name
    else
        echo "$function_name does not exist in function autoload dir."
        return 1
    end
end