#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class MQMSGCURSOR extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_FIRST => 0

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_CURRENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_NEXT => 2
}
