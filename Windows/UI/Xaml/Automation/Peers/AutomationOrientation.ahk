#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the orientation direction in which a control can be presented. Values are used by [GetOrientation](automationpeer_getorientation_419829207.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationorientation
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class AutomationOrientation extends Win32Enum{

    /**
     * The control does not have an orientation.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The control is presented horizontally.
     * @type {Integer (Int32)}
     */
    static Horizontal => 1

    /**
     * The control is presented vertically.
     * @type {Integer (Int32)}
     */
    static Vertical => 2
}
