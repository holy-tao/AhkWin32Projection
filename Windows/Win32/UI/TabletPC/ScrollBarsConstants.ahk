#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the scroll bars of an InkEdit control appear on the screen.
 * @see https://learn.microsoft.com/windows/win32/api/inked/ne-inked-scrollbarsconstants
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class ScrollBarsConstants extends Win32Enum{

    /**
     * Default. No scroll bars.
     * @type {Integer (Int32)}
     */
    static rtfNone => 0

    /**
     * Horizontal scroll bar only.
     * @type {Integer (Int32)}
     */
    static rtfHorizontal => 1

    /**
     * Vertical scroll bar only.
     * @type {Integer (Int32)}
     */
    static rtfVertical => 2

    /**
     * Both horizontal and vertical scroll bars.
     * @type {Integer (Int32)}
     */
    static rtfBoth => 3
}
