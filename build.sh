list=` find . -name "Android.mk" `
for alpha in $list;do
    currDir=$(cd "$(dirname $alpha)"; pwd)  
    ndk-build NDK_PROJECT_PATH=$currDir APP_BUILD_SCRIPT=$currDir/Android.mk APP_ALLOW_MISSING_DEPS=true clean
    ndk-build NDK_PROJECT_PATH=$currDir APP_BUILD_SCRIPT=$currDir/Android.mk APP_ALLOW_MISSING_DEPS=true APP_PLATFORM=android-14 APP_ABI=all
done
outDir=./out
rm -rf $outDir
mkdir $outDir
#rm -rf ` find $outDir -name "*webrtc*" `
cp -r ` find . -name "obj" ` $outDir