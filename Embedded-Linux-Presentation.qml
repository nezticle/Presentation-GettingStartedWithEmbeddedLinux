import QtQuick 2.1
import Qt.labs.presentation 1.0
import QtQuick.Controls 1.0
import QtQuick.Particles 2.0

ApplicationWindow {
    id: mainWindow
    width: 1280
    height: 720

    visible: true
    property bool fullscreen: false

    Presentation {
        anchors.fill: parent

        Keys.onPressed: {
            if(event.key === Qt.Key_F12) {
                //toggle fullscreen
                if (mainWindow.fullscreen)
                    mainWindow.showNormal();
                else
                    mainWindow.showFullScreen();
                mainWindow.fullscreen = !mainWindow.fullscreen;
            }
        }

        Rectangle {
            anchors.fill: parent
            antialiasing: true
            color: "#1e1b18"
        }

        Clock {
            id: clock
            textColor: "#80c342"
        }
        Image {
            id: digiaLogo
            source: "images/digia.png"
            anchors.bottom: parent.bottom;
            anchors.right: parent.right;
            anchors.margins: clock.font.pixelSize
        }

        titleColor: "#80c342"
        textColor: "#80c342"

        //showNotes: true

        Slide {
            centeredText: "Developing Embedded Linux Applications with Qt"
            fontScale: 2
            notes: "In this window you will see the notes for the very first slide..."
        }

        Slide {
            title: "Introduction"
            content: [
                "Andy Nichols",
                "Digia, plc",
                "Qt Developer",
                "freenode irc: nezticle",
                "twitter: @nezticle"
            ]


            FramedImage {
                height: 320
                width: 320
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 20
                source: "images/nezticle.jpeg"
                visibleFrame: false
            }
        }

        Slide {
            title: "Outline"
            content: [
                "Hardware",
                "Device Software",
                "Sysroots",
                "Toolchains",
                "Buildroot",
                "QtCreator",
                "Tips and Tricks"
            ]
        }

        Slide {
            centeredText: "Hardware"
            fontScale: 2
        }

        Slide {
            centeredText: "The CPU"
            fontScale: 2

            FramedImage {
                anchors.top: parent.top
                anchors.left: parent.left
                source: "images/ARM_powered_Badge.png"
                visibleFrame: false;
            }

            FramedImage {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                source: "images/MIPS_Technologies_logo.png"
                scale: 0.5
                visibleFrame: false;

            }

            FramedImage {
                anchors.top: parent.top
                anchors.right: parent.right
                source: "images/Intel_Atom_2009.png"
                visibleFrame: false
            }

        }

        Slide {
            title: "ARM"
            content: [
                "ARM9-10 \t\tARMv5TE",
                "ARM11 \t\t\tARMv6",
                "Cortex-A \t\t\tARMv7"
            ]
        }

        Slide {
            title: "System on a Chip (SoC)"
            notes: "http://en.wikipedia.org/wiki/System_on_a_chip"
            Image {
                anchors.centerIn: parent
                source: "images/OMAP3530.png"
                scale: 0.8
                smooth: true;
            }
        }

        Slide {
            id: gpuSlide

            Text {
                id: titleText
                anchors.centerIn: parent
                text: "The GPU"
                horizontalAlignment: Text.Center
                font.pixelSize: gpuSlide.baseFontSize * 4
                font.family: gpuSlide.fontFamily
                color: gpuSlide.textColor
                wrapMode: Text.Wrap
            }
        }

        Slide {
            title: "Imagination Technologies PowerVR"
            content: ["Beagleboard",
                "Apple Devices"]

            FramedImage {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 20
                source: "images/BeagleBoard.png"
                visibleFrame: false
            }
        }

        Slide {
            title: "Broadcom VideoCore"
            content: ["Raspberry Pi"]
            FramedImage {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 20
                visibleFrame: false
                source: "images/Raspberry_Pi_Photo.png"
            }

        }

        Slide {
            title: "Vivante"
            content: ["iMX6", "Google Chromecast"]
            FramedImage {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 20
                source: "images/iMX6_Blue.png"
                visibleFrame: false
            }

        }

        Slide {

            centeredText: "Wireless"
            fontScale: 2

            FramedImage {
                anchors.top: parent.top
                anchors.left: parent.left
                source: "images/Wi-Fi_Logo.png"
                visibleFrame: false;
            }

            FramedImage {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                source: "images/Bluetooth.png"
                visibleFrame: false;

            }

            FramedImage {
                anchors.top: parent.top
                anchors.right: parent.right
                source: "images/NFC-N-Mark-Logo.png"
                visibleFrame: false
            }


        }

        Slide {
            centeredText: "Device Software"
            fontScale: 2
        }

        Slide {
            title: "Bootloader"
            content: ["Das U-Boot", "multiple stages"]
        }

        Slide {
            title: "Linux Kernel"
            content: ["defconfig (eg arch/arm/configs/bcmrpi_defconfig)", "Kconfig (make menuconfig, make xconfig)", "zImage vs uImage", "firmware", "modules"]

            FramedImage {
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                source: "images/Tux.png"
                visibleFrame: false
            }
        }

        Slide {
            title: "Userland Filesystem"
            content: [
                "applicaitons",
                "libraries",
                "utilities and tools"
            ]
        }

        Slide {
            centeredText: "Sysroot"
            fontScale: 2
        }

        Slide {
            title: "What's in a Sysroot?"
            content: [
                "Development files",
                "Include headers",
                "*.so files",
                "Debug symbols"
            ]
        }

        Slide {
            title: "Toolchain"
            content: [
                "compilers",
                "host tools"
            ]
        }

        Slide {
            centeredText: "Getting the parts necessary for Embedded Linux Development"
            fontScale: 2
        }

        Slide {
            title: "Yocto Project"
            content: [
                "OpenEmbedded",
                "BitBake",
                "Poky",
                "meta-layers"
            ]
            Image {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                source: "images/yocto-project-transp.png"
            }
        }

        Slide {
            title: "Qt Enterprise Embedded"
            content: [
                "aka Boot to Qt",
                "Digia Embedded offering",
                "All tools necessary to get started",
                "Pregenerated image, sysroot, toolchain"
            ]
        }

        Slide {
            FramedImage {
                anchors.centerIn: parent
                id: buildrootLog
                source: "images/buildroot-logo.png"
                color: "white"
            }
        }

        Slide {
            centeredText: "Buildroot Demonstration"
            fontScale: 2
        }

        Slide {
            title: "Obtaining a toolchain"
            content: [
                "CodeSourcery",
                "Linaro",
                "Crosstool-NG"
            ]
        }

        Slide {
            title: "Selecting contents of filesystem"
            content: [
                "Dependencies of Qt 5 Modules",
                "Dependencies of your Application",
                "Dependencies of your hardware",
                "Busybox"
            ]
        }

        Slide {
            title: "Configuration of Linux Kernel"
            content: [
                "Version",
                "defconfig"
            ]
        }

        Slide {
            centeredText: "Now just run make to obtain an Image, Sysroot, and Toolchain"
        }

        Slide {
            centeredText: "Building Qt 5 yourself"
            fontScale: 2
        }

        Slide {
            title: "Understanding mkspecs"
            content: [
                "-platform",
                "-xplatform",
                "-device"
            ]
        }

        CodeSlide {
            title: "Raspberry Pi qmake.conf"
            codeFontFamily: "Courier"
            code: "#
# qmake configuration for Broadcom's Raspberry PI
# http://wiki.qt-project.org/Devices/RaspberryPi

include(../common/linux_device_pre.conf)

QT_QPA_DEFAULT_PLATFORM = wayland

QMAKE_LFLAGS           += -Wl,-rpath-link,$$[QT_SYSROOT]/opt/vc/lib

QMAKE_LIBDIR_OPENGL_ES2 = $$[QT_SYSROOT]/opt/vc/lib
QMAKE_LIBDIR_EGL        = $$QMAKE_LIBDIR_OPENGL_ES2

QMAKE_INCDIR_EGL        = $$[QT_SYSROOT]/opt/vc/include \
                          $$[QT_SYSROOT]/opt/vc/include/interface/vcos/pthreads \
                          $$[QT_SYSROOT]/opt/vc/include/interface/vmcs_host/linux
QMAKE_INCDIR_OPENGL_ES2 = $${QMAKE_INCDIR_EGL}

QMAKE_LIBS_EGL          = -lEGL -lGLESv2

contains(DISTRO, squeeze) {
    #Debian Squeeze: Legacy everything
    QMAKE_LIBS_OPENGL_ES2   = -lGLESv2 -lEGL
    QT_QPA_DEFAULT_PLATFORM = eglfs
} else:contains(DISTRO, arch) {
    #On principle: no wizardry required
} else {
    #This is not strictly necessary
    DISTRO_OPTS += deb-multi-arch
    DISTRO_OPTS += hard-float
}

QMAKE_CFLAGS           += \
                          -marm \
                          -mfpu=vfp \
                          -mtune=arm1176jzf-s \
                          -march=armv6zk \
                          -mabi=aapcs-linux

QMAKE_CXXFLAGS          = $$QMAKE_CFLAGS

EGLFS_PLATFORM_HOOKS_SOURCES = $$PWD/qeglfshooks_pi.cpp
EGLFS_PLATFORM_HOOKS_LIBS = -lbcm_host

include(../common/linux_arm_device_post.conf)

load(qt_config)
"
        }

        CodeSlide {
            title: "Raspberry Pi qeglfshooks.cpp"
            codeFontFamily: "Courier"
            code: "class QEglFSPiHooks : public QEglFSHooks
{
public:
    virtual void platformInit();
    virtual void platformDestroy();
    virtual EGLNativeDisplayType platformDisplay() const;
    virtual QSize screenSize() const;
    virtual EGLNativeWindowType createNativeWindow(const QSize &size, const QSurfaceFormat &format);
    virtual void destroyNativeWindow(EGLNativeWindowType window);
    virtual bool hasCapability(QPlatformIntegration::Capability cap) const;

    QEglFSCursor *createCursor(QEglFSScreen *screen) const {
        return new QEglFSPiCursor(screen);
    }
};

void QEglFSPiHooks::platformInit()
{
    bcm_host_init();
}

EGLNativeDisplayType QEglFSPiHooks::platformDisplay() const
{
    dispman_display = vc_dispmanx_display_open(0/* LCD */);
    return EGL_DEFAULT_DISPLAY;
}

void QEglFSPiHooks::platformDestroy()
{
    vc_dispmanx_display_close(dispman_display);
}

QSize QEglFSPiHooks::screenSize() const
{
    uint32_t width, height;
    graphics_get_display_size(0 /* LCD */, &width, &height);
    return QSize(width, height);
}

EGLNativeWindowType QEglFSPiHooks::createNativeWindow(const QSize &size, const QSurfaceFormat &format)
{
    return createDispmanxLayer(QPoint(0, 0), size, 1, format.hasAlpha() ? DISPMANX_FLAGS_ALPHA_FROM_SOURCE : DISPMANX_FLAGS_ALPHA_FIXED_ALL_PIXELS);
}

void QEglFSPiHooks::destroyNativeWindow(EGLNativeWindowType window)
{
    destroyDispmanxLayer(window);
}

bool QEglFSPiHooks::hasCapability(QPlatformIntegration::Capability cap) const
{
    switch (cap) {
        case QPlatformIntegration::ThreadedPixmaps:
        case QPlatformIntegration::OpenGL:
        case QPlatformIntegration::ThreadedOpenGL:
        case QPlatformIntegration::BufferQueueingOpenGL:
            return true;
        default:
            return false;
    }
}

QEglFSPiHooks eglFSPiHooks;
QEglFSHooks *platformHooks = &eglFSPiHooks;"
        }

        Slide {
            title: "Qt 5 configure options"
            writeInText: "export HOST_DIR=$BUILDROOT_DIR/host
export STAGING_DIR=$BUILDROOT_DIR/staging
export TARGET_DIR=$BUILDROOT_DIR/target

./configure -prefix /usr -hostprefix $HOST_DIR/usr -release -device pi -device-option CROSS_COMPILE=$HOST_DIR/usr/bin/arm-raspberrypi-linux-gnueabi- -sysroot $STAGING_DIR -no-neon"
        }

        Slide {
            title: "Building, Installation, Deployment"
            content: [
                "make",
                "make install",
                "qmake",
                "copy new libs to device image"
            ]
        }

        Slide {
            centeredText: "Demonstration: Setting up QtCreator"
        }

        Slide {
            centeredText: "Tips and Tricks"
            fontScale: 2
        }

        Slide {
            title: "EGLFS"
            content: ["Single top level EGL window surface"]
        }

        Slide {
            title: "EGLFS Environment Variables"
            content: ["QT_QPA_EGLFS_HIDECURSOR",
                "QT_QPA_EGLFS_SWAPINTERVAL",
                "QT_QPA_EGLFS_PHYSICAL_{WIDTH/HEIGHT}",
                "QT_QPA_EGLFS_{WIDTH/HEIGHT/DEPTH}",
                "QT_QPA_EGLFS_CURSOR"]
        }

        Slide {
            title: "QtWayland"
            content: [
                "Multiple window surfaces",
                "Window compositors"
            ]
        }

        Slide {
            title: "Qt Modules to avoid"
            content: [
                "QtQuick1",
                "QtScript",
                "QtWidgets"
            ]
        }

        Slide {
            centeredText: "Questions?"
            fontScale: 2
        }

        Slide {
            title: "Contact info"
            content: [
                "andy.nichols@digia.com",
                "freenode IRC: nezticle",
                "twitter: @nezticle"
            ]
        }
    }
}
