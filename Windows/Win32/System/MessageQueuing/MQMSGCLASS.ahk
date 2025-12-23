#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class MQMSGCLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_REPORT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_ACK_REACH_QUEUE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_ACK_RECEIVE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_NACK_BAD_DST_Q => 32768

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_NACK_PURGED => 32769

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_NACK_REACH_QUEUE_TIMEOUT => 32770

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_NACK_Q_EXCEED_QUOTA => 32771

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_NACK_ACCESS_DENIED => 32772

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_NACK_HOP_COUNT_EXCEEDED => 32773

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_NACK_BAD_SIGNATURE => 32774

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_NACK_BAD_ENCRYPTION => 32775

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_NACK_COULD_NOT_ENCRYPT => 32776

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_NACK_NOT_TRANSACTIONAL_Q => 32777

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_NACK_NOT_TRANSACTIONAL_MSG => 32778

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_NACK_UNSUPPORTED_CRYPTO_PROVIDER => 32779

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_NACK_SOURCE_COMPUTER_GUID_CHANGED => 32780

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_NACK_Q_DELETED => 49152

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_NACK_Q_PURGED => 49153

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_NACK_RECEIVE_TIMEOUT => 49154

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CLASS_NACK_RECEIVE_TIMEOUT_AT_SENDER => 49155
}
