#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class DTCLUCOMPARESTATESRESPONSE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DTCLUCOMPARESTATESRESPONSE_OK => 1

    /**
     * @type {Integer (Int32)}
     */
    static DTCLUCOMPARESTATESRESPONSE_PROTOCOL => 2
}
