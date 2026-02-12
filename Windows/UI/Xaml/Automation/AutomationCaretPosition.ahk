#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the caret position.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationcaretposition
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class AutomationCaretPosition extends Win32Enum{

    /**
     * Caret position is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Caret is at the end of the line.
     * @type {Integer (Int32)}
     */
    static EndOfLine => 1

    /**
     * Caret is at the beginning of the line.
     * @type {Integer (Int32)}
     */
    static BeginningOfLine => 2
}
