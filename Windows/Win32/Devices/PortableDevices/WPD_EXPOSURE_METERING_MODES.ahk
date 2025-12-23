#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_EXPOSURE\_METERING\_MODES enumeration type describes the metering mode to use when estimating exposure for still image capture by a device.
 * @remarks
 * Indicates the metering mode of the device. This enumeration is used by the [WPD\_STILL\_IMAGE\_EXPOSURE\_METERING\_MODE](still-image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-exposure-metering-modes
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_EXPOSURE_METERING_MODES extends Win32Enum{

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
