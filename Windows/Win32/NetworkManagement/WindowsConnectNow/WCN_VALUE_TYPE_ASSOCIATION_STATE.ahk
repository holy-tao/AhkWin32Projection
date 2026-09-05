#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * WCN_VALUE_TYPE_ASSOCIATION_STATE enumeration defines the possible association states of a wireless station during a Discovery request.
 * @see https://learn.microsoft.com/windows/win32/api/wcntypes/ne-wcntypes-wcn_value_type_association_state
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 */
class WCN_VALUE_TYPE_ASSOCIATION_STATE extends Win32Enum {

    /**
     * The wireless station is not associated.
     * Native name: WCN_VALUE_AS_NOT_ASSOCIATED
     * @type {Integer (Int32)}
     */
    static AS_NOT_ASSOCIATED => 0

    /**
     * The connection was successfully established.
     * Native name: WCN_VALUE_AS_CONNECTION_SUCCESS
     * @type {Integer (Int32)}
     */
    static AS_CONNECTION_SUCCESS => 1

    /**
     * The wireless station is not properly configured.
     * Native name: WCN_VALUE_AS_CONFIGURATION_FAILURE
     * @type {Integer (Int32)}
     */
    static AS_CONFIGURATION_FAILURE => 2

    /**
     * Association has failed.
     * Native name: WCN_VALUE_AS_ASSOCIATION_FAILURE
     * @type {Integer (Int32)}
     */
    static AS_ASSOCIATION_FAILURE => 3

    /**
     * The specified IP address could not be connected to, and may be invalid.
     * Native name: WCN_VALUE_AS_IP_FAILURE
     * @type {Integer (Int32)}
     */
    static AS_IP_FAILURE => 4
}
