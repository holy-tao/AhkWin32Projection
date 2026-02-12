#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The device access mode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.deviceaccessmode
 * @namespace Windows.Devices.Custom
 * @version WindowsRuntime 1.4
 */
class DeviceAccessMode extends Win32Enum{

    /**
     * Read access.
     * @type {Integer (Int32)}
     */
    static Read => 0

    /**
     * Write access.
     * @type {Integer (Int32)}
     */
    static Write => 1

    /**
     * Read/write access.
     * @type {Integer (Int32)}
     */
    static ReadWrite => 2
}
