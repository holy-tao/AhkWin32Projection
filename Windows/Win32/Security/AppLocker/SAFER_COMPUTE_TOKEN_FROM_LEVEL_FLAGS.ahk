#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.AppLocker
 * @version v4.0.30319
 */
class SAFER_COMPUTE_TOKEN_FROM_LEVEL_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_TOKEN_NULL_IF_EQUAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_TOKEN_COMPARE_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_TOKEN_MAKE_INERT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_TOKEN_WANT_FLAGS => 8
}
