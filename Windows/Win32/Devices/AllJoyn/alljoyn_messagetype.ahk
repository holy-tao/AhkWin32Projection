#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class alljoyn_messagetype extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_MESSAGE_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_MESSAGE_METHOD_CALL => 1

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_MESSAGE_METHOD_RET => 2

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_MESSAGE_ERROR => 3

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_MESSAGE_SIGNAL => 4
}
