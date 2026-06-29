#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WLAN_POWER_SETTING enumeration specifies the power setting of an interface.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_power_setting~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_POWER_SETTING {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies no power-saving activity performed by the 802.11 station.
     * @type {Integer (Int32)}
     */
    static wlan_power_setting_no_saving => 0

    /**
     * Specifies a power save polling (PSP) mode that uses the fastest power-saving mode. This power mode must provide the best combination of network performance and power usage.
     * @type {Integer (Int32)}
     */
    static wlan_power_setting_low_saving => 1

    /**
     * Specifies a PSP mode that uses the maximum (MAX) power saving capabilities. The MAX power save mode results in the greatest power savings for the radio on the 802.11 station.
     * @type {Integer (Int32)}
     */
    static wlan_power_setting_medium_saving => 2

    /**
     * Specifies a proprietary PSP mode implemented by the independent hardware vendor (IHV) that exceeds the wlan_power_setting_medium_saving power-saving level.
     * @type {Integer (Int32)}
     */
    static wlan_power_setting_maximum_saving => 3

    /**
     * The supplied power setting is invalid.
     * @type {Integer (Int32)}
     */
    static wlan_power_setting_invalid => 4
}
