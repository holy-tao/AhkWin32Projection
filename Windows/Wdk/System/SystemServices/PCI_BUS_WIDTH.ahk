#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_BUS_WIDTH extends Win32Enum {

    /**
     * Native name: BusWidth32Bits
     * @type {Integer (Int32)}
     */
    static Width32Bits => 0

    /**
     * Native name: BusWidth64Bits
     * @type {Integer (Int32)}
     */
    static Width64Bits => 1
}
