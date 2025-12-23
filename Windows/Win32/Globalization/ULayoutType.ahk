#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class ULayoutType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_LAYOUT_LTR => 0

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_LAYOUT_RTL => 1

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_LAYOUT_TTB => 2

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_LAYOUT_BTT => 3

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_LAYOUT_UNKNOWN => 4
}
