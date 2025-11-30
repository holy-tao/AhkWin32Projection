#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class HAL_DISPLAY_BIOS_INFORMATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HalDisplayInt10Bios => 0

    /**
     * @type {Integer (Int32)}
     */
    static HalDisplayEmulatedBios => 1

    /**
     * @type {Integer (Int32)}
     */
    static HalDisplayNoBios => 2
}
