#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used by ISearchCatalogManager::GetCatalogStatus to determine the current state of the catalog.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/ne-searchapi-catalogstatus
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class CatalogStatus{

    /**
     * Index is current; no indexing needed. Queries can be processed.
     * @type {Integer (Int32)}
     */
    static CATALOG_STATUS_IDLE => 0

    /**
     * Indexer is paused. This can happen either because the user paused indexing or the indexer back-off criteria have been met. Queries can be processed.
     * @type {Integer (Int32)}
     */
    static CATALOG_STATUS_PAUSED => 1

    /**
     * Index is recovering; queries and indexing are processed while in this state.
     * @type {Integer (Int32)}
     */
    static CATALOG_STATUS_RECOVERING => 2

    /**
     * Indexer is currently executing a full crawl and will index everything it is configured to index. Queries can be processed while indexing.
     * @type {Integer (Int32)}
     */
    static CATALOG_STATUS_FULL_CRAWL => 3

    /**
     * Indexer is preforming a crawl to see if anything has changed or requires indexing. Queries can be processed while indexing.
     * @type {Integer (Int32)}
     */
    static CATALOG_STATUS_INCREMENTAL_CRAWL => 4

    /**
     * Indexer is processing the notification queue. This is done before resuming any crawl.
     * @type {Integer (Int32)}
     */
    static CATALOG_STATUS_PROCESSING_NOTIFICATIONS => 5

    /**
     * Indexer is shutting down and is not indexing.  Indexer can't be queried.
     * @type {Integer (Int32)}
     */
    static CATALOG_STATUS_SHUTTING_DOWN => 6
}
