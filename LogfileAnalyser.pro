# #####################################################################
# Automatically generated by qmake (2.01a) Mon May 23 21:33:41 2011
# #####################################################################
TEMPLATE = app
TARGET = 
CONFIG += qt \
    debug
DEPENDPATH += . \
    LogData \
    Models
INCLUDEPATH += . \
    LogData \
    Models
LIBS += -llog4cplus
QT += core \
    gui \
    network

# Input
HEADERS += ActionRules/RuleTable.h \
    ActionRules/ActionRemoveRow.h \
    ActionRules/ActionColorRow.h \
    ActionRules/ValueGetterConstQString.h \
    ActionRules/ValueGetterLogEntry.h \
    ActionRules/ExpressionValueGetter.h \
    ActionRules/ValueGetter.h \
    ActionRules/Expression.h \
    ActionRules/Rule.h \
    ActionRules/Action.h \
    FilterListView.h \
    EntryToTextFormaterDefault.h \
    EntryToTextFormaterLog4cplus.h \
    GUITools/SignalMultiplexerStateApplier.h \
    GUITools/SignalMultiplexer.h \
    GUITools/DockWidgetStateSaver.h \
    GUITools/WidgetStateSaver.h \
    Assert.h \
    EntryToTextFormater.h \
    LogEntryCombinedWidget.h \
    LogEntryTableWindow.h \
    logfileanalyser.h \
    Types.h \
    LogData/LogEntry.h \
    LogData/LogEntryAttributeFactory.h \
    LogData/LogEntryAttributes.h \
    LogData/LogEntryFactory.h \
    LogData/LogEntryParser.h \
    LogData/LogEntryParser_dummy.h \
    LogData/LogEntryParser_log4cplusSocket.h \
    LogData/LogEntryParser_Logfile.h \
    LogData/LogEntryParserModelConfiguration.h \
    LogData/StringCache.h \
    Models/LogEntryFilter.h \
    Models/LogEntryFilterChain.h \
    Models/LogEntryRemoveFilter.h \
    Models/LogEntryTableFilter.h \
    Models/LogEntryTableModel.h \
    Models/StringCacheTreeItem.h \
    Models/StringCacheTreeModel.h
FORMS += logfileanalyser.ui
SOURCES += ActionRules/RuleTable.cpp \
    ActionRules/ActionRemoveRow.cpp \
    ActionRules/ActionColorRow.cpp \
    ActionRules/ValueGetterConstQString.cpp \
    ActionRules/ValueGetterLogEntry.cpp \
    ActionRules/ExpressionValueGetter.cpp \
    ActionRules/ValueGetter.cpp \
    ActionRules/Expression.cpp \
    ActionRules/Rule.cpp \
    ActionRules/Action.cpp \
    FilterListView.cpp \
    EntryToTextFormaterDefault.cpp \
    EntryToTextFormaterLog4cplus.cpp \
    GUITools/SignalMultiplexerStateApplier.cpp \
    GUITools/SignalMultiplexer.cpp \
    GUITools/DockWidgetStateSaver.cpp \
    GUITools/WidgetStateSaver.cpp \
    LogEntryCombinedWidget.cpp \
    LogEntryTableWindow.cpp \
    logfileanalyser.cpp \
    main.cpp \
    LogData/LogEntry.cpp \
    LogData/LogEntryAttributeFactory.cpp \
    LogData/LogEntryAttributes.cpp \
    LogData/LogEntryFactory.cpp \
    LogData/LogEntryParser_dummy.cpp \
    LogData/LogEntryParser_log4cplusSocket.cpp \
    LogData/LogEntryParser_Logfile.cpp \
    LogData/LogEntryParserModelConfiguration.cpp \
    LogData/StringCache.cpp \
    Models/LogEntryFilter.cpp \
    Models/LogEntryFilterChain.cpp \
    Models/LogEntryRemoveFilter.cpp \
    Models/LogEntryTableFilter.cpp \
    Models/LogEntryTableModel.cpp \
    Models/StringCacheTreeItem.cpp \
    Models/StringCacheTreeModel.cpp
RESOURCES = LogfileAnalyserResources.qrc
