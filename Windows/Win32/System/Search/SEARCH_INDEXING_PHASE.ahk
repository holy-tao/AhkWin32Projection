#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the status of the current search indexing phase.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ne-searchapi-search_indexing_phase
 * @namespace Windows.Win32.System.Search
 */
export default struct SEARCH_INDEXING_PHASE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
