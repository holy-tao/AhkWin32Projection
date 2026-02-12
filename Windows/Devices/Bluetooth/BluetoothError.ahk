#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies common Bluetooth error cases.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetootherror
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothError extends Win32Enum{

    /**
     * The operation was successfully completed or serviced.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The Bluetooth radio was not available. This error occurs when the Bluetooth radio has been turned off.
     * @type {Integer (Int32)}
     */
    static RadioNotAvailable => 1

    /**
     * The operation cannot be serviced because the necessary resources are currently in use.
     * @type {Integer (Int32)}
     */
    static ResourceInUse => 2

    /**
     * The operation cannot be completed because the remote device is not connected.
     * @type {Integer (Int32)}
     */
    static DeviceNotConnected => 3

    /**
     * An unexpected error has occurred.
     * @type {Integer (Int32)}
     */
    static OtherError => 4

    /**
     * The operation is disabled by policy.
     * @type {Integer (Int32)}
     */
    static DisabledByPolicy => 5

    /**
     * The operation is not supported on the current Bluetooth radio hardware.
     * @type {Integer (Int32)}
     */
    static NotSupported => 6

    /**
     * The operation is disabled by the user.
     * @type {Integer (Int32)}
     */
    static DisabledByUser => 7

    /**
     * The operation requires consent.
     * @type {Integer (Int32)}
     */
    static ConsentRequired => 8

    /**
     * The transport is not supported.
     * @type {Integer (Int32)}
     */
    static TransportNotSupported => 9
}
