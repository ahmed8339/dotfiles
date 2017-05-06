
# null
function lintlib
    pod lib lint --sources=git@github.kp.org:internal-pods/specs,git@github.kp.org:mirrored-pods/specs,git@github.kp.org:internal-pods/development-specs,git@github.kp.org:F978034/KPMobileSpecs --use-libraries --private --allow-warnings
end
