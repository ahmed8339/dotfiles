# 
function setJdk6
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.6) $argv
end

