#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class FillMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FillModeAlternate => 0

    /**
     * @type {Integer (Int32)}
     */
    static FillModeWinding => 1
}
