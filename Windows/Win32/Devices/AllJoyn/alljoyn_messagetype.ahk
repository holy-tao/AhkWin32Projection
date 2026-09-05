#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
class alljoyn_messagetype extends Win32Enum {

    /**
     * Native name: ALLJOYN_MESSAGE_INVALID
     * @type {Integer (Int32)}
     */
    static MESSAGE_INVALID => 0

    /**
     * Native name: ALLJOYN_MESSAGE_METHOD_CALL
     * @type {Integer (Int32)}
     */
    static MESSAGE_METHOD_CALL => 1

    /**
     * Native name: ALLJOYN_MESSAGE_METHOD_RET
     * @type {Integer (Int32)}
     */
    static MESSAGE_METHOD_RET => 2

    /**
     * Native name: ALLJOYN_MESSAGE_ERROR
     * @type {Integer (Int32)}
     */
    static MESSAGE_ERROR => 3

    /**
     * Native name: ALLJOYN_MESSAGE_SIGNAL
     * @type {Integer (Int32)}
     */
    static MESSAGE_SIGNAL => 4
}
