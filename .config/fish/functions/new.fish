# 
function new
    git log $1@{1}..$1@{0} "$@" $argv
end

