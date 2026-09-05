#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_FLASH\_MODES enumeration type describes a flash mode to use when capturing images with a device.
 * @remarks
 * This enumeration is used by the [WPD\_STILL\_IMAGE\_FLASH\_MODE](still-image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-flash-modes
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_FLASH_MODES extends Win32Enum {

    /**
     * Native name: WPD_FLASH_MODE_UNDEFINED
     * @type {Integer (Int32)}
     */
    static MODE_UNDEFINED => 0

    /**
     * Native name: WPD_FLASH_MODE_AUTO
     * @type {Integer (Int32)}
     */
    static MODE_AUTO => 1

    /**
     * Native name: WPD_FLASH_MODE_OFF
     * @type {Integer (Int32)}
     */
    static MODE_OFF => 2

    /**
     * Native name: WPD_FLASH_MODE_FILL
     * @type {Integer (Int32)}
     */
    static MODE_FILL => 3

    /**
     * Native name: WPD_FLASH_MODE_RED_EYE_AUTO
     * @type {Integer (Int32)}
     */
    static MODE_RED_EYE_AUTO => 4

    /**
     * Native name: WPD_FLASH_MODE_RED_EYE_FILL
     * @type {Integer (Int32)}
     */
    static MODE_RED_EYE_FILL => 5

    /**
     * Native name: WPD_FLASH_MODE_EXTERNAL_SYNC
     * @type {Integer (Int32)}
     */
    static MODE_EXTERNAL_SYNC => 6
}
