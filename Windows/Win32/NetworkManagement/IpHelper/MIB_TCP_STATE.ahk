#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_TCP_STATE{

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_STATE_CLOSED => 1

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_STATE_LISTEN => 2

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_STATE_SYN_SENT => 3

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_STATE_SYN_RCVD => 4

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_STATE_ESTAB => 5

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_STATE_FIN_WAIT1 => 6

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_STATE_FIN_WAIT2 => 7

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_STATE_CLOSE_WAIT => 8

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_STATE_CLOSING => 9

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_STATE_LAST_ACK => 10

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_STATE_TIME_WAIT => 11

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_STATE_DELETE_TCB => 12

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_STATE_RESERVED => 100
}
