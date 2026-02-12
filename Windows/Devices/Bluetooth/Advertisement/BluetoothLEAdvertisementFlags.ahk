#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify flags used to match flags contained inside a Bluetooth LE advertisement payload.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementflags
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAdvertisementFlags extends Win32BitflagEnum{

    /**
     * Specifies no flag.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Specifies Bluetooth LE Limited Discoverable Mode.
     * @type {Integer (UInt32)}
     */
    static LimitedDiscoverableMode => 1

    /**
     * Specifies Bluetooth LE General Discoverable Mode.
     * @type {Integer (UInt32)}
     */
    static GeneralDiscoverableMode => 2

    /**
     * Specifies Bluetooth BR/EDR not supported.
     * @type {Integer (UInt32)}
     */
    static ClassicNotSupported => 4

    /**
     * Specifies simultaneous Bluetooth LE and BR/EDR to same device capable (controller).
     * @type {Integer (UInt32)}
     */
    static DualModeControllerCapable => 8

    /**
     * Specifies simultaneous Bluetooth LE and BR/EDR to same device capable (host)
     * @type {Integer (UInt32)}
     */
    static DualModeHostCapable => 16
}
