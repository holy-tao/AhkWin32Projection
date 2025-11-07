#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the type of change to the rowset's data.
 * @remarks
 * 
 * This enumeration is used in the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-irowsetevents-onrowsetevent">IRowsetEvents::OnRowsetEvent</a> method to describe the type of event that affects a rowset.
 * 
 * The <b>ROWSETEVENT_TYPE_SCOPESTATISTICS</b> event gives you the same information available from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-irowsetprioritization-getscopestatistics">IRowsetPrioritization::GetScopeStatistics</a> method call, but through a push mechanic, as follows: 
 * 
 * <ul>
 * <li>The event arises if the prioritization API has been used to request a non-default prioritization level, and a non-zero statistics event frequency.  </li>
 * <li>The event arises only when statistics actually change, and the interval specified in the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-irowsetprioritization">IRowsetPrioritization</a> has elapsed (the interval does not guarantee the frequency of the event).</li>
 * <li>This event is guaranteed to raise a "bounce zero" state (zero items remaining to be added, zero modifies remaining), provided that a non-zero event has been raised.</li>
 * <li>The indexer may process items without sending this event, if the queue empties before the statistics event frequency.</li>
 * </ul>
 * Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-searchevents">SearchEvents code sample</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/ne-searchapi-rowsetevent_type
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ROWSETEVENT_TYPE{

    /**
     * Indicates that data backing the rowset has expired, and that a new rowset should be requested.
     * @type {Integer (Int32)}
     */
    static ROWSETEVENT_TYPE_DATAEXPIRED => 0

    /**
     * Indicates that an item that did have foreground priority in the prioritization stack has been demoted, because someone else prioritized themselves ahead of this query.
     * @type {Integer (Int32)}
     */
    static ROWSETEVENT_TYPE_FOREGROUNDLOST => 1

    /**
     * Indicates that the scope statistics are to be optained.
     * @type {Integer (Int32)}
     */
    static ROWSETEVENT_TYPE_SCOPESTATISTICS => 2
}
