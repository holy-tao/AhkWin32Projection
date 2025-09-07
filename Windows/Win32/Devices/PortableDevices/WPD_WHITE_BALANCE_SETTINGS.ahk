#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WPD\_WHITE\_BALANCE\_SETTINGS enumeration type describes how a video or image device weights color channels to achieve a proper white balance.
 * @remarks
 * This enumeration is used by the [WPD\_STILL\_IMAGE\_WHITE\_BALANCE](still-image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-white-balance-settings
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_WHITE_BALANCE_SETTINGS{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_WHITE_BALANCE_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_WHITE_BALANCE_MANUAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_WHITE_BALANCE_AUTOMATIC => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_WHITE_BALANCE_ONE_PUSH_AUTOMATIC => 3

    /**
     * @type {Integer (Int32)}
     */
    static WPD_WHITE_BALANCE_DAYLIGHT => 4

    /**
     * @type {Integer (Int32)}
     */
    static WPD_WHITE_BALANCE_FLORESCENT => 5

    /**
     * @type {Integer (Int32)}
     */
    static WPD_WHITE_BALANCE_TUNGSTEN => 6

    /**
     * @type {Integer (Int32)}
     */
    static WPD_WHITE_BALANCE_FLASH => 7
}
