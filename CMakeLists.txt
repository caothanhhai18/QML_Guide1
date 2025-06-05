cmake_minimum_required(VERSION 3.16)

project(QML_Guide1 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core5Compat  Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appQML_Guide1
    main.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQML_Guide1 PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQML_Guide1
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

include(qmlmodules)

target_link_libraries(appQML_Guide1
    PRIVATE
    Qt6::Quick
    Qt6::QuickControls2
    Qt6::Core5Compat
)

include(GNUInstallDirs)
install(TARGETS appQML_Guide1
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

