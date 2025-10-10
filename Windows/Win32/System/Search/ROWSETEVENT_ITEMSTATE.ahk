#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes whether an item that matches the search criteria of a rowset is currently in that rowset.
 * @remarks
 * 
  * This enumeration is used by <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-irowsetevents">IRowsetEvents</a> to describe the state of rows in a rowset held by a client.
  * 
  * Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-searchevents">SearchEvents code sample</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/ne-searchapi-rowsetevent_itemstate
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ROWSETEVENT_ITEMSTATE{

    /**
     * The item is definitely not in the rowset.
     * @type {Integer (Int32)}
     */
    static ROWSETEVENT_ITEMSTATE_NOTINROWSET => 0

    /**
     * The item is definitely contained within the rowset.
     * @type {Integer (Int32)}
     */
    static ROWSETEVENT_ITEMSTATE_INROWSET => 1

    /**
     * The item may be in the rowset.
     * @type {Integer (Int32)}
     */
    static ROWSETEVENT_ITEMSTATE_UNKNOWN => 2
}
