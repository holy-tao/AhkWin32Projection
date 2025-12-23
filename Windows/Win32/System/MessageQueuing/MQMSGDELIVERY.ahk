#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class MQMSGDELIVERY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_DELIVERY_EXPRESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static MQMSG_DELIVERY_RECOVERABLE => 1
}
