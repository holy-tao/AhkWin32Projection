#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies values that identify the font property state of a FontControl, such as Strikethrough.
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/ne-uiribbon-ui_fontproperties
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class UI_FONTPROPERTIES{

    /**
     * The property is not available.
     * @type {Integer (Int32)}
     */
    static UI_FONTPROPERTIES_NOTAVAILABLE => 0

    /**
     * The property is not set.
     * @type {Integer (Int32)}
     */
    static UI_FONTPROPERTIES_NOTSET => 1

    /**
     * The property is set.
     * @type {Integer (Int32)}
     */
    static UI_FONTPROPERTIES_SET => 2
}
