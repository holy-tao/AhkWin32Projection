#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class MQMSGACKNOWLEDGEMENT{

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_ACKNOWLEDGMENT_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_ACKNOWLEDGMENT_POS_ARRIVAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_ACKNOWLEDGMENT_POS_RECEIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_ACKNOWLEDGMENT_NEG_ARRIVAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_ACKNOWLEDGMENT_NEG_RECEIVE => 8

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_ACKNOWLEDGMENT_NACK_REACH_QUEUE => 4

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_ACKNOWLEDGMENT_FULL_REACH_QUEUE => 5

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_ACKNOWLEDGMENT_NACK_RECEIVE => 12

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_ACKNOWLEDGMENT_FULL_RECEIVE => 14
}
