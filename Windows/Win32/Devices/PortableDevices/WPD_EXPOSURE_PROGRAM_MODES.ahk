#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_EXPOSURE\_PROGRAM\_MODES enumeration type describes an exposure mode to use when capturing images with a device.
 * @remarks
 * Indicates the exposure program mode of the device. This enumeration is used by the [WPD\_STILL\_IMAGE\_EXPOSURE\_PROGRAM\_MODE](still-image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-exposure-program-modes
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_EXPOSURE_PROGRAM_MODES extends Win32Enum {

    /**
     * Native name: WPD_EXPOSURE_PROGRAM_MODE_UNDEFINED
     * @type {Integer (Int32)}
     */
    static MODE_UNDEFINED => 0

    /**
     * Native name: WPD_EXPOSURE_PROGRAM_MODE_MANUAL
     * @type {Integer (Int32)}
     */
    static MODE_MANUAL => 1

    /**
     * Native name: WPD_EXPOSURE_PROGRAM_MODE_AUTO
     * @type {Integer (Int32)}
     */
    static MODE_AUTO => 2

    /**
     * Native name: WPD_EXPOSURE_PROGRAM_MODE_APERTURE_PRIORITY
     * @type {Integer (Int32)}
     */
    static MODE_APERTURE_PRIORITY => 3

    /**
     * Native name: WPD_EXPOSURE_PROGRAM_MODE_SHUTTER_PRIORITY
     * @type {Integer (Int32)}
     */
    static MODE_SHUTTER_PRIORITY => 4

    /**
     * Native name: WPD_EXPOSURE_PROGRAM_MODE_CREATIVE
     * @type {Integer (Int32)}
     */
    static MODE_CREATIVE => 5

    /**
     * Native name: WPD_EXPOSURE_PROGRAM_MODE_ACTION
     * @type {Integer (Int32)}
     */
    static MODE_ACTION => 6

    /**
     * Native name: WPD_EXPOSURE_PROGRAM_MODE_PORTRAIT
     * @type {Integer (Int32)}
     */
    static MODE_PORTRAIT => 7
}
