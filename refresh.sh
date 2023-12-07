rm -rf "/Users/o.guney/Desktop/Repos/sigmavpnflutter/ios/.symlinks"
rm -rf "/Users/o.guney/Desktop/Repos/sigmavpnflutter/ios/Pods"
rm -rf "/Users/o.guney/Desktop/Repos/sigmavpnflutter/ios/Podfile.lock"
flutter clean
flutter pub get
cd ios
arch -x86_64 pod install
