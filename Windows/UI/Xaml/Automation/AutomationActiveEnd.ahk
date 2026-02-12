#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for the SelectionActiveEnd text attribute, which indicates the location of the caret relative to a text range that represents the currently selected text.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationactiveend
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class AutomationActiveEnd extends Win32Enum{

    /**
     * The caret is not at either end of the text range.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The caret is at the beginning of the text range.
     * @type {Integer (Int32)}
     */
    static Start => 1

    /**
     * The caret is at the end of the text range.
     * @type {Integer (Int32)}
     */
    static End => 2
}
