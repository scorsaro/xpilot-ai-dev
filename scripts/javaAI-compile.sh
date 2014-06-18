#! /bin/bash
# Sophia Corsaro
# modified from linux 1.0 install bash
# compile Java library

wget http://xpilot-ai.org/downloads/xpilot-ai-1.1/javaAI.java
javac javaAI.java
javah -jni javaAI
gcc -fPIC -O -I../common/ -I../../lib/ -I/usr/lib/jvm/java-7-openjdk-amd64/include/ -I/usr/lib/jvm/java-7-openjdk-amd64/include/linux -I/usr/lib/jvm/java-7-openjdk-i386/include/ -I/usr/lib/jvm/java-7-openjdk-i386/include/linux -Dlinux -D__i386__ -D_POSIX_C_SOURCE=199309L -D_POSIX_SOURCE -D_XOPEN_SOURCE -D_BSD_SOURCE -D_SVID_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -DFUNCPROTO=15 -DNARROWPROTO -DWINDOWSCALING -c -o javaAI.o javaAI.c
gcc -o libjavaAI.so -fPIC -shared -Wl,-soname,libjavaAI.so -O about.o blockbitmaps.o caudio.o clientAI.o colors.o configure.o datagram.o dbuff.o defaultAI.o gfx2d.o gfx3d.o guimap.o guiobjects.o join.o netclient.o paint.o paintdataAI.o painthudAI.o paintmap.o paintobjects.o paintradar.o query.o record.o sim.o syslimit.o talk.o talkmacros.o textinterface.o texture.o usleep.o welcome.o widget.o xeventhandlers.o xevent.o xinit.o javaAI.o xpilotAI.o xpmread.o ../common/libxpcommon.a -lX11 -lm
mv javaAI.java ../../../xpilot-ai/java
mv libjavaAI.so ../../../xpilot-ai/java
