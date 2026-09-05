#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class DTCLUCOMPARESTATESRESPONSE extends Win32Enum {

    /**
     * Native name: DTCLUCOMPARESTATESRESPONSE_OK
     * @type {Integer (Int32)}
     */
    static OK => 1

    /**
     * Native name: DTCLUCOMPARESTATESRESPONSE_PROTOCOL
     * @type {Integer (Int32)}
     */
    static PROTOCOL => 2
}
