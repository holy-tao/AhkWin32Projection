#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Enumerates pointer device types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pointerdevicetype
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class PointerDeviceType extends Win32Enum{

    /**
     * A touch-enabled device
     * @type {Integer (Int32)}
     */
    static Touch => 0

    /**
     * Pen
     * @type {Integer (Int32)}
     */
    static Pen => 1

    /**
     * Mouse
     * @type {Integer (Int32)}
     */
    static Mouse => 2

    /**
     * @type {Integer (Int32)}
     */
    static Touchpad => 3
}
