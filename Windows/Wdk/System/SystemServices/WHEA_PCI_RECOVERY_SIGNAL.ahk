#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_PCI_RECOVERY_SIGNAL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciRecoverySignalUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciRecoverySignalAer => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciRecoverySignalDpc => 2
}
