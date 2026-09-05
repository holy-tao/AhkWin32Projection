#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies values that identify the font property state of a FontControl, such as Strikethrough.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ne-uiribbon-ui_fontproperties
 * @namespace Windows.Win32.UI.Ribbon
 */
class UI_FONTPROPERTIES extends Win32Enum {

    /**
     * The property is not available.
     * Native name: UI_FONTPROPERTIES_NOTAVAILABLE
     * @type {Integer (Int32)}
     */
    static NOTAVAILABLE => 0

    /**
     * The property is not set.
     * Native name: UI_FONTPROPERTIES_NOTSET
     * @type {Integer (Int32)}
     */
    static NOTSET => 1

    /**
     * The property is set.
     * Native name: UI_FONTPROPERTIES_SET
     * @type {Integer (Int32)}
     */
    static SET => 2
}
