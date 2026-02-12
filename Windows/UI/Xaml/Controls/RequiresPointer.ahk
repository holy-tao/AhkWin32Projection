#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify when an element requires a mouse-like pointer behavior from a game pad.
 * @remarks
 * This enumeration provides values for the [Control.RequiresPointer](control_requirespointer.md) property.
 * 
 * [RequiresPointer](control_requirespointer.md) is supported only on the Xbox device family, and only when using a game pad or remote control. The property is ignored otherwise.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.requirespointer
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RequiresPointer extends Win32Enum{

    /**
     * The pointer never acts as a mouse.
     * @type {Integer (Int32)}
     */
    static Never => 0

    /**
     * The pointer acts as a mouse when the user engages mouse-mode.
     * @type {Integer (Int32)}
     */
    static WhenEngaged => 1

    /**
     * The pointer acts as a mouse when the page gets focus. Supported on [Page](page.md) elements only.
     * @type {Integer (Int32)}
     */
    static WhenFocused => 2
}
