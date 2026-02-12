#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the input device types from which input events are received.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.focusinputdevicekind
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class FocusInputDeviceKind extends Win32Enum{

    /**
     * No input. Used only when the focus is moved programmatically.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Mouse input device.
     * @type {Integer (Int32)}
     */
    static Mouse => 1

    /**
     * Touch input device.
     * @type {Integer (Int32)}
     */
    static Touch => 2

    /**
     * Pen input device.
     * @type {Integer (Int32)}
     */
    static Pen => 3

    /**
     * Keyboard input device.
     * @type {Integer (Int32)}
     */
    static Keyboard => 4

    /**
     * Game controller/remote control input device.
     * @type {Integer (Int32)}
     */
    static GameController => 5
}
