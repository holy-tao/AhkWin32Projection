#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class DTCLUXLNRESPONSE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DTCLUXLNRESPONSE_OK_SENDOURXLNBACK => 1

    /**
     * @type {Integer (Int32)}
     */
    static DTCLUXLNRESPONSE_OK_SENDCONFIRMATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static DTCLUXLNRESPONSE_LOGNAMEMISMATCH => 3

    /**
     * @type {Integer (Int32)}
     */
    static DTCLUXLNRESPONSE_COLDWARMMISMATCH => 4
}
