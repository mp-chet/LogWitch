CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/GenerateIfo.h.in ${CMAKE_CURRENT_BINARY_DIR}/BuildIfos.h @ONLY)


SET(LFA_FORMS
  logfileanalyser.ui
  GUI/DialogExportOptions.ui
)

SET(LFA_MOC_CLASSES
	ContextMenuManipulateHeader.h
	FilterListView.h
	LogEntryTableWindow.h
	logfileanalyser.h
	
	GUI/DialogExportOptions.h
	GUI/QuickSearchBar.h
)

SET(LFA_SOURCES
	ContextMenuManipulateHeader.cpp
	FilterListView.cpp
	LogEntryTableWindow.cpp
	logfileanalyser.cpp
	ParserActionInterface.cpp
	main.cpp	
	
	GUI/DialogExportOptions.cpp
	GUI/QuickSearchBar.cpp
)

SET(LFA_RESOURCES 
	LogfileAnalyserResources.qrc
)

INCLUDE_DIRECTORIES(
  ${QT_INCLUDES}
  ${Qt5Core_INCLUDES}
  ${Boost_INCLUDE_DIR}
  ${LOG4CPLUS_INCLUDE_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_CURRENT_BINARY_DIR}  # Neede for moc files in out of source builds.
)

#Add source dirs
ADD_SUBDIRECTORY(ActionRules)
ADD_SUBDIRECTORY(GUITools)
ADD_SUBDIRECTORY(Help)
ADD_SUBDIRECTORY(LogData)
ADD_SUBDIRECTORY(Models)
ADD_SUBDIRECTORY(Plugins)

#LINK_DIRECTORIES(
#  ${CMAKE_CURRENT_BINARY_DIR}/ActionRules
#  ${CMAKE_CURRENT_BINARY_DIR}/GUITools
#  ${CMAKE_CURRENT_BINARY_DIR}/LogData
#  ${CMAKE_CURRENT_BINARY_DIR}/Models
#)


IF(USEQT5)
  INCLUDE_DIRECTORIES(
    ${Qt5Widgets_INCLUDE_DIRS}
    ${Qt5Gui_INCLUDE_DIRS}
    ${Qt5Core_INCLUDE_DIRS}
  )  
    
  ADD_DEFINITIONS(${QT_DEFINITIONS})
  QT5_WRAP_CPP(LFA_HEADERS_MOC ${LFA_MOC_CLASSES})
  QT5_WRAP_UI(LFA_FORMS_HEADERS ${LFA_FORMS})
  QT5_ADD_RESOURCES(LFA_RESOURCES_RCC ${LFA_RESOURCES})
ELSE()
  INCLUDE(${QT_USE_FILE})
    
  ADD_DEFINITIONS(${QT_DEFINITIONS})
  QT4_WRAP_CPP(LFA_HEADERS_MOC ${LFA_MOC_CLASSES})
  QT4_WRAP_UI(LFA_FORMS_HEADERS ${LFA_FORMS})
  QT4_ADD_RESOURCES(LFA_RESOURCES_RCC ${LFA_RESOURCES})
ENDIF()


ADD_EXECUTABLE( logwitch 
	${LFA_SOURCES} 
    ${LFA_FORMS_HEADERS} 
    ${LFA_HEADERS_MOC}
    ${LFA_RESOURCES_RCC}
)
    
TARGET_LINK_LIBRARIES( logwitch 
  	${LFA_RULES_LIB}
  	${LFA_GUITOOLS_LIB}
  	${LFA_HELP_LIB}
   	${LFA_LOGDATA_LIB}
  	${LFA_MODELS_LIB}
  	${QT_LIBRARIES}
)

TARGET_COMPILE_DEFINITIONS( logwitch PRIVATE -DLW_PLUGIN_DIR="${LW_BIN_TO_PLUGIN_DIR}" )

###################### Installation
install (TARGETS logwitch
         RUNTIME DESTINATION "${LW_BINARY_DIR}" )
         
IF(NOT UNIX)
	INSTALL( FILES ${QT_LIBRARY_DIR}/QtCore4.dll
		${QT_LIBRARY_DIR}/QtGUI4.dll
		${QT_LIBRARY_DIR}/QtNetwork4.dll
		${QT_LIBRARY_DIR}/QtSvg4.dll
		${QT_LIBRARY_DIR}/QtXml4.dll
		${PACKAGING_ADDDIR}/qt.conf
		DESTINATION "${LW_BINARY_DIR}" )
	INSTALL( FILES ${QT_PLUGINS_DIR}/imageformats/qsvg4.dll
		DESTINATION bin/plugins/imageformats )
ENDIF()
