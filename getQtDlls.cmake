MACRO(GetQtDLLs DEBUG_NAME RELEASE_NAME)
FOREACH(module 
    QT3SUPPORT      QTOPENGL        QTASSISTANT 
    QTDESIGNER      QTMOTIF         QTNSPLUGIN
    QAXSERVER       QAXCONTAINER    QTDECLARATIVE   
    QTSCRIPT        QTSVG           QTUITOOLS 
    QTHELP          QTWEBKIT        PHONON 
    QTSCRIPTTOOLS   QTMULTIMEDIA    QTGUI 
    QTTEST          QTDBUS          QTXML 
    QTSQL           QTXMLPATTERNS   QTNETWORK 
    QTCORE
)
    if (QT_USE_${module} OR QT_USE_${module}_DEPENDS)
        string(REPLACE ".lib" ".dll" QT_${module}_DLL
               "${QT_${module}_LIBRARY_DEBUG}")
        set (${DEBUG_NAME} ${${DEBUG_NAME}} ${QT_${module}_DLL})
        string(REPLACE ".lib" ".dll" QT_${module}_DLL
               "${QT_${module}_LIBRARY_RELEASE}")
        set (${RELEASE_NAME} ${${RELEASE_NAME}}
             ${QT_${module}_DLL})
    endif()
ENDFOREACH(module)
ENDMACRO()

if (WIN32)
    GetQtDLLs(DEBUG_DLLS RELEASE_DLLS)
    if (${CMAKE_GENERATOR} MATCHES "Visual Studio 11")
# visual studio 12 expects the DLLs in the executable folder.
# but not the resources!
# can be changed into the environment property of the project to include the project's directory
        set (DLL_TO_DBG ${CMAKE_CURRENT_BINARY_DIR}/Debug)
        set (DLL_TO_RELEASE ${CMAKE_CURRENT_BINARY_DIR}/Release)
    else()
# for other version of visual studio the DLLs are expected into the project folder
        set (DLL_TO_DBG ${CMAKE_CURRENT_BINARY_DIR})
        set (DLL_TO_RELEASE ${CMAKE_CURRENT_BINARY_DIR})
    endif()

    foreach(dll ${DEBUG_DLLS})
        file(COPY ${dll} DESTINATION ${DLL_TO_DBG})
    endforeach()
    
    foreach(dll ${RELEASE_DLLS})
        file(COPY ${dll} DESTINATION ${DLL_TO_RELEASE})
    endforeach()

    #install(FILES ${RELEASE_DLLS} DESTINATION
    #        ${INSTALL_FELIXPARAMGUI_PATH} CONFIGURATIONS Release)
# this is disabled for debug only (so signal/slots connect failures are seen)!
# this property is used to remove the prompt window when running the GUI from the explorer on WIN32
# doesn't have effect on linux
    #set_target_properties(FelixParamGui PROPERTIES WIN32_EXECUTABLE
    #                      ${FELIXPARAMGUI_WIN32EXE})
endif()