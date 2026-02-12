#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies when the [Click](../windows.ui.xaml.controls.primitives/buttonbase_click.md) event should be raised for a control.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.clickmode
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ClickMode extends Win32Enum{

    /**
     * Specifies that the [Click](../windows.ui.xaml.controls.primitives/buttonbase_click.md) event should be raised when the left mouse button is pressed and released, and the mouse pointer is over the control. If you are using the keyboard, specifies that the [Click](../windows.ui.xaml.controls.primitives/buttonbase_click.md) event should be raised when the SPACEBAR or ENTER key is pressed and released, and the control has keyboard focus.
     * @type {Integer (Int32)}
     */
    static Release => 0

    /**
     * Specifies that the [Click](../windows.ui.xaml.controls.primitives/buttonbase_click.md) event should be raised when the mouse button is pressed and the mouse pointer is over the control. If you are using the keyboard, specifies that the [Click](../windows.ui.xaml.controls.primitives/buttonbase_click.md) event should be raised when the SPACEBAR or ENTER key is pressed and the control has keyboard focus.
     * @type {Integer (Int32)}
     */
    static Press => 1

    /**
     * Specifies that the [Click](../windows.ui.xaml.controls.primitives/buttonbase_click.md) event should be raised when the mouse pointer moves over the control.
     * @type {Integer (Int32)}
     */
    static Hover => 2
}
