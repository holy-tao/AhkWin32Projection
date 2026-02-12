#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the status of a Bluetooth LE preferred connection parameters request.
  * 
  * For more information on connection parameters and PHY, please reference the [Bluetooth Core Specification](https://www.bluetooth.com/specifications/specs/core-specification-5-3/).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothlepreferredconnectionparametersrequeststatus
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothLEPreferredConnectionParametersRequestStatus extends Win32Enum{

    /**
     * Specifies that the status is unspecified.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * Specifies that the request was accepted by the system. When the parameters are negotiated, the [BluetoothLEDevice.ConnectionParametersChanged](bluetoothledevice_connectionparameterschanged.md) event is raised.
     * @type {Integer (Int32)}
     */
    static Success => 1

    /**
     * Specifies that a Bluetooth radio was not available on the system, or that the device was not previously discovered.
     * @type {Integer (Int32)}
     */
    static DeviceNotAvailable => 2

    /**
     * Specifies that access to the device was blocked by the user or by system policy.
     * @type {Integer (Int32)}
     */
    static AccessDenied => 3
}
