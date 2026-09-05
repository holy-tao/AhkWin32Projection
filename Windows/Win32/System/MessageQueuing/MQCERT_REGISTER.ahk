#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
class MQCERT_REGISTER extends Win32Enum {

    /**
     * Native name: MQCERT_REGISTER_ALWAYS
     * @type {Integer (Int32)}
     */
    static ALWAYS => 1

    /**
     * Native name: MQCERT_REGISTER_IF_NOT_EXIST
     * @type {Integer (Int32)}
     */
    static IF_NOT_EXIST => 2
}
