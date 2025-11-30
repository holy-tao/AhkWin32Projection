#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the values that identify how a color swatch in a DropDownColorPicker or a FontControl color picker (Text color or Text highlight) is filled.Note  These are recommendations only.
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/ne-uiribbon-ui_swatchcolortype
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class UI_SWATCHCOLORTYPE extends Win32Enum{

    /**
     * The swatch is transparent.
     * @type {Integer (Int32)}
     */
    static UI_SWATCHCOLORTYPE_NOCOLOR => 0

    /**
     * The swatch is filled with a solid RGB color bound to <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-getsyscolor">GetSysColor(COLOR_WINDOWTEXT)</a>.
     * @type {Integer (Int32)}
     */
    static UI_SWATCHCOLORTYPE_AUTOMATIC => 1

    /**
     * The swatch is filled with a solid RGB color.
     * @type {Integer (Int32)}
     */
    static UI_SWATCHCOLORTYPE_RGB => 2
}
