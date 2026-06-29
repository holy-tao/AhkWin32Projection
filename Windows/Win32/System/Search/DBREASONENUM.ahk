#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBREASONENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROWSET_FETCHPOSITIONCHANGE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROWSET_RELEASE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_COLUMN_SET => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_COLUMN_RECALCULATED => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROW_ACTIVATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROW_RELEASE => 5

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROW_DELETE => 6

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROW_FIRSTCHANGE => 7

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROW_INSERT => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROW_RESYNCH => 9

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROW_UNDOCHANGE => 10

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROW_UNDOINSERT => 11

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROW_UNDODELETE => 12

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROW_UPDATE => 13

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROWSET_CHANGED => 14
}
