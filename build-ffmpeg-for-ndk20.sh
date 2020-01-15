#!/bin/bash
make clean
# set -x
API=22
ARCH=arm
CPU=armeabi-v7a
PLATFORM=armv7a
TARGET=$PLATFORM-linux-androideabi
NDK=/Users/zhangqiang/Library/Android/sdk/ndk/20.1.5948944
SYSROOT=$NDK/platforms/android-$API/arch-arm
TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/darwin-x86_64/bin
PREFIX=$(pwd)/../android-ffmpeglibs-ndk20/$CPU
export ADDI_CFLAGS="-marm"
CFLAG="-D__ANDROID_API__=$API -U_FILE_OFFSET_BITS -DBIONIC_IOCTL_NO_SIGNEDNESS_OVERLOAD -Os -fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated -mfloat-abi=softfp -marm"

function function_one
{
./configure \
  --prefix=$PREFIX \
  --disable-shared \
  --enable-static \
  --disable-doc \
  --disable-ffplay \
  --disable-ffprobe \
  --disable-symver \
  --disable-ffmpeg \
  --disable-programs \
  --disable-avdevice \
  --disable-swresample \
  --disable-swscale \
  --disable-avfilter \
  --disable-postproc \
  --disable-audiotoolbox \
  --disable-videotoolbox \
  --disable-appkit \
  --disable-bzlib \
  --disable-iconv \
  --disable-securetransport \
  --disable-avfoundation \
  --disable-coreimage \
  --disable-sdl2 \
  --disable-zlib \
  --disable-x86asm \
  --disable-asm \
  --disable-decoder=opus \
  --disable-filters \
  --disable-demuxers \
  --enable-demuxer=mp3 \
  --enable-demuxer=flv \
  --enable-demuxer=h264 \
  --enable-demuxer=rtp \
  --enable-demuxer=rtsp \
  --enable-demuxer=sdp \
  --enable-demuxer=mlv \
  --enable-demuxer=aac \
  --enable-demuxer=mov \
  --disable-protocols \
  --enable-protocol=http \
  --enable-protocol=rtp \
  --enable-protocol=udp \
  --enable-protocol=file \
  --enable-protocol=srtp \
  --enable-protocol=md5 \
  --enable-protocol=rtmp \
  --enable-protocol=tcp \
  --disable-devices \
  --disable-muxers \
  --enable-muxer=flv \
  --enable-muxer=h264 \
  --enable-muxer=mov \
  --enable-muxer=mp3 \
  --enable-muxer=mp4 \
  --enable-muxer=rtp \
  --enable-muxer=rtsp \
  --disable-decoders \
  --enable-decoder=aac \
  --enable-decoder=h264 \
  --enable-decoder=flv \
  --enable-decoder=mp3 \
  --disable-encoders \
  --enable-encoder=aac \
  --enable-encoder=mpeg4 \
  --ln_s="cp -rf" \
  --cc=$TOOLCHAIN/$TARGET$API-clang \
  --cxx=$TOOLCHAIN/$TARGET$API-clang++ \
  --ld=$TOOLCHAIN/$TARGET$API-clang \
  --cross-prefix=$TOOLCHAIN/$ARCH-linux-androideabi- \
  --target-os=android \
  --arch=arm \
  --enable-cross-compile \
  --extra-cflags="$CFLAG" \
  --extra-ldflags="$ADDI_LDFLAGS"



make clean all
make
make install
}

function_one
