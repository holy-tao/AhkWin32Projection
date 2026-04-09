#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class ColorMode extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static ColorModeARGB32 => 0

    /**
     * @type {Integer (Int32)}
     */
    static ColorModeARGB64 => 1
}
