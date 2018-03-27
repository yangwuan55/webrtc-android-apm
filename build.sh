list=` find . -name "Android.mk" `
for alpha in $list;do
    currDir=$(cd "$(dirname $alpha)"; pwd)  
    ndk-build NDK_PROJECT_PATH=$currDir APP_BUILD_SCRIPT=$currDir/Android.mk APP_ALLOW_MISSING_DEPS=true clean
    ndk-build NDK_PROJECT_PATH=$currDir APP_BUILD_SCRIPT=$currDir/Android.mk APP_ALLOW_MISSING_DEPS=true
done

cd ~/kaochong/AndroidLiveSdk/lib-speex/libs/
rm -rf ` find . -name "*webrtc*" `
cd -
cp -r ` find . -name "obj" ` ~/kaochong/AndroidLiveSdk/lib-speex/libs/