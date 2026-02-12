#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies if the map responds to a touch gesture and if the corresponding UI control appears on the map.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapinteractionmode
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapInteractionMode extends Win32Enum{

    /**
     * Map UI control, mouse, keyboard, pen, and touch input are enabled based on the type of device that your app is running on.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Map UI control and touch input are disabled.
     * @type {Integer (Int32)}
     */
    static Disabled => 1

    /**
     * Map responds to touch input only; the corresponding UI control is not visible. Use PointerAndKeyboard, if you want all forms of pointer input.
     * @type {Integer (Int32)}
     */
    static GestureOnly => 2

    /**
     * Map responds to mouse, pen, touch and keyboard.
     * @type {Integer (Int32)}
     */
    static PointerAndKeyboard => 2

    /**
     * Map responds to the UI control only; the corresponding touch input is disabled.
     * @type {Integer (Int32)}
     */
    static ControlOnly => 3

    /**
     * Map UI control and touch input are enabled. Pointer and keyboard are not.
     * @type {Integer (Int32)}
     */
    static GestureAndControl => 4

    /**
     * All forms of input are enabled including mouse, pen, touch, keyboard, and Map UI control.
     * @type {Integer (Int32)}
     */
    static PointerKeyboardAndControl => 4

    /**
     * Map responds to mouse, pen, or touch only.
     * @type {Integer (Int32)}
     */
    static PointerOnly => 5
}
