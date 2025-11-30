#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 */
class CHOOSEFONT_FONT_TYPE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt16)}
     */
    static BOLD_FONTTYPE => 256

    /**
     * @type {Integer (UInt16)}
     */
    static ITALIC_FONTTYPE => 512

    /**
     * @type {Integer (UInt16)}
     */
    static PRINTER_FONTTYPE => 16384

    /**
     * @type {Integer (UInt16)}
     */
    static REGULAR_FONTTYPE => 1024

    /**
     * @type {Integer (UInt16)}
     */
    static SCREEN_FONTTYPE => 8192

    /**
     * @type {Integer (UInt16)}
     */
    static SIMULATED_FONTTYPE => 32768
}
