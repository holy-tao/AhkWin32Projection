#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class DTCLUCOMPARESTATESCONFIRMATION extends Win32Enum {

    /**
     * Native name: DTCLUCOMPARESTATESCONFIRMATION_CONFIRM
     * @type {Integer (Int32)}
     */
    static CONFIRM => 1

    /**
     * Native name: DTCLUCOMPARESTATESCONFIRMATION_PROTOCOL
     * @type {Integer (Int32)}
     */
    static PROTOCOL => 2
}
