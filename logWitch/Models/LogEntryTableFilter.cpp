/*
 * LogEntryTableFilter.cpp
 *
 *  Created on: May 18, 2011
 *      Author: sven
 */

#include "LogEntryTableFilter.h"
#include "Models/LogEntryTableModel.h"
#include "LogData/LogEntry.h"
#include "Assert.h"
#include "ActionRules/ActionDataRewriter.h"
#include "ActionRules/ActionDiscardRow.h"

LogEntryTableFilter::LogEntryTableFilter( QObject *parent)
	: QSortFilterProxyModel( parent )
	, m_model( NULL )
    , m_ruleTable( new RuleTable )
{
    QObject::connect(&m_filterChain, SIGNAL(filterUpdateFinished()),
                     this, SLOT(invalidate()));
    QObject::connect( m_ruleTable.get(), SIGNAL(changed()),
            this, SLOT(updateChanges()));
}

LogEntryTableFilter::~LogEntryTableFilter()
{
}

void LogEntryTableFilter::addFilter( boost::shared_ptr<LogEntryFilter> flt )
{
	m_filterChain.addFilter( flt );
}

TSharedRuleTable LogEntryTableFilter:: getRuleTable()
{
    return m_ruleTable;
}

QVariant LogEntryTableFilter::data(const QModelIndex &index, int role) const
{
    QVariant var = QSortFilterProxyModel::data( index, role );

    TconstSharedLogEntry entry = m_model->getEntryByIndex( mapToSource( index ) );
    std::list<  TconstSharedActionDataRewriter > actions;
    if( m_ruleTable->getMatchedActionsForType( actions, entry ) )
    {
        QModelIndex srcIdx = mapToSource( index );

        std::list<  TconstSharedActionDataRewriter >::iterator it;
        for( it = actions.begin(); it != actions.end(); ++it  )
            (*it)->modifyData( var, srcIdx.column(), role);
    }

    return var;
}

LogEntryTableModel *LogEntryTableFilter::getSourceModel() const
{
    return m_model;
}

void LogEntryTableFilter::setSourceModel( QAbstractItemModel *model )
{
	QSortFilterProxyModel::setSourceModel( model );

	m_model = dynamic_cast<LogEntryTableModel *>( sourceModel() );
	LFA_ASSERT( m_model, "Invalid model given!" );
}

bool LogEntryTableFilter::filterAcceptsRow( int sourceRow, const QModelIndex & ) const
{
    TconstSharedLogEntry entry = m_model->getEntryByRow( sourceRow );

    if( ! m_filterChain.filterEntry( entry ) )
        return false;

    TExpressionVector::const_iterator it;
    for( it = m_discardExpressions.begin(); it != m_discardExpressions.end(); ++it )
        if( (*it)->match( entry ) )
            return false;

    return true;
}

void LogEntryTableFilter::updateChanges()
{
    TExpressionVector newExpressions = m_ruleTable->getExpressionsWithAction<TconstSharedActionDiscardRow>();
    if( newExpressions != m_discardExpressions )
    {
        // We have to invalidate the complete model here, because the discard filter has changed.
        // This takes more time, than only invalidating data.
        m_discardExpressions = newExpressions;
        invalidate();
    }
    else
    {
        // This invalidates the item data only. This is much faster, because only
        // the actual viewport will be updated.
        emit dataChanged( index( 0, 0 ), index( rowCount()-1, columnCount()-1 ) );
    }
}