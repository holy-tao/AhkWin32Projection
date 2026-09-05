#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_STREAM\_UNITS enumeration specifies the unit types to be used for IPortableDeviceUnitsStream operations.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-stream-units
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_STREAM_UNITS extends Win32Enum {

    /**
     * Native name: WPD_STREAM_UNITS_BYTES
     * @type {Integer (Int32)}
     */
    static BYTES => 0

    /**
     * Native name: WPD_STREAM_UNITS_FRAMES
     * @type {Integer (Int32)}
     */
    static FRAMES => 1

    /**
     * Native name: WPD_STREAM_UNITS_ROWS
     * @type {Integer (Int32)}
     */
    static ROWS => 2

    /**
     * Native name: WPD_STREAM_UNITS_MILLISECONDS
     * @type {Integer (Int32)}
     */
    static MILLISECONDS => 4

    /**
     * Native name: WPD_STREAM_UNITS_MICROSECONDS
     * @type {Integer (Int32)}
     */
    static MICROSECONDS => 8
}
