#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class DTCLUXLNCONFIRMATION extends Win32Enum {

    /**
     * Native name: DTCLUXLNCONFIRMATION_CONFIRM
     * @type {Integer (Int32)}
     */
    static CONFIRM => 1

    /**
     * Native name: DTCLUXLNCONFIRMATION_LOGNAMEMISMATCH
     * @type {Integer (Int32)}
     */
    static LOGNAMEMISMATCH => 2

    /**
     * Native name: DTCLUXLNCONFIRMATION_COLDWARMMISMATCH
     * @type {Integer (Int32)}
     */
    static COLDWARMMISMATCH => 3

    /**
     * Native name: DTCLUXLNCONFIRMATION_OBSOLETE
     * @type {Integer (Int32)}
     */
    static OBSOLETE => 4
}
