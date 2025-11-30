#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class MQACCESS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MQ_RECEIVE_ACCESS => 1

    /**
     * @type {Integer (Int32)}
     */
    static MQ_SEND_ACCESS => 2

    /**
     * @type {Integer (Int32)}
     */
    static MQ_PEEK_ACCESS => 32

    /**
     * @type {Integer (Int32)}
     */
    static MQ_ADMIN_ACCESS => 128
}
