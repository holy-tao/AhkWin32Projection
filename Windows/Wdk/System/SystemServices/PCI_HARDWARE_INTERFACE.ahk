#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_HARDWARE_INTERFACE extends Win32Enum {

    /**
     * Native name: PciConventional
     * @type {Integer (Int32)}
     */
    static Conventional => 0

    /**
     * @type {Integer (Int32)}
     */
    static PciXMode1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static PciXMode2 => 2

    /**
     * Native name: PciExpress
     * @type {Integer (Int32)}
     */
    static Express => 3
}
