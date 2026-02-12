#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the direction of flow.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationflowdirections
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class AutomationFlowDirections extends Win32Enum{

    /**
     * Flow is in the default direction.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Flow is from right to left.
     * @type {Integer (Int32)}
     */
    static RightToLeft => 1

    /**
     * Flow is from bottom to top.
     * @type {Integer (Int32)}
     */
    static BottomToTop => 2

    /**
     * Flow is vertical.
     * @type {Integer (Int32)}
     */
    static Vertical => 3
}
