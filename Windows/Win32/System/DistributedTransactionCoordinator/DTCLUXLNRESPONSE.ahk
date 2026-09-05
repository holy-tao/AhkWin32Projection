#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class DTCLUXLNRESPONSE extends Win32Enum {

    /**
     * Native name: DTCLUXLNRESPONSE_OK_SENDOURXLNBACK
     * @type {Integer (Int32)}
     */
    static OK_SENDOURXLNBACK => 1

    /**
     * Native name: DTCLUXLNRESPONSE_OK_SENDCONFIRMATION
     * @type {Integer (Int32)}
     */
    static OK_SENDCONFIRMATION => 2

    /**
     * Native name: DTCLUXLNRESPONSE_LOGNAMEMISMATCH
     * @type {Integer (Int32)}
     */
    static LOGNAMEMISMATCH => 3

    /**
     * Native name: DTCLUXLNRESPONSE_COLDWARMMISMATCH
     * @type {Integer (Int32)}
     */
    static COLDWARMMISMATCH => 4
}
