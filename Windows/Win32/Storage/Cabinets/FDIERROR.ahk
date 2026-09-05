#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
class FDIERROR extends Win32Enum {

    /**
     * Native name: FDIERROR_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: FDIERROR_CABINET_NOT_FOUND
     * @type {Integer (Int32)}
     */
    static CABINET_NOT_FOUND => 1

    /**
     * Native name: FDIERROR_NOT_A_CABINET
     * @type {Integer (Int32)}
     */
    static NOT_A_CABINET => 2

    /**
     * Native name: FDIERROR_UNKNOWN_CABINET_VERSION
     * @type {Integer (Int32)}
     */
    static UNKNOWN_CABINET_VERSION => 3

    /**
     * Native name: FDIERROR_CORRUPT_CABINET
     * @type {Integer (Int32)}
     */
    static CORRUPT_CABINET => 4

    /**
     * Native name: FDIERROR_ALLOC_FAIL
     * @type {Integer (Int32)}
     */
    static ALLOC_FAIL => 5

    /**
     * Native name: FDIERROR_BAD_COMPR_TYPE
     * @type {Integer (Int32)}
     */
    static BAD_COMPR_TYPE => 6

    /**
     * Native name: FDIERROR_MDI_FAIL
     * @type {Integer (Int32)}
     */
    static MDI_FAIL => 7

    /**
     * Native name: FDIERROR_TARGET_FILE
     * @type {Integer (Int32)}
     */
    static TARGET_FILE => 8

    /**
     * Native name: FDIERROR_RESERVE_MISMATCH
     * @type {Integer (Int32)}
     */
    static RESERVE_MISMATCH => 9

    /**
     * Native name: FDIERROR_WRONG_CABINET
     * @type {Integer (Int32)}
     */
    static WRONG_CABINET => 10

    /**
     * Native name: FDIERROR_USER_ABORT
     * @type {Integer (Int32)}
     */
    static USER_ABORT => 11

    /**
     * Native name: FDIERROR_EOF
     * @type {Integer (Int32)}
     */
    static EOF => 12
}
