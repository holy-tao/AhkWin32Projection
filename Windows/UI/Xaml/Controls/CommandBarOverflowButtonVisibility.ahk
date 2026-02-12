#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify when a command bar's overflow button is shown.
 * @remarks
 * This enumeration provides values for the [CommandBar.OverflowButtonVisibility](commandbar_overflowbuttonvisibility.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbaroverflowbuttonvisibility
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CommandBarOverflowButtonVisibility extends Win32Enum{

    /**
     * The overflow button automatically hides when there are no secondary commands and the closed state of the [CommandBar](commandbar.md) is the same as the open state.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * The overflow button is always shown.
     * @type {Integer (Int32)}
     */
    static Visible => 1

    /**
     * The overflow button is never shown.
     * @type {Integer (Int32)}
     */
    static Collapsed => 2
}
