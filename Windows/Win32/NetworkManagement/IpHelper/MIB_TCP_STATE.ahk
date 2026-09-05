#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
class MIB_TCP_STATE extends Win32Enum {

    /**
     * Native name: MIB_TCP_STATE_CLOSED
     * @type {Integer (Int32)}
     */
    static CLOSED => 1

    /**
     * Native name: MIB_TCP_STATE_LISTEN
     * @type {Integer (Int32)}
     */
    static LISTEN => 2

    /**
     * Native name: MIB_TCP_STATE_SYN_SENT
     * @type {Integer (Int32)}
     */
    static SYN_SENT => 3

    /**
     * Native name: MIB_TCP_STATE_SYN_RCVD
     * @type {Integer (Int32)}
     */
    static SYN_RCVD => 4

    /**
     * Native name: MIB_TCP_STATE_ESTAB
     * @type {Integer (Int32)}
     */
    static ESTAB => 5

    /**
     * Native name: MIB_TCP_STATE_FIN_WAIT1
     * @type {Integer (Int32)}
     */
    static FIN_WAIT1 => 6

    /**
     * Native name: MIB_TCP_STATE_FIN_WAIT2
     * @type {Integer (Int32)}
     */
    static FIN_WAIT2 => 7

    /**
     * Native name: MIB_TCP_STATE_CLOSE_WAIT
     * @type {Integer (Int32)}
     */
    static CLOSE_WAIT => 8

    /**
     * Native name: MIB_TCP_STATE_CLOSING
     * @type {Integer (Int32)}
     */
    static CLOSING => 9

    /**
     * Native name: MIB_TCP_STATE_LAST_ACK
     * @type {Integer (Int32)}
     */
    static LAST_ACK => 10

    /**
     * Native name: MIB_TCP_STATE_TIME_WAIT
     * @type {Integer (Int32)}
     */
    static TIME_WAIT => 11

    /**
     * Native name: MIB_TCP_STATE_DELETE_TCB
     * @type {Integer (Int32)}
     */
    static DELETE_TCB => 12

    /**
     * Native name: MIB_TCP_STATE_RESERVED
     * @type {Integer (Int32)}
     */
    static RESERVED => 100
}
