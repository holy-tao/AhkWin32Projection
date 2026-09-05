#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_PCI_RECOVERY_SIGNAL extends Win32Enum {

    /**
     * Native name: WheaPciRecoverySignalUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: WheaPciRecoverySignalAer
     * @type {Integer (Int32)}
     */
    static Aer => 1

    /**
     * Native name: WheaPciRecoverySignalDpc
     * @type {Integer (Int32)}
     */
    static Dpc => 2
}
