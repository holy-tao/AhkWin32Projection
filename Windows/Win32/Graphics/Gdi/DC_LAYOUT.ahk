#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class DC_LAYOUT extends Win32BitflagEnum {

    /**
     * Native name: LAYOUT_BITMAPORIENTATIONPRESERVED
     * @type {Integer (UInt32)}
     */
    static BITMAPORIENTATIONPRESERVED => 8

    /**
     * Native name: LAYOUT_RTL
     * @type {Integer (UInt32)}
     */
    static RTL => 1
}
