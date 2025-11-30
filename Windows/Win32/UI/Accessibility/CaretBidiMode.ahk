#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains possible values for the CaretBidiMode text attribute, which indicates whether the caret is in text that flows from left to right, or from right to left.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/ne-uiautomationcore-caretbidimode
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class CaretBidiMode extends Win32Enum{

    /**
     * The caret is in text that flows from left to right.
     * @type {Integer (Int32)}
     */
    static CaretBidiMode_LTR => 0

    /**
     * The caret is in text that flows from right to left.
     * @type {Integer (Int32)}
     */
    static CaretBidiMode_RTL => 1
}
