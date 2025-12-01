#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_STREAM\_UNITS enumeration specifies the unit types to be used for IPortableDeviceUnitsStream operations.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-stream-units
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_STREAM_UNITS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STREAM_UNITS_BYTES => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STREAM_UNITS_FRAMES => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STREAM_UNITS_ROWS => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STREAM_UNITS_MILLISECONDS => 4

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STREAM_UNITS_MICROSECONDS => 8
}
