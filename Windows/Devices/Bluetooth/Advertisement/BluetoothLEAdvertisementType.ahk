#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the different types of Bluetooth LE advertisement payloads.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementtype
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAdvertisementType extends Win32Enum{

    /**
     * The advertisement is undirected and indicates that the device is connectable and scannable. This advertisement type can carry data.
     * 
     * This corresponds with the ADV_IND type defined in the Bluetooth LE specifications.
     * @type {Integer (Int32)}
     */
    static ConnectableUndirected => 0

    /**
     * The advertisement is directed and indicates that the device is connectable but not scannable. This advertisement type cannot carry data.
     * 
     * This corresponds with the ADV_DIRECT_IND type defined in the Bluetooth LE specifications.
     * @type {Integer (Int32)}
     */
    static ConnectableDirected => 1

    /**
     * The advertisement is undirected and indicates that the device is scannable but not connectable. This advertisement type can carry data.
     * 
     * This corresponds with the ADV_SCAN_IND type defined in the Bluetooth LE specifications.
     * @type {Integer (Int32)}
     */
    static ScannableUndirected => 2

    /**
     * The advertisement is undirected and indicates that the device is not connectable nor scannable. This advertisement type can carry data.
     * 
     * This corresponds with the ADV_NONCONN_IND type defined in the Bluetooth LE specifications.
     * @type {Integer (Int32)}
     */
    static NonConnectableUndirected => 3

    /**
     * This advertisement is a scan response to a scan request issued for a scannable advertisement. This advertisement type can carry data.
     * 
     * This corresponds with the SCAN_RSP type defined in the Bluetooth LE specifications.
     * @type {Integer (Int32)}
     */
    static ScanResponse => 4

    /**
     * This advertisement is a 5.0 extended advertisement. This advertisement type may have different properties, and is not necessarily directed, connected, scannable, nor a scan response.
     * 
     * See the [advertisement event properties](bluetoothleadvertisementreceivedeventargs.md) to determine the advertisement details.
     * @type {Integer (Int32)}
     */
    static Extended => 5
}
