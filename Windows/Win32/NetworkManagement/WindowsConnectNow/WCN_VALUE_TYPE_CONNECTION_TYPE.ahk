#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * WCN_VALUE_TYPE_CONNECTION_TYPE.
 * @see https://learn.microsoft.com/windows/win32/api/wcntypes/ne-wcntypes-wcn_value_type_connection_type
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 */
export default struct WCN_VALUE_TYPE_CONNECTION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies an ESS (infrastructure network) connection.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CT_ESS => 1

    /**
     * Specifies an IBSS (ad-hoc network) connection.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CT_IBSS => 2
}
