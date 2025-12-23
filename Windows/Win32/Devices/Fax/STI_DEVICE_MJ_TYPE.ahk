#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class STI_DEVICE_MJ_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static StiDeviceTypeDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static StiDeviceTypeScanner => 1

    /**
     * @type {Integer (Int32)}
     */
    static StiDeviceTypeDigitalCamera => 2

    /**
     * @type {Integer (Int32)}
     */
    static StiDeviceTypeStreamingVideo => 3
}
