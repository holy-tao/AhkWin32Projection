#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the current state of an Indexing Service catalog.
 * @remarks
 * 
  * When using this structure, all members are output values. The <b>cbStruct</b> member is both an input value and an output value.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ntquery/ns-ntquery-ci_state
 * @namespace Windows.Win32.Storage.IndexServer
 * @version v4.0.30319
 */
class CI_STATE extends Win32Struct
{
    static sizeof => 60

    static packingSize => 4

    /**
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of current word lists.
     * @type {Integer}
     */
    cWordList {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of persistent indexes.
     * @type {Integer}
     */
    cPersistentIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of actively running queries.
     * @type {Integer}
     */
    cQueries {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of documents waiting to be filtered.
     * @type {Integer}
     */
    cDocuments {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of unique documents in word lists and shadow indexes.
     * @type {Integer}
     */
    cFreshTest {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The completion percentage of current merge, if one is running.
     * @type {Integer}
     */
    dwMergeProgress {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The state of content indexing. This can be one or more of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/indexsrv/ci-state-constants">CI_STATE_*</a> constants.
     * @type {Integer}
     */
    eState {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The number of documents filtered since content indexing began.
     * @type {Integer}
     */
    cFilteredDocuments {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The total number of documents in the system.
     * @type {Integer}
     */
    cTotalDocuments {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The number of pending scans, possibly one for each scope in the directories list. The value is usually zero, except immediately after content indexing has been started or after a notification queue overflows.
     * @type {Integer}
     */
    cPendingScans {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The size, in megabytes, of the index (excluding the property cache).
     * @type {Integer}
     */
    dwIndexSize {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The number of unique keys in the master index.
     * @type {Integer}
     */
    cUniqueKeys {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The number of documents in the secondary queue, which contains documents that failed filtering due to a sharing violation.
     * @type {Integer}
     */
    cSecQDocuments {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The size of the property cache, in megabytes.
     * @type {Integer}
     */
    dwPropCacheSize {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
