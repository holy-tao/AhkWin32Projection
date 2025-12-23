#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class MQCERT_REGISTER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MQCERT_REGISTER_ALWAYS => 1

    /**
     * @type {Integer (Int32)}
     */
    static MQCERT_REGISTER_IF_NOT_EXIST => 2
}
