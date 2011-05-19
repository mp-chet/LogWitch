/*
 * StringCacheTreeItem.h
 *
 *  Created on: May 15, 2011
 *      Author: sven
 */

#ifndef STRINGCACHETREEITEM_H_
#define STRINGCACHETREEITEM_H_

#include <boost/shared_ptr.hpp>
#include <QtCore/QList>
#include "Types.h"
#include <QtCore/QtCore>

class StringCacheTreeItem {
public:
	enum Check{
		Child,
		Checked,
		Unchecked
	};
public:
	StringCacheTreeItem( TSharedConstQString originalString, TSharedConstQString str, StringCacheTreeItem *parent = NULL );
	virtual ~StringCacheTreeItem();

    void appendChild(StringCacheTreeItem *child);

    StringCacheTreeItem *child(int row);
    int childCount() const;


    int row() const;
    StringCacheTreeItem *parent();

    /**
     * This is the readable name which need not be the same as the string from the StringCache
     */
    TSharedConstQString getString() const;

    /**
     * This function returns the original string from the StringCache which can be used for a direct pointer
     */
    TSharedConstQString getOriginalString() const ;

    Qt::CheckState getChecked() const
    {
    	Check c = getCheckedInt();
    	if( c == Child )
    		return Qt::PartiallyChecked;
    	else if( c == Checked )
    		return Qt::Checked;
    	else
    		return Qt::Unchecked;
    }

    Check getCheckedNative( ) { return m_checked; }

    bool getForcedChecked( ) const
    {
    	if( m_parentItem )
    	{
    		if( m_parentItem->m_checked != Child )
    			return true;
    		else
    			return m_parentItem->getForcedChecked();
    	}
    	else
    		return false;
    }

    Check getCheckedInt( bool childDir = true) const
    {
    	if( childDir )
    	{
			if( m_checked == Child )
			{
				if( m_childItems.empty() )
					return Checked;
				else
				{
					QList< StringCacheTreeItem *>::const_iterator it= m_childItems.constBegin();
					for( ;it != m_childItems.constEnd(); ++it )
					{
						if( (*it)->getCheckedInt() == Unchecked || (*it)->getCheckedInt() == Child )
							return Child;
					}
					return Checked;
				}
			}
			else
				return  m_checked;
    	}
    	else
    	{
    		return Checked;
    	}
    }

    void nextChecked()
    {
    	Check c = getCheckedInt();
    	if(c == Child )
    	{
    		if( m_childItems.empty() )
    			m_checked = Unchecked;
    		else
    			m_checked = Checked;
    	}
    	else if( c == Checked)
    		m_checked = Unchecked;
    	else if( c == Unchecked)
   			m_checked = Child;
    }

private:
    QList< StringCacheTreeItem *> m_childItems;
    StringCacheTreeItem *m_parentItem;

    Check m_checked;

    TSharedConstQString m_string;

    TSharedConstQString m_stringOriginal;
};

#endif /* STRINGCACHETREEITEM_H_ */
