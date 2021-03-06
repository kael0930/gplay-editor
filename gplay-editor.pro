#--------------------------------------------------------------------
# path to gplay engine
#--------------------------------------------------------------------
PRE_TARGETDEPS += $$PWD/../GPlayEngine/setup.pri
include($$PWD/../GPlayEngine/setup.pri)

#--------------------------------------------------------------------
# project
#--------------------------------------------------------------------
QT += core gui widgets charts
TARGET = gplay-editor
TEMPLATE = app
CONFIG += c++14
CONFIG -= console
CONFIG += windows
CONFIG += no_keywords

DESTDIR = $$GPLAY_OUTPUT_DIR/bin
QMAKE_CLEAN += $$DESTDIR/$$TARGET

CONFIG(debug, debug|release):
    DEFINES += _DEBUG QT_NO_KEYWORDS
    #DEFINES += GP_USE_MEM_LEAK_DETECTION

INCLUDEPATH += $$GPLAY_OUTPUT_DIR/include/gplayengine/
INCLUDEPATH += $$GPLAY_OUTPUT_DIR/include/gplayengine/thirdparty

# nodes editor library
# build nodeeditor with : cmake .. -DCMAKE_PREFIX_PATH=/opt/Qt5.11.1/5.11.1/gcc_64 -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF
DEFINES += NODE_EDITOR_STATIC
INCLUDEPATH += 3rdparty/nodeeditor/include
LIBS += -L$$PWD/3rdparty/nodeeditor/BUILD/lib -lnodes

#--------------------------------------------------------------------
# platform specific
#--------------------------------------------------------------------
linux: {
    QT += x11extras
    DEFINES += __linux__
    PRE_TARGETDEPS += $$GPLAY_OUTPUT_DIR/lib/libgplay-deps.a
    PRE_TARGETDEPS += $$GPLAY_OUTPUT_DIR/lib/libgplay.a
    LIBS += -L$$GPLAY_OUTPUT_DIR/lib/ -lgplay
    LIBS += -L$$GPLAY_OUTPUT_DIR/lib/thirdparty/ -lgplay-deps
    LIBS += -lm -lGL -lrt -ldl -lX11 -lpthread -lsndio
    QMAKE_CXXFLAGS += -Wno-unused-parameter
}

# force qmake
#qmakeforce.target = dummy
#qmakeforce.commands = rm -f Makefile ##to force rerun of qmake
#qmakeforce.depends = FORCE
#PRE_TARGETDEPS += $$qmakeforce.target
#QMAKE_EXTRA_TARGETS += qmakeforce



#--------------------------------------------------------------------
# files
#--------------------------------------------------------------------
SOURCES += \
    src/node-editor/common/BaseNode.cpp \
    src/node-editor/common/Color.cpp \
    src/node-editor/common/CommentGraphicsItem.cpp \
    src/node-editor/common/CustomFlowScene.cpp \
    src/node-editor/common/CustomWidgets.cpp \
    src/node-editor/common/Parameter.cpp \
    src/node-editor/common/ParamWidget.cpp \
    src/node-editor/common/Path.cpp \
    src/node-editor/common/TrackEdit.cpp \
    src/node-editor/common/Types.cpp \
    src/node-editor/spark-nodes/SpkEmitters.cpp \
    src/node-editor/spark-nodes/SpkInterpolators.cpp \
    src/node-editor/spark-nodes/SpkModifiers.cpp \
    src/node-editor/spark-nodes/SpkSystem.cpp \
    src/node-editor/spark-nodes/SpkZones.cpp \
    src/node-editor/spark-nodes/SparkNodesRegistry.cpp \
    src/GraphView.cpp \
    src/main.cpp \
    src/MainWindow.cpp \
    src/gp3d/helpers/FirstPersonCamera.cpp \
    src/gp3d/helpers/Grid.cpp \
    src/gp3d/GPRenderer.cpp \
    src/gp3d/PlatformQt.cpp \
    src/gp3d/QtImGui.cpp \
    src/GplayDevice.cpp \
    src/node-editor/spark-nodes/SpkUtils.cpp \
    src/node-editor/spark-nodes/SparkNodeRender.cpp

HEADERS += \
    src/node-editor/common/BaseNode.h \
    src/node-editor/common/Color.h \
    src/node-editor/common/CommentGraphicsItem.h \
    src/node-editor/common/CustomFlowScene.h \
    src/node-editor/common/CustomWidgets.h \
    src/node-editor/common/Nodestyle.h \
    src/node-editor/common/Parameter.h \
    src/node-editor/common/ParamWidget.h \
    src/node-editor/common/Path.h \
    src/node-editor/common/Trackedit.h \
    src/node-editor/common/Types.h \
    src/node-editor/spark-nodes/SpkEmitters.h \
    src/node-editor/spark-nodes/SpkInterpolators.h \
    src/node-editor/spark-nodes/SpkModifiers.h \
    src/node-editor/spark-nodes/SpkSystem.h \
    src/node-editor/spark-nodes/SpkZones.h \
    src/node-editor/spark-nodes/SparkNodesRegistry.h \
    src/benchmark.h \
    src/GraphView.h \
    src/MainWindow.h \
    src/node-editor/spark-nodes/spark-nodes.h \
    src/gp3d/helpers/FirstPersonCamera.h \
    src/gp3d/helpers/Grid.h \
    src/gp3d/helpers/Events.h \
    src/gp3d/GPRenderer.h \
    src/gp3d/QtImGui.h \
    src/gp3d/PlatformQt.h \
    src/GplayDevice.h \
    src/node-editor/spark-nodes/SpkUtils.h \
    src/node-editor/spark-nodes/SparkNodeRender.h



