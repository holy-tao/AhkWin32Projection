#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 */
class WCN_VALUE_TYPE_MESSAGE_TYPE extends Win32Enum {

    /**
     * Native name: WCN_VALUE_MT_BEACON
     * @type {Integer (Int32)}
     */
    static MT_BEACON => 1

    /**
     * Native name: WCN_VALUE_MT_PROBE_REQUEST
     * @type {Integer (Int32)}
     */
    static MT_PROBE_REQUEST => 2

    /**
     * Native name: WCN_VALUE_MT_PROBE_RESPONSE
     * @type {Integer (Int32)}
     */
    static MT_PROBE_RESPONSE => 3

    /**
     * Native name: WCN_VALUE_MT_M1
     * @type {Integer (Int32)}
     */
    static MT_M1 => 4

    /**
     * Native name: WCN_VALUE_MT_M2
     * @type {Integer (Int32)}
     */
    static MT_M2 => 5

    /**
     * Native name: WCN_VALUE_MT_M2D
     * @type {Integer (Int32)}
     */
    static MT_M2D => 6

    /**
     * Native name: WCN_VALUE_MT_M3
     * @type {Integer (Int32)}
     */
    static MT_M3 => 7

    /**
     * Native name: WCN_VALUE_MT_M4
     * @type {Integer (Int32)}
     */
    static MT_M4 => 8

    /**
     * Native name: WCN_VALUE_MT_M5
     * @type {Integer (Int32)}
     */
    static MT_M5 => 9

    /**
     * Native name: WCN_VALUE_MT_M6
     * @type {Integer (Int32)}
     */
    static MT_M6 => 10

    /**
     * Native name: WCN_VALUE_MT_M7
     * @type {Integer (Int32)}
     */
    static MT_M7 => 11

    /**
     * Native name: WCN_VALUE_MT_M8
     * @type {Integer (Int32)}
     */
    static MT_M8 => 12

    /**
     * Native name: WCN_VALUE_MT_ACK
     * @type {Integer (Int32)}
     */
    static MT_ACK => 13

    /**
     * Native name: WCN_VALUE_MT_NACK
     * @type {Integer (Int32)}
     */
    static MT_NACK => 14

    /**
     * Native name: WCN_VALUE_MT_DONE
     * @type {Integer (Int32)}
     */
    static MT_DONE => 15
}
