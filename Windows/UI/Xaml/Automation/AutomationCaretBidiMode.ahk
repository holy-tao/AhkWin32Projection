#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the direction that the caret travels.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationcaretbidimode
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class AutomationCaretBidiMode extends Win32Enum{

    /**
     * Left to right.
     * @type {Integer (Int32)}
     */
    static LTR => 0

    /**
     * Right to left.
     * @type {Integer (Int32)}
     */
    static RTL => 1
}
