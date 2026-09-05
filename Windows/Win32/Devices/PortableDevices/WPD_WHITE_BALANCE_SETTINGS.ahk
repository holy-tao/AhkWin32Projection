#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_WHITE\_BALANCE\_SETTINGS enumeration type describes how a video or image device weights color channels to achieve a proper white balance.
 * @remarks
 * This enumeration is used by the [WPD\_STILL\_IMAGE\_WHITE\_BALANCE](still-image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-white-balance-settings
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_WHITE_BALANCE_SETTINGS extends Win32Enum {

    /**
     * Native name: WPD_WHITE_BALANCE_UNDEFINED
     * @type {Integer (Int32)}
     */
    static UNDEFINED => 0

    /**
     * Native name: WPD_WHITE_BALANCE_MANUAL
     * @type {Integer (Int32)}
     */
    static MANUAL => 1

    /**
     * Native name: WPD_WHITE_BALANCE_AUTOMATIC
     * @type {Integer (Int32)}
     */
    static AUTOMATIC => 2

    /**
     * Native name: WPD_WHITE_BALANCE_ONE_PUSH_AUTOMATIC
     * @type {Integer (Int32)}
     */
    static ONE_PUSH_AUTOMATIC => 3

    /**
     * Native name: WPD_WHITE_BALANCE_DAYLIGHT
     * @type {Integer (Int32)}
     */
    static DAYLIGHT => 4

    /**
     * Native name: WPD_WHITE_BALANCE_FLORESCENT
     * @type {Integer (Int32)}
     */
    static FLORESCENT => 5

    /**
     * Native name: WPD_WHITE_BALANCE_TUNGSTEN
     * @type {Integer (Int32)}
     */
    static TUNGSTEN => 6

    /**
     * Native name: WPD_WHITE_BALANCE_FLASH
     * @type {Integer (Int32)}
     */
    static FLASH => 7
}
