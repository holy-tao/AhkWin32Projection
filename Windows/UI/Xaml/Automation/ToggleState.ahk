#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the [ToggleState](../windows.ui.xaml.automation.peers/togglebuttonautomationpeer_togglestate.md) of a UI Automation element.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.togglestate
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class ToggleState extends Win32Enum{

    /**
     * The UI Automation element isn't selected, checked, marked, or otherwise activated.
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * The UI Automation element is selected, checked, marked, or otherwise activated.
     * @type {Integer (Int32)}
     */
    static On => 1

    /**
     * The UI Automation element is in an indeterminate state.
     * @type {Integer (Int32)}
     */
    static Indeterminate => 2
}
