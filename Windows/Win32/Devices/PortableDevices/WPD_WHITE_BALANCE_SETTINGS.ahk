#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WPD\_WHITE\_BALANCE\_SETTINGS enumeration type describes how a video or image device weights color channels to achieve a proper white balance.
 * @remarks
 * This enumeration is used by the [WPD\_STILL\_IMAGE\_WHITE\_BALANCE](still-image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-white-balance-settings
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_WHITE_BALANCE_SETTINGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
