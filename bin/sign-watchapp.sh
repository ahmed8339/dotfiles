#!/bin/bash

# sign-watchapp.sh

# Xcode CodeSign Build Steps
# -----
# CodeSign /Volumes/DerivedData/EveryBodyWalk-fqzvnyhkiaxqegaldrrbrptjpjsl/Build/Intermediates/ArchiveIntermediates/Alpha/IntermediateBuildFilesPath/UninstalledProducts/EveryBodyWalkWatchApp.app
#     cd /Users/phatblat/dev/ios/EBW
#     export CODESIGN_ALLOCATE=/Applications/Xcode6.3.2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/codesign_allocate
#     export PATH="/Applications/Xcode6.3.2.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin:/Applications/Xcode6.3.2.app/Contents/Developer/usr/bin:/usr/local/var/rbenv/shims:/usr/local/opt/rbenv/bin:/Users/phatblat/bin:/usr/local/bin:/usr/local/var/rbenv/shims:/usr/local/opt/rbenv/bin:/usr/local/var/rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Server.app/Contents/ServerRoot/usr/bin:/Applications/Server.app/Contents/ServerRoot/usr/sbin:/usr/local/var/rbenv/versions/2.1.4/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    
# Signing Identity:     "iPhone Distribution: Kaiser Permanente (Ent)/"

#     /usr/bin/codesign --force --sign 3563842FCF0F2788D5D36B59C4C4A06B8AB538B8 --entitlements /Volumes/DerivedData/EveryBodyWalk-fqzvnyhkiaxqegaldrrbrptjpjsl/Build/Intermediates/ArchiveIntermediates/Alpha/IntermediateBuildFilesPath/EveryBodyWalk.build/Debug-iphoneos/EveryBodyWalk\ Watch\ App.build/EveryBodyWalkWatchApp.app.xcent /Volumes/DerivedData/EveryBodyWalk-fqzvnyhkiaxqegaldrrbrptjpjsl/Build/Intermediates/ArchiveIntermediates/Alpha/IntermediateBuildFilesPath/UninstalledProducts/EveryBodyWalkWatchApp.app

# /Volumes/DerivedData/EveryBodyWalk-fqzvnyhkiaxqegaldrrbrptjpjsl/Build/Intermediates/ArchiveIntermediates/Alpha/IntermediateBuildFilesPath/UninstalledProducts/EveryBodyWalkWatchApp.app: replacing existing signature
# -----
# CodeSign /Volumes/DerivedData/EveryBodyWalk-fqzvnyhkiaxqegaldrrbrptjpjsl/Build/Intermediates/ArchiveIntermediates/Alpha/IntermediateBuildFilesPath/UninstalledProducts/EveryBodyWalkWatchKitExtension.appex
#     cd /Users/phatblat/dev/ios/EBW
#     export CODESIGN_ALLOCATE=/Applications/Xcode6.3.2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/codesign_allocate
#     export PATH="/Applications/Xcode6.3.2.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin:/Applications/Xcode6.3.2.app/Contents/Developer/usr/bin:/usr/local/var/rbenv/shims:/usr/local/opt/rbenv/bin:/Users/phatblat/bin:/usr/local/bin:/usr/local/var/rbenv/shims:/usr/local/opt/rbenv/bin:/usr/local/var/rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Server.app/Contents/ServerRoot/usr/bin:/Applications/Server.app/Contents/ServerRoot/usr/sbin:/usr/local/var/rbenv/versions/2.1.4/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    
# Signing Identity:     "iPhone Distribution: Kaiser Permanente (Ent)/"

