#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_EXPOSURE\_PROGRAM\_MODES enumeration type describes an exposure mode to use when capturing images with a device.
 * @remarks
 * Indicates the exposure program mode of the device. This enumeration is used by the [WPD\_STILL\_IMAGE\_EXPOSURE\_PROGRAM\_MODE](still-image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-exposure-program-modes
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_EXPOSURE_PROGRAM_MODES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_EXPOSURE_PROGRAM_MODE_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_EXPOSURE_PROGRAM_MODE_MANUAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_EXPOSURE_PROGRAM_MODE_AUTO => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_EXPOSURE_PROGRAM_MODE_APERTURE_PRIORITY => 3

    /**
     * @type {Integer (Int32)}
     */
    static WPD_EXPOSURE_PROGRAM_MODE_SHUTTER_PRIORITY => 4

    /**
     * @type {Integer (Int32)}
     */
    static WPD_EXPOSURE_PROGRAM_MODE_CREATIVE => 5

    /**
     * @type {Integer (Int32)}
     */
    static WPD_EXPOSURE_PROGRAM_MODE_ACTION => 6

    /**
     * @type {Integer (Int32)}
     */
    static WPD_EXPOSURE_PROGRAM_MODE_PORTRAIT => 7
}
