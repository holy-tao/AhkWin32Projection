#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class DDE_NAME_SERVICE_CMD extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_REGISTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_UNREGISTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_FILTERON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_FILTEROFF => 8
}
