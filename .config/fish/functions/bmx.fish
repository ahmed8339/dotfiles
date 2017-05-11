# Logs into Bluemix.
function bmx
    cf api https://api.ng.bluemix.net
    cf login \
    -u ben.d.chatelain@kp.org \
    -o "Kaiser Permanente Bluemix PoC" \
    -s "CSDT Mobile Team" \
    $argv
end