#     /usr/bin/codesign --force --sign 3563842FCF0F2788D5D36B59C4C4A06B8AB538B8 --entitlements /Volumes/DerivedData/EveryBodyWalk-fqzvnyhkiaxqegaldrrbrptjpjsl/Build/Intermediates/ArchiveIntermediates/Alpha/IntermediateBuildFilesPath/EveryBodyWalk.build/Debug-iphoneos/EveryBodyWalk\ WatchKit\ Extension.build/EveryBodyWalkWatchKitExtension.appex.xcent /Volumes/DerivedData/EveryBodyWalk-fqzvnyhkiaxqegaldrrbrptjpjsl/Build/Intermediates/ArchiveIntermediates/Alpha/IntermediateBuildFilesPath/UninstalledProducts/EveryBodyWalkWatchKitExtension.appex
# -----
# CodeSign /Volumes/DerivedData/EveryBodyWalk-fqzvnyhkiaxqegaldrrbrptjpjsl/Build/Intermediates/ArchiveIntermediates/Alpha/InstallationBuildProductsLocation/Applications/EveryBodyWalk.app
#     cd /Users/phatblat/dev/ios/EBW
#     export CODESIGN_ALLOCATE=/Applications/Xcode6.3.2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/codesign_allocate
#     export PATH="/Applications/Xcode6.3.2.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin:/Applications/Xcode6.3.2.app/Contents/Developer/usr/bin:/usr/local/var/rbenv/shims:/usr/local/opt/rbenv/bin:/Users/phatblat/bin:/usr/local/bin:/usr/local/var/rbenv/shims:/usr/local/opt/rbenv/bin:/usr/local/var/rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Server.app/Contents/ServerRoot/usr/bin:/Applications/Server.app/Contents/ServerRoot/usr/sbin:/usr/local/var/rbenv/versions/2.1.4/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    
# Signing Identity:     "iPhone Distribution: Kaiser Permanente (Ent)/"
# Provisioning Profile: "Every Body Walk Alpha"
#                       (5de0a25c-778f-466b-a20f-be5e6f540129)

#     /usr/bin/codesign --force --sign 3563842FCF0F2788D5D36B59C4C4A06B8AB538B8 --entitlements /Volumes/DerivedData/EveryBodyWalk-fqzvnyhkiaxqegaldrrbrptjpjsl/Build/Intermediates/ArchiveIntermediates/Alpha/IntermediateBuildFilesPath/EveryBodyWalk.build/Debug-iphoneos/EveryBodyWalk.build/EveryBodyWalk.app.xcent /Volumes/DerivedData/EveryBodyWalk-fqzvnyhkiaxqegaldrrbrptjpjsl/Build/Intermediates/ArchiveIntermediates/Alpha/InstallationBuildProductsLocation/Applications/EveryBodyWalk.app

export CODESIGN_ALLOCATE=/Applications/Xcode6.3.2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/codesign_allocate

build_dir=/Users/phatblat/dev/ios/EBW/build
echo "build_dir: $build_dir"

# codesign_identity="3563842FCF0F2788D5D36B59C4C4A06B8AB538B8"
codesign_identity="iPhone Distribution: Kaiser Permanente (Ent)/"
echo "codesign_identity: $codesign_identity"

codesign --force --sign "${codesign_identity}" --entitlements ${build_dir}/Payload/EveryBodyWalk.app/PlugIns/EveryBodyWalkWatchKitExtension.appex/EveryBodyWalkWatchApp.app/archived-expanded-entitlements.xcent ${build_dir}/Payload/EveryBodyWalk.app/PlugIns/EveryBodyWalkWatchKitExtension.appex/EveryBodyWalkWatchApp.app
codesign --force --sign "${codesign_identity}" --entitlements ${build_dir}/Payload/EveryBodyWalk.app/PlugIns/EveryBodyWalkWatchKitExtension.appex/archived-expanded-entitlements.xcent ${build_dir}/Payload/EveryBodyWalk.app/PlugIns/EveryBodyWalkWatchKitExtension.appex
codesign --force --sign "${codesign_identity}" --entitlements ${build_dir}/Payload/EveryBodyWalk.app/archived-expanded-entitlements.xcent ${build_dir}/Payload/EveryBodyWalk.app
