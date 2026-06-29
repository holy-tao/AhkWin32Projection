#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * WCN_VALUE_TYPE_ASSOCIATION_STATE enumeration defines the possible association states of a wireless station during a Discovery request.
 * @see https://learn.microsoft.com/windows/win32/api/wcntypes/ne-wcntypes-wcn_value_type_association_state
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 */
export default struct WCN_VALUE_TYPE_ASSOCIATION_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The wireless station is not associated.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_AS_NOT_ASSOCIATED => 0

    /**
     * The connection was successfully established.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_AS_CONNECTION_SUCCESS => 1

    /**
     * The wireless station is not properly configured.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_AS_CONFIGURATION_FAILURE => 2

    /**
     * Association has failed.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_AS_ASSOCIATION_FAILURE => 3

    /**
     * The specified IP address could not be connected to, and may be invalid.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_AS_IP_FAILURE => 4
}
