#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct FCIERROR {
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
    static FCIERR_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static FCIERR_OPEN_SRC => 1

    /**
     * @type {Integer (Int32)}
     */
    static FCIERR_READ_SRC => 2

    /**
     * @type {Integer (Int32)}
     */
    static FCIERR_ALLOC_FAIL => 3

    /**
     * @type {Integer (Int32)}
     */
    static FCIERR_TEMP_FILE => 4

    /**
     * @type {Integer (Int32)}
     */
    static FCIERR_BAD_COMPR_TYPE => 5

    /**
     * @type {Integer (Int32)}
     */
    static FCIERR_CAB_FILE => 6

    /**
     * @type {Integer (Int32)}
     */
    static FCIERR_USER_ABORT => 7

    /**
     * @type {Integer (Int32)}
     */
    static FCIERR_MCI_FAIL => 8

    /**
     * @type {Integer (Int32)}
     */
    static FCIERR_CAB_FORMAT_LIMIT => 9
}
