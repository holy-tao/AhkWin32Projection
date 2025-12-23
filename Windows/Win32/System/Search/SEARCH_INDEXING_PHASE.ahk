#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the status of the current search indexing phase.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ne-searchapi-search_indexing_phase
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class SEARCH_INDEXING_PHASE extends Win32Enum{

    /**
     * Sent in the event that an error occurs while a notification is in the gatherer. For instance, if the notification fails the exclusion-rule tests, a status update will be sent with the error.
     * @type {Integer (Int32)}
     */
    static SEARCH_INDEXING_PHASE_GATHERER => 0

    /**
     * The document will be returned in queries. It is currently only in the volatile indexes.
     * @type {Integer (Int32)}
     */
    static SEARCH_INDEXING_PHASE_QUERYABLE => 1

    /**
     * The document has moved from the volatile index to the persisted-file-based index.
     * @type {Integer (Int32)}
     */
    static SEARCH_INDEXING_PHASE_PERSISTED => 2
}
