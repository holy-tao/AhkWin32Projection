#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_FLASH\_MODES enumeration type describes a flash mode to use when capturing images with a device.
 * @remarks
 * This enumeration is used by the [WPD\_STILL\_IMAGE\_FLASH\_MODE](still-image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-flash-modes
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_FLASH_MODES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_FLASH_MODE_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_FLASH_MODE_AUTO => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_FLASH_MODE_OFF => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_FLASH_MODE_FILL => 3

    /**
     * @type {Integer (Int32)}
     */
    static WPD_FLASH_MODE_RED_EYE_AUTO => 4

    /**
     * @type {Integer (Int32)}
     */
    static WPD_FLASH_MODE_RED_EYE_FILL => 5

    /**
     * @type {Integer (Int32)}
     */
    static WPD_FLASH_MODE_EXTERNAL_SYNC => 6
}
