#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 */
class WCN_VALUE_TYPE_RESPONSE_TYPE extends Win32Enum {

    /**
     * Native name: WCN_VALUE_RspT_ENROLLEE_INFO
     * @type {Integer (Int32)}
     */
    static RspT_ENROLLEE_INFO => 0

    /**
     * Native name: WCN_VALUE_RspT_ENROLLEE_OPEN_1X
     * @type {Integer (Int32)}
     */
    static RspT_ENROLLEE_OPEN_1X => 1

    /**
     * Native name: WCN_VALUE_RspT_REGISTRAR
     * @type {Integer (Int32)}
     */
    static RspT_REGISTRAR => 2

    /**
     * Native name: WCN_VALUE_RspT_AP
     * @type {Integer (Int32)}
     */
    static RspT_AP => 3
}
