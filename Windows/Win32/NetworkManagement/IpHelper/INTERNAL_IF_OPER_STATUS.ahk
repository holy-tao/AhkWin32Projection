#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class INTERNAL_IF_OPER_STATUS{

    /**
     * @type {Integer (Int32)}
     */
    static IF_OPER_STATUS_NON_OPERATIONAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static IF_OPER_STATUS_UNREACHABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static IF_OPER_STATUS_DISCONNECTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static IF_OPER_STATUS_CONNECTING => 3

    /**
     * @type {Integer (Int32)}
     */
    static IF_OPER_STATUS_CONNECTED => 4

    /**
     * @type {Integer (Int32)}
     */
    static IF_OPER_STATUS_OPERATIONAL => 5
}
