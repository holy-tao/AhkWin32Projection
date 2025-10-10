#Requires AutoHotkey v2.0.0 64-bit

/**
 * WCN_VALUE_TYPE_BOOLEAN enumeration defines values used to represent true/false conditions encountered during device setup and association.
 * @see https://docs.microsoft.com/windows/win32/api//wcntypes/ne-wcntypes-wcn_value_type_boolean
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class WCN_VALUE_TYPE_BOOLEAN{

    /**
     * The argument is false.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_FALSE => 0

    /**
     * The argument is true.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_TRUE => 1
}
