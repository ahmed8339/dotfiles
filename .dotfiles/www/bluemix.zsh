#-------------------------------------------------------------------------------
#
# www/bluemix.zsh
# Bluemix configuration
#
#-------------------------------------------------------------------------------

lj info 'www/bluemix.zsh'

cf api https://api.ng.bluemix.net
cf login -u ben.d.chatelain@kp.org -o "Kaiser Permanente Bluemix PoC" -s "CSDT Mobile Team"
