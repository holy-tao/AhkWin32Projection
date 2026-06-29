#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the supported version of Wi-Fi Protected Setup (WPS).
 * @see https://learn.microsoft.com/windows/win32/api/wcntypes/ne-wcntypes-wcn_value_type_version
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 */
export default struct WCN_VALUE_TYPE_VERSION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies WPS 1.0. Indicates compliance with Wi-Fi Alliance protocol specification for Wi-Fi Protected Setup (WPS) 1.0h.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_VERSION_1_0 => 16

    /**
     * Specifies WPS 2.0.  Indicates compliance with Wi-Fi Alliance protocol specification for Wi-Fi Simple Configuration (WSC) 2.0.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_VERSION_2_0 => 32
}
