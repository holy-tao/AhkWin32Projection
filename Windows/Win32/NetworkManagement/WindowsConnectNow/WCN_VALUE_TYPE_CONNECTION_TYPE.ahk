#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * WCN_VALUE_TYPE_CONNECTION_TYPE.
 * @see https://docs.microsoft.com/windows/win32/api//wcntypes/ne-wcntypes-wcn_value_type_connection_type
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class WCN_VALUE_TYPE_CONNECTION_TYPE extends Win32Enum{

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
