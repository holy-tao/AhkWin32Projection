#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class MQConnectionState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MQCONN_NOFAILURE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MQCONN_ESTABLISH_PACKET_RECEIVED => 1

    /**
     * @type {Integer (Int32)}
     */
    static MQCONN_READY => 2

    /**
     * @type {Integer (Int32)}
     */
    static MQCONN_UNKNOWN_FAILURE => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static MQCONN_PING_FAILURE => -2147483647

    /**
     * @type {Integer (Int32)}
     */
    static MQCONN_CREATE_SOCKET_FAILURE => -2147483646

    /**
     * @type {Integer (Int32)}
     */
    static MQCONN_BIND_SOCKET_FAILURE => -2147483645

    /**
     * @type {Integer (Int32)}
     */
    static MQCONN_CONNECT_SOCKET_FAILURE => -2147483644

    /**
     * @type {Integer (Int32)}
     */
    static MQCONN_TCP_NOT_ENABLED => -2147483643

    /**
     * @type {Integer (Int32)}
     */
    static MQCONN_SEND_FAILURE => -2147483642

    /**
     * @type {Integer (Int32)}
     */
    static MQCONN_NOT_READY => -2147483641

    /**
     * @type {Integer (Int32)}
     */
    static MQCONN_NAME_RESOLUTION_FAILURE => -2147483640

    /**
     * @type {Integer (Int32)}
     */
    static MQCONN_INVALID_SERVER_CERT => -2147483639

    /**
     * @type {Integer (Int32)}
     */
    static MQCONN_LIMIT_REACHED => -2147483638

    /**
     * @type {Integer (Int32)}
     */
    static MQCONN_REFUSED_BY_OTHER_SIDE => -2147483637

    /**
     * @type {Integer (Int32)}
     */
    static MQCONN_ROUTING_FAILURE => -2147483636

    /**
     * @type {Integer (Int32)}
     */
    static MQCONN_OUT_OF_MEMORY => -2147483635
}
