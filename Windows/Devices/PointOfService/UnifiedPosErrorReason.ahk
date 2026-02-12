#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicates the reason for the error event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.unifiedposerrorreason
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class UnifiedPosErrorReason extends Win32Enum{

    /**
     * Unknown reason.
     * @type {Integer (Int32)}
     */
    static UnknownErrorReason => 0

    /**
     * Cannot communicate with the device, possibly due to a configuration error.
     * @type {Integer (Int32)}
     */
    static NoService => 1

    /**
     * The device is not enabled.
     * @type {Integer (Int32)}
     */
    static Disabled => 2

    /**
     * The operation is not supported or not available on the device.
     * @type {Integer (Int32)}
     */
    static Illegal => 3

    /**
     * The device is not connected or not powered on.
     * @type {Integer (Int32)}
     */
    static NoHardware => 4

    /**
     * The device is closed.
     * @type {Integer (Int32)}
     */
    static Closed => 5

    /**
     * The device is offline.
     * @type {Integer (Int32)}
     */
    static Offline => 6

    /**
     * The operation failed although the device was connected and powered on.
     * @type {Integer (Int32)}
     */
    static Failure => 7

    /**
     * The operation timed out while waiting for a response from the device.
     * @type {Integer (Int32)}
     */
    static Timeout => 8

    /**
     * The device is busy.
     * @type {Integer (Int32)}
     */
    static Busy => 9

    /**
     * The operation failed and returned a vendor specific error information.
     * @type {Integer (Int32)}
     */
    static Extended => 10
}
