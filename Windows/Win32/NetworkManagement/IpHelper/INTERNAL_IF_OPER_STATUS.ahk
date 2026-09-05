#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
class INTERNAL_IF_OPER_STATUS extends Win32Enum {

    /**
     * Native name: IF_OPER_STATUS_NON_OPERATIONAL
     * @type {Integer (Int32)}
     */
    static NON_OPERATIONAL => 0

    /**
     * Native name: IF_OPER_STATUS_UNREACHABLE
     * @type {Integer (Int32)}
     */
    static UNREACHABLE => 1

    /**
     * Native name: IF_OPER_STATUS_DISCONNECTED
     * @type {Integer (Int32)}
     */
    static DISCONNECTED => 2

    /**
     * Native name: IF_OPER_STATUS_CONNECTING
     * @type {Integer (Int32)}
     */
    static CONNECTING => 3

    /**
     * Native name: IF_OPER_STATUS_CONNECTED
     * @type {Integer (Int32)}
     */
    static CONNECTED => 4

    /**
     * Native name: IF_OPER_STATUS_OPERATIONAL
     * @type {Integer (Int32)}
     */
    static OPERATIONAL => 5
}
