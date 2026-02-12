#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The device type of the controller.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.xusbdevicetype
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class XusbDeviceType extends Win32Enum{

    /**
     * The controller device type is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The controller device type is gamepad.
     * @type {Integer (Int32)}
     */
    static Gamepad => 1
}
