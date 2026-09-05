#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by ISearchCatalogManager::GetCatalogStatus to determine the current state of the catalog.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ne-searchapi-catalogstatus
 * @namespace Windows.Win32.System.Search
 */
class CatalogStatus extends Win32Enum {

    /**
     * Index is current; no indexing needed. Queries can be processed.
     * Native name: CATALOG_STATUS_IDLE
     * @type {Integer (Int32)}
     */
    static IDLE => 0

    /**
     * Indexer is paused. This can happen either because the user paused indexing or the indexer back-off criteria have been met. Queries can be processed.
     * Native name: CATALOG_STATUS_PAUSED
     * @type {Integer (Int32)}
     */
    static PAUSED => 1

    /**
     * Index is recovering; queries and indexing are processed while in this state.
     * Native name: CATALOG_STATUS_RECOVERING
     * @type {Integer (Int32)}
     */
    static RECOVERING => 2

    /**
     * Indexer is currently executing a full crawl and will index everything it is configured to index. Queries can be processed while indexing.
     * Native name: CATALOG_STATUS_FULL_CRAWL
     * @type {Integer (Int32)}
     */
    static FULL_CRAWL => 3

    /**
     * Indexer is preforming a crawl to see if anything has changed or requires indexing. Queries can be processed while indexing.
     * Native name: CATALOG_STATUS_INCREMENTAL_CRAWL
     * @type {Integer (Int32)}
     */
    static INCREMENTAL_CRAWL => 4

    /**
     * Indexer is processing the notification queue. This is done before resuming any crawl.
     * Native name: CATALOG_STATUS_PROCESSING_NOTIFICATIONS
     * @type {Integer (Int32)}
     */
    static PROCESSING_NOTIFICATIONS => 5

    /**
     * Indexer is shutting down and is not indexing.  Indexer can't be queried.
     * Native name: CATALOG_STATUS_SHUTTING_DOWN
     * @type {Integer (Int32)}
     */
    static SHUTTING_DOWN => 6
}
