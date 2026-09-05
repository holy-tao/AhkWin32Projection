#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class HAL_DISPLAY_BIOS_INFORMATION extends Win32Enum {

    /**
     * Native name: HalDisplayInt10Bios
     * @type {Integer (Int32)}
     */
    static Int10Bios => 0

    /**
     * Native name: HalDisplayEmulatedBios
     * @type {Integer (Int32)}
     */
    static EmulatedBios => 1

    /**
     * Native name: HalDisplayNoBios
     * @type {Integer (Int32)}
     */
    static NoBios => 2
}
