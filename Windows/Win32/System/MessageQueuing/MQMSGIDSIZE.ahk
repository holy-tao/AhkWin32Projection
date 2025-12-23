#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class MQMSGIDSIZE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_MSGID_SIZE => 20

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CORRELATIONID_SIZE => 20

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_XACTID_SIZE => 20
}
