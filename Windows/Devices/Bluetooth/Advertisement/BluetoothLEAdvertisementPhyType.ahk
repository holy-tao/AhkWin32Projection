#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAdvertisementPhyType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * @type {Integer (Int32)}
     */
    static Uncoded1MPhy => 1

    /**
     * @type {Integer (Int32)}
     */
    static Uncoded2MPhy => 2

    /**
     * @type {Integer (Int32)}
     */
    static CodedPhy => 3
}
