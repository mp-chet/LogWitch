# #####################################################################
# Automatically generated by qmake (2.01a) Mon May 23 21:33:41 2011
# #####################################################################
TEMPLATE = app
TARGET = 
SRCDIR = $$(PWD)
CONFIG += qt \
    debug
DEPENDPATH += SRCDIR \
    LogData \
    Models
INCLUDEPATH += SRCDIR \
    LogData \
    Models
LIBS += -llog4cplus
QT += core \
    gui \
    network

# Input
HEADERS += LogData/TimeFormatingModel.h \
    GUITools/SlotToBoostFunction.h \
    ContextMenuLogEntryHeader.h \
    LogData/LogEntryFactory.h \
    LogData/LogEntry.h \
    ActionRules/ExpressionFind.h \
    ActionRules/ExpressionMatch.h \
    Help/HelpAssistant.h \
    LogData/NewLogEntryMessage.h \
    ActionRules/ActionDiscardRow.h \
    GUITools/QScrollDownTableView.h \
    ActionRules/ExpressionOperators.h \
    ActionRules/ExpressionRegEx.h \
    ActionRules/ActionDoNothing.h \
    ActionRules/RulesTableView.h \
    GUITools/GetSetStateSaver.hxx \
    LogData/LogEntryAttributeNames.h \
    LogData/ObjectCache.hxx \
    ActionRules/ActionParser.h \
    ActionRules/CompiledRulesStateSaver.h \
    ActionRules/ExpressionParser.h \
    ActionRules/FilterRuleSelectionWindow.h \
    ActionRules/TableModelRulesCompiled.h \
    ActionRules/FilterRuleCompiled.h \
    ActionRules/DisplayItemData.h \
    ActionRules/FilterRuleRaw.h \
    ActionRules/TableModelRules.h \
    ActionRules/ActionDataRewriter.h \
    ActionRules/RuleTable.h \
    ActionRules/ValueGetterConstQString.h \
    ActionRules/ValueGetterLogEntry.h \
    ActionRules/ValueGetter.h \
    ActionRules/Expression.h \
    ActionRules/Rule.h \
    ActionRules/Action.h \
    FilterListView.h \
    EntryToTextFormaterDefault.h \
    EntryToTextFormaterLog4cplus.h \
    GUITools/SignalMultiplexerStateApplier.h \
    GUITools/SignalMultiplexer.h \
    GUITools/WidgetStateSaver.h \
    Assert.h \
    EntryToTextFormater.h \
    LogEntryTableWindow.h \
    logfileanalyser.h \
    Types.h \
    LogData/LogEntryParser.h \
    LogData/LogEntryParser_dummy.h \
    LogData/LogEntryParser_log4cplusSocket.h \
    LogData/LogEntryParser_Logfile.h \
    LogData/LogEntryParserModelConfiguration.h \
    Models/LogEntryFilter.h \
    Models/LogEntryFilterChain.h \
    Models/LogEntryRemoveFilter.h \
    Models/LogEntryTableFilter.h \
    Models/LogEntryTableModel.h \
    Models/StringCacheTreeItem.h \
    Models/StringCacheTreeModel.h
FORMS += logfileanalyser.ui
SOURCES += LogData/TimeFormatingModel.cpp \
    ContextMenuLogEntryHeader.cpp \
    LogData/LogEntryFactory.cpp \
    LogData/LogEntry.cpp \
    ActionRules/ExpressionFind.cpp \
    ActionRules/ExpressionMatch.cpp \
    Help/HelpAssistant.cpp \
    LogData/NewLogEntryMessage.cpp \
    ActionRules/ActionDiscardRow.cpp \
    GUITools/QScrollDownTableView.cpp \
    ActionRules/ExpressionOperators.cpp \
    ActionRules/ExpressionRegEx.cpp \
    ActionRules/ActionDoNothing.cpp \
    ActionRules/RulesTableView.cpp \
    LogData/LogEntryAttributeNames.cpp \
    ActionRules/ActionParser.cpp \
    ActionRules/CompiledRulesStateSaver.cpp \
    ActionRules/ExpressionParser.cpp \
    ActionRules/FilterRuleSelectionWindow.cpp \
    ActionRules/TableModelRulesCompiled.cpp \
    ActionRules/FilterRuleCompiled.cpp \
    ActionRules/FilterRuleRaw.cpp \
    ActionRules/TableModelRules.cpp \
    ActionRules/ActionDataRewriter.cpp \
    ActionRules/RuleTable.cpp \
    ActionRules/ValueGetterConstQString.cpp \
    ActionRules/ValueGetterLogEntry.cpp \
    ActionRules/ValueGetter.cpp \
    ActionRules/Expression.cpp \
    ActionRules/Rule.cpp \
    ActionRules/Action.cpp \
    FilterListView.cpp \
    EntryToTextFormaterDefault.cpp \
    EntryToTextFormaterLog4cplus.cpp \
    GUITools/SignalMultiplexerStateApplier.cpp \
    GUITools/SignalMultiplexer.cpp \
    GUITools/WidgetStateSaver.cpp \
    LogEntryTableWindow.cpp \
    logfileanalyser.cpp \
    main.cpp \
    LogData/LogEntryParser_dummy.cpp \
    LogData/LogEntryParser_log4cplusSocket.cpp \
    LogData/LogEntryParser_Logfile.cpp \
    LogData/LogEntryParserModelConfiguration.cpp \
    Models/LogEntryFilter.cpp \
    Models/LogEntryFilterChain.cpp \
    Models/LogEntryRemoveFilter.cpp \
    Models/LogEntryTableFilter.cpp \
    Models/LogEntryTableModel.cpp \
    Models/StringCacheTreeItem.cpp \
    Models/StringCacheTreeModel.cpp
RESOURCES = LogfileAnalyserResources.qrc

# The help
# Using a "custom compiler"
QHP_FILES += Help/help.qhcp
qhp_qhc.input = QHP_FILES
qhp_qhc.output = ${QMAKE_FILE_BASE}.qhc
qhp_qhc.commands = qcollectiongenerator \
    ${QMAKE_FILE_NAME}
qhp_qhc.CONFIG = no_link \
    target_predeps
QMAKE_EXTRA_COMPILERS += qhp_qhc
