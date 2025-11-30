#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class htmlGlyphMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static htmlGlyphModeNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlGlyphModeBegin => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlGlyphModeEnd => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlGlyphModeBoth => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlGlyphMode_Max => 2147483647
}
