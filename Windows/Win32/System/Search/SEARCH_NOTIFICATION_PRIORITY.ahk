#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the priority of processing an item that has changed.
 * @remarks
 * 
 * Set the <b>priority</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-search_item_change">SEARCH_ITEM_CHANGE</a> structure to one of these flags.
 * 
 * As the indexer crawls, it builds a list of items that need to be indexed. These flags indicate the placement of changed items in the indexer's queue. Higher priority items are placed at the front of the queue.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/ne-searchapi-search_notification_priority
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class SEARCH_NOTIFICATION_PRIORITY{

    /**
     * The changed item is added to the end of the indexer's queue.
     * @type {Integer (Int32)}
     */
    static SEARCH_NORMAL_PRIORITY => 0

    /**
     * The changed item is placed ahead of other queued items in the indexer's queue, to be processed as soon as possible.
     * @type {Integer (Int32)}
     */
    static SEARCH_HIGH_PRIORITY => 1
}
