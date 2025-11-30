#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_HARDWARE_INTERFACE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PciConventional => 0

    /**
     * @type {Integer (Int32)}
     */
    static PciXMode1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static PciXMode2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static PciExpress => 3
}
