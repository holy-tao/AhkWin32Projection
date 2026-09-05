#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security
 */
class TOKEN_MANDATORY_POLICY_ID extends Win32Enum {

    /**
     * Native name: TOKEN_MANDATORY_POLICY_OFF
     * @type {Integer (UInt32)}
     */
    static OFF => 0

    /**
     * Native name: TOKEN_MANDATORY_POLICY_NO_WRITE_UP
     * @type {Integer (UInt32)}
     */
    static NO_WRITE_UP => 1

    /**
     * Native name: TOKEN_MANDATORY_POLICY_NEW_PROCESS_MIN
     * @type {Integer (UInt32)}
     */
    static NEW_PROCESS_MIN => 2

    /**
     * Native name: TOKEN_MANDATORY_POLICY_VALID_MASK
     * @type {Integer (UInt32)}
     */
    static VALID_MASK => 3
}
