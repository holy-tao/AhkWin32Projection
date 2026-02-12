#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the connection status of the device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothconnectionstatus
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothConnectionStatus extends Win32Enum{

    /**
     * The device is disconnected.
     * @type {Integer (Int32)}
     */
    static Disconnected => 0

    /**
     * The device is connected.
     * @type {Integer (Int32)}
     */
    static Connected => 1
}
