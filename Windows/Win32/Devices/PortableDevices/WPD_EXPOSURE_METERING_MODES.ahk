#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-exposure-metering-modes
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_EXPOSURE_METERING_MODES{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_EXPOSURE_METERING_MODE_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_EXPOSURE_METERING_MODE_AVERAGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_EXPOSURE_METERING_MODE_CENTER_WEIGHTED_AVERAGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_EXPOSURE_METERING_MODE_MULTI_SPOT => 3

    /**
     * @type {Integer (Int32)}
     */
    static WPD_EXPOSURE_METERING_MODE_CENTER_SPOT => 4
}
