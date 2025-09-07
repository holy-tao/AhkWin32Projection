#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class CREATE_RESTRICTED_TOKEN_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static DISABLE_MAX_PRIVILEGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SANDBOX_INERT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LUA_TOKEN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WRITE_RESTRICTED => 8
}
