#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class DTCLUXLNCONFIRMATION extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DTCLUXLNCONFIRMATION_CONFIRM => 1

    /**
     * @type {Integer (Int32)}
     */
    static DTCLUXLNCONFIRMATION_LOGNAMEMISMATCH => 2

    /**
     * @type {Integer (Int32)}
     */
    static DTCLUXLNCONFIRMATION_COLDWARMMISMATCH => 3

    /**
     * @type {Integer (Int32)}
     */
    static DTCLUXLNCONFIRMATION_OBSOLETE => 4
}
