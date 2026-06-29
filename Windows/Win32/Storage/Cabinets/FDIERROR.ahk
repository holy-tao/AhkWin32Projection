#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct FDIERROR {
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
    static FDIERROR_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static FDIERROR_CABINET_NOT_FOUND => 1

    /**
     * @type {Integer (Int32)}
     */
    static FDIERROR_NOT_A_CABINET => 2

    /**
     * @type {Integer (Int32)}
     */
    static FDIERROR_UNKNOWN_CABINET_VERSION => 3

    /**
     * @type {Integer (Int32)}
     */
    static FDIERROR_CORRUPT_CABINET => 4

    /**
     * @type {Integer (Int32)}
     */
    static FDIERROR_ALLOC_FAIL => 5

    /**
     * @type {Integer (Int32)}
     */
    static FDIERROR_BAD_COMPR_TYPE => 6

    /**
     * @type {Integer (Int32)}
     */
    static FDIERROR_MDI_FAIL => 7

    /**
     * @type {Integer (Int32)}
     */
    static FDIERROR_TARGET_FILE => 8

    /**
     * @type {Integer (Int32)}
     */
    static FDIERROR_RESERVE_MISMATCH => 9

    /**
     * @type {Integer (Int32)}
     */
    static FDIERROR_WRONG_CABINET => 10

    /**
     * @type {Integer (Int32)}
     */
    static FDIERROR_USER_ABORT => 11

    /**
     * @type {Integer (Int32)}
     */
    static FDIERROR_EOF => 12
}
