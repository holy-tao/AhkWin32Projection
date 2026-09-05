#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 */
class STI_DEVICE_MJ_TYPE extends Win32Enum {

    /**
     * Native name: StiDeviceTypeDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Native name: StiDeviceTypeScanner
     * @type {Integer (Int32)}
     */
    static Scanner => 1

    /**
     * Native name: StiDeviceTypeDigitalCamera
     * @type {Integer (Int32)}
     */
    static DigitalCamera => 2

    /**
     * Native name: StiDeviceTypeStreamingVideo
     * @type {Integer (Int32)}
     */
    static StreamingVideo => 3
}
