#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class RPC_C_AUTHN_LEVEL{

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_LEVEL_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_LEVEL_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_LEVEL_CONNECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_LEVEL_CALL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_LEVEL_PKT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_LEVEL_PKT_INTEGRITY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_LEVEL_PKT_PRIVACY => 6
}
