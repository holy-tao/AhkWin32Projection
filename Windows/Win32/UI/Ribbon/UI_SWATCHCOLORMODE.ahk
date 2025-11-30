#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether a swatch has normal or monochrome mode.
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/ne-uiribbon-ui_swatchcolormode
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class UI_SWATCHCOLORMODE extends Win32Enum{

    /**
     * The swatch is normal mode.
     * @type {Integer (Int32)}
     */
    static UI_SWATCHCOLORMODE_NORMAL => 0

    /**
     * The swatch is monochrome. The swatch's RGB color value will be interpreted as a 1 bit-per-pixel
     *  pattern.
     * @type {Integer (Int32)}
     */
    static UI_SWATCHCOLORMODE_MONOCHROME => 1
}
