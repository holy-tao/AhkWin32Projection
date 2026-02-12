#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the possible states of the [BluetoothLEAdvertisementWatcher](bluetoothleadvertisementwatcher.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementwatcherstatus
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAdvertisementWatcherStatus extends Win32Enum{

    /**
     * The initial status of the watcher.
     * @type {Integer (Int32)}
     */
    static Created => 0

    /**
     * The watcher is started.
     * @type {Integer (Int32)}
     */
    static Started => 1

    /**
     * The watcher stop command was issued.
     * @type {Integer (Int32)}
     */
    static Stopping => 2

    /**
     * The watcher is stopped.
     * @type {Integer (Int32)}
     */
    static Stopped => 3

    /**
     * An error occurred during transition or scanning that stopped the watcher due to an error.
     * @type {Integer (Int32)}
     */
    static Aborted => 4
}
