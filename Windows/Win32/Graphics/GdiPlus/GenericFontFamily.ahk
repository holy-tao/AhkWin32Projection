#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class GenericFontFamily extends Win32Enum {

    /**
     * Native name: GenericFontFamilySerif
     * @type {Integer (Int32)}
     */
    static Serif => 0

    /**
     * Native name: GenericFontFamilySansSerif
     * @type {Integer (Int32)}
     */
    static SansSerif => 1

    /**
     * Native name: GenericFontFamilyMonospace
     * @type {Integer (Int32)}
     */
    static Monospace => 2
}
