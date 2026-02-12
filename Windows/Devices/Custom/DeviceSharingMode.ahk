#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The device sharing mode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.devicesharingmode
 * @namespace Windows.Devices.Custom
 * @version WindowsRuntime 1.4
 */
class DeviceSharingMode extends Win32Enum{

    /**
     * The device is shared.
     * @type {Integer (Int32)}
     */
    static Shared => 0

    /**
     * The device is exclusive.
     * @type {Integer (Int32)}
     */
    static Exclusive => 1
}
