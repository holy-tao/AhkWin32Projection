#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the 2D directional navigation behavior when using the keyboard arrow keys.
 * @remarks
 * This enumeration is used by the [UIElement.XYFocusKeyboardNavigation](../windows.ui.xaml/uielement_xyfocuskeyboardnavigation.md) property.
 * 
 * 2D directional navigation is used to navigate a user interface (UI) with a gamepad, remote control, or keyboard directional arrows. For more info, see [Gamepad and remote control interactions](/windows/uwp/input-and-devices/gamepad-and-remote-interactions) and [UIElement.XYFocusKeyboardNavigation](../windows.ui.xaml/uielement_xyfocuskeyboardnavigation.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.xyfocuskeyboardnavigationmode
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class XYFocusKeyboardNavigationMode extends Win32Enum{

    /**
     * Behavior is inherited from the elements ancestors. If all ancestors have a value of **Auto**, the fallback behavior is **Disabled**.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Arrow keys can be used for 2D directional navigation.
     * @type {Integer (Int32)}
     */
    static Enabled => 1

    /**
     * Arrow keys cannot be used for 2D directional navigation.
     * @type {Integer (Int32)}
     */
    static Disabled => 2
}
