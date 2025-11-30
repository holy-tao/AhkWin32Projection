#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class MQMSGAUTHENTICATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTHENTICATION_NOT_REQUESTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTHENTICATION_REQUESTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTHENTICATED_SIG10 => 1

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTHENTICATION_REQUESTED_EX => 3

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTHENTICATED_SIG20 => 3

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTHENTICATED_SIG30 => 5

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_AUTHENTICATED_SIGXML => 9
}
