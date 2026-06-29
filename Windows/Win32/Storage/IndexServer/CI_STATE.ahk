#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the current state of an Indexing Service catalog.
 * @remarks
 * When using this structure, all members are output values. The <b>cbStruct</b> member is both an input value and an output value.
 * @see https://learn.microsoft.com/windows/win32/api/ntquery/ns-ntquery-ci_state
 * @namespace Windows.Win32.Storage.IndexServer
 */
export default struct CI_STATE {
    #StructPack 4

    /**
     * The size of this structure, in bytes.
     */
    cbStruct : UInt32

    /**
     * The number of current word lists.
     */
    cWordList : UInt32

    /**
     * The number of persistent indexes.
     */
    cPersistentIndex : UInt32

    /**
     * The number of actively running queries.
     */
    cQueries : UInt32

    /**
     * The number of documents waiting to be filtered.
     */
    cDocuments : UInt32

    /**
     * The number of unique documents in word lists and shadow indexes.
     */
    cFreshTest : UInt32

    /**
     * The completion percentage of current merge, if one is running.
     */
    dwMergeProgress : UInt32

    /**
     * The state of content indexing. This can be one or more of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/indexsrv/ci-state-constants">CI_STATE_*</a> constants.
     */
    eState : UInt32

    /**
     * The number of documents filtered since content indexing began.
     */
    cFilteredDocuments : UInt32

    /**
     * The total number of documents in the system.
     */
    cTotalDocuments : UInt32

    /**
     * The number of pending scans, possibly one for each scope in the directories list. The value is usually zero, except immediately after content indexing has been started or after a notification queue overflows.
     */
    cPendingScans : UInt32

    /**
     * The size, in megabytes, of the index (excluding the property cache).
     */
    dwIndexSize : UInt32

    /**
     * The number of unique keys in the master index.
     */
    cUniqueKeys : UInt32

    /**
     * The number of documents in the secondary queue, which contains documents that failed filtering due to a sharing violation.
     */
    cSecQDocuments : UInt32

    /**
     * The size of the property cache, in megabytes.
     */
    dwPropCacheSize : UInt32

}
