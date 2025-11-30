#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_POWER_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PowerOn => 0

    /**
     * @type {Integer (Int32)}
     */
    static PowerOff => 1
}
