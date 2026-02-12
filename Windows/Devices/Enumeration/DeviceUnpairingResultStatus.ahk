#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The result of the unpairing action.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceunpairingresultstatus
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DeviceUnpairingResultStatus extends Win32Enum{

    /**
     * The device object is successfully unpaired.
     * @type {Integer (Int32)}
     */
    static Unpaired => 0

    /**
     * The device object was already unpaired.
     * @type {Integer (Int32)}
     */
    static AlreadyUnpaired => 1

    /**
     * The device object is currently in the middle of either a pairing or unpairing action.
     * @type {Integer (Int32)}
     */
    static OperationAlreadyInProgress => 2

    /**
     * The caller does not have sufficient permissions to unpair the device.
     * @type {Integer (Int32)}
     */
    static AccessDenied => 3

    /**
     * An unknown failure occurred.
     * @type {Integer (Int32)}
     */
    static Failed => 4
}
