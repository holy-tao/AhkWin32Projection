#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Cabinets
 * @version v4.0.30319
 */
class FDIERROR extends Win32Enum{

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
