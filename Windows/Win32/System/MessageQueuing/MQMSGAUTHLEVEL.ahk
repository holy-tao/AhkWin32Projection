#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class MQMSGAUTHLEVEL{

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTH_LEVEL_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTH_LEVEL_ALWAYS => 1

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTH_LEVEL_MSMQ10 => 2

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTH_LEVEL_SIG10 => 2

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTH_LEVEL_MSMQ20 => 4

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTH_LEVEL_SIG20 => 4

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTH_LEVEL_SIG30 => 8
}
