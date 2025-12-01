#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains possible values for the SelectionActiveEnd text attribute, which indicates the location of the caret relative to a text range that represents the currently selected text.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-activeend
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ActiveEnd extends Win32Enum{

    /**
     * The caret is not at either end of the text range.
     * @type {Integer (Int32)}
     */
    static ActiveEnd_None => 0

    /**
     * The caret is at the beginning of the text range.
     * @type {Integer (Int32)}
     */
    static ActiveEnd_Start => 1

    /**
     * The caret is at the end of the text range.
     * @type {Integer (Int32)}
     */
    static ActiveEnd_End => 2
}
