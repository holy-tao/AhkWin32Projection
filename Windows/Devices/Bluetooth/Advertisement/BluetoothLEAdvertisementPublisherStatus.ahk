#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the possible states of the [BluetoothLEAdvertisementPublisher](bluetoothleadvertisementpublisher.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementpublisherstatus
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAdvertisementPublisherStatus extends Win32Enum{

    /**
     * The initial status of the publisher.
     * @type {Integer (Int32)}
     */
    static Created => 0

    /**
     * The publisher is waiting to get service time.
     * @type {Integer (Int32)}
     */
    static Waiting => 1

    /**
     * The publisher is being serviced and has started advertising.
     * @type {Integer (Int32)}
     */
    static Started => 2

    /**
     * The publisher was issued a stop command.
     * @type {Integer (Int32)}
     */
    static Stopping => 3

    /**
     * The publisher has stopped advertising.
     * @type {Integer (Int32)}
     */
    static Stopped => 4

    /**
     * The publisher is aborted due to an error.
     * @type {Integer (Int32)}
     */
    static Aborted => 5
}
