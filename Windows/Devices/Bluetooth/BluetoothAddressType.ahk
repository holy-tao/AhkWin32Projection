#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the Bluetooth address type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothaddresstype
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothAddressType extends Win32Enum{

    /**
     * Public address.
     * @type {Integer (Int32)}
     */
    static Public => 0

    /**
     * Random address.
     * @type {Integer (Int32)}
     */
    static Random => 1

    /**
     * Unspecified address.
     * @type {Integer (Int32)}
     */
    static Unspecified => 2
}
