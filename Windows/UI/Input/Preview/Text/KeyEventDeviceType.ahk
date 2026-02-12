#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class KeyEventDeviceType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static HardwareKeyboard => 1

    /**
     * @type {Integer (Int32)}
     */
    static SoftwareKeyboard => 2

    /**
     * @type {Integer (Int32)}
     */
    static Gamepad => 3

    /**
     * @type {Integer (Int32)}
     */
    static Injection => 4
}
