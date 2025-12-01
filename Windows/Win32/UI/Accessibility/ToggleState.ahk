#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the toggle state of a Microsoft UI Automation element that implements the Toggle control pattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-togglestate
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ToggleState extends Win32Enum{

    /**
     * The UI Automation element is not selected, checked, marked or otherwise activated.
     * @type {Integer (Int32)}
     */
    static ToggleState_Off => 0

    /**
     * The UI Automation element is selected, checked, marked or otherwise activated.
     * @type {Integer (Int32)}
     */
    static ToggleState_On => 1

    /**
     * The UI Automation element is in an indeterminate state. 
     *             
     * 
     * The Indeterminate property can be used to indicate whether the user has acted 
     *             on a control. For example, a check box can appear checked and dimmed, indicating an indeterminate state.
     *             
     * 
     * Creating an indeterminate state is different from disabling the control. 
     *             Consequently, a check box in the indeterminate state can still receive the focus. 
     *             When the user clicks an indeterminate control the ToggleState cycles to its next value.
     * @type {Integer (Int32)}
     */
    static ToggleState_Indeterminate => 2
}
