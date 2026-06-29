#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WLAN_IHV_CONTROL_TYPE enumeration specifies the type of software bypassed by a vendor-specific method.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_ihv_control_type~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_IHV_CONTROL_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Bypasses a WLAN service.
     * @type {Integer (Int32)}
     */
    static wlan_ihv_control_type_service => 0

    /**
     * Bypasses a WLAN driver.
     * @type {Integer (Int32)}
     */
    static wlan_ihv_control_type_driver => 1
}
