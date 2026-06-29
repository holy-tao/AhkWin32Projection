#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the wireless interface type.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_interface_type
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_INTERFACE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies an emulated 802.11 interface.
     * @type {Integer (Int32)}
     */
    static wlan_interface_type_emulated_802_11 => 0

    /**
     * Specifies a native 802.11 interface.
     * @type {Integer (Int32)}
     */
    static wlan_interface_type_native_802_11 => 1

    /**
     * The interface specified is invalid.
     * @type {Integer (Int32)}
     */
    static wlan_interface_type_invalid => 2
}
