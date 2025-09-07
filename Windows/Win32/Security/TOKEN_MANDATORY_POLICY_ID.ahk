#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_MANDATORY_POLICY_ID{

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_MANDATORY_POLICY_OFF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_MANDATORY_POLICY_NO_WRITE_UP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_MANDATORY_POLICY_NEW_PROCESS_MIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_MANDATORY_POLICY_VALID_MASK => 3
}
