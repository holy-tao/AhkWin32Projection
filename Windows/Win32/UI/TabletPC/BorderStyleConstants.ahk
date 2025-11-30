#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the borders of an InkEdit control appear on the screen.
 * @see https://docs.microsoft.com/windows/win32/api//inked/ne-inked-borderstyleconstants
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class BorderStyleConstants extends Win32Enum{

    /**
     * No border.
     * @type {Integer (Int32)}
     */
    static rtfNoBorder => 0

    /**
     * Single line border.
     * @type {Integer (Int32)}
     */
    static rtfFixedSingle => 1
}
