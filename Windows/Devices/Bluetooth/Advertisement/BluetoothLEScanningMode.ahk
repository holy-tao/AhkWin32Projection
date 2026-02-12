#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a Bluetooth LE scanning mode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothlescanningmode
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class BluetoothLEScanningMode extends Win32Enum{

    /**
     * Specifies a passive scanning mode. This is the default scanning mode.
     * @type {Integer (Int32)}
     */
    static Passive => 0

    /**
     * Specifies an active scanning mode. This indicates that scan request packets will be sent from the platform to actively query for more advertisement data of type [BluetoothLEAdvertisementType.ScanResponse](bluetoothleadvertisementtype.md).
     * @type {Integer (Int32)}
     */
    static Active => 1

    /**
     * Specifies no scanning mode. The watcher will provide advertisements as the system receives them, but will not initiate its own scanning.
     * @type {Integer (Int32)}
     */
    static None => 2
}
