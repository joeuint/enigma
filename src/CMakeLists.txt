add_executable(enigma)

find_package(Botan REQUIRED)

ecm_add_qml_module(enigma
    URI
    com.josephumana.enigma
)

target_sources(enigma
    PRIVATE
    main.cpp
)

ecm_target_qml_sources(enigma
    SOURCES
    Main.qml
)

target_link_libraries(enigma
    PRIVATE
    Qt6::Quick
    Qt6::Qml
    Qt6::Gui
    Qt6::QuickControls2
    Qt6::Widgets
    KF6::I18n
    KF6::CoreAddons
    KF6::IconThemes
    Botan::Botan
)

install(TARGETS enigma ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
