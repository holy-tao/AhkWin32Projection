#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * WCN_VALUE_TYPE_CONNECTION_TYPE.
 * @see https://learn.microsoft.com/windows/win32/api/wcntypes/ne-wcntypes-wcn_value_type_connection_type
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 */
class WCN_VALUE_TYPE_CONNECTION_TYPE extends Win32Enum {

    /**
     * Specifies an ESS (infrastructure network) connection.
     * Native name: WCN_VALUE_CT_ESS
     * @type {Integer (Int32)}
     */
    static CT_ESS => 1

    /**
     * Specifies an IBSS (ad-hoc network) connection.
     * Native name: WCN_VALUE_CT_IBSS
     * @type {Integer (Int32)}
     */
    static CT_IBSS => 2
}
