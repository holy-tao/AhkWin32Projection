#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class WCN_VALUE_TYPE_REQUEST_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_ReqT_ENROLLEE_INFO => 0

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_ReqT_ENROLLEE_OPEN_1X => 1

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_ReqT_REGISTRAR => 2

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_ReqT_MANAGER_REGISTRAR => 3
}
