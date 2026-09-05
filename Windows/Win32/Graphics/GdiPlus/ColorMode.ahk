#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class ColorMode extends Win32Enum {

    /**
     * Native name: ColorModeARGB32
     * @type {Integer (Int32)}
     */
    static ModeARGB32 => 0

    /**
     * Native name: ColorModeARGB64
     * @type {Integer (Int32)}
     */
    static ModeARGB64 => 1
}
