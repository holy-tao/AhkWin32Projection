#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class GRAPHICS_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GM_COMPATIBLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static GM_ADVANCED => 2
}
