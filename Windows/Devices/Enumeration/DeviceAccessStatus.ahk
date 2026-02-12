#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the status of the access to a device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceaccessstatus
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DeviceAccessStatus extends Win32Enum{

    /**
     * The device access is not specified.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * Access to the device is allowed.
     * @type {Integer (Int32)}
     */
    static Allowed => 1

    /**
     * Access to the device has been disallowed by the user.
     * @type {Integer (Int32)}
     */
    static DeniedByUser => 2

    /**
     * Access to the device has been disallowed by the system.
     * @type {Integer (Int32)}
     */
    static DeniedBySystem => 3
}
