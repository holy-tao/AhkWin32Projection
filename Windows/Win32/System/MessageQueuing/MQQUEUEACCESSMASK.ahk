#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class MQQUEUEACCESSMASK extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_DELETE_QUEUE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_GET_QUEUE_PERMISSIONS => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_CHANGE_QUEUE_PERMISSIONS => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_TAKE_QUEUE_OWNERSHIP => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_RECEIVE_MESSAGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_RECEIVE_JOURNAL_MESSAGE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_QUEUE_GENERIC_READ => 131115

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_QUEUE_GENERIC_WRITE => 131108

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_QUEUE_GENERIC_ALL => 983103

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_DELETE_MESSAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_PEEK_MESSAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_WRITE_MESSAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_DELETE_JOURNAL_MESSAGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_SET_QUEUE_PROPERTIES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_GET_QUEUE_PROPERTIES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MQSEC_QUEUE_GENERIC_EXECUTE => 0
}
