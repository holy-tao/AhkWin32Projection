#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBBINDSTATUSENUM {
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
    static DBBINDSTATUS_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDSTATUS_BADORDINAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDSTATUS_UNSUPPORTEDCONVERSION => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDSTATUS_BADBINDINFO => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDSTATUS_BADSTORAGEFLAGS => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDSTATUS_NOINTERFACE => 5

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDSTATUS_MULTIPLESTORAGE => 6
}
