#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_AUTH_INFORMATION_AUTH_TYPE{

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_AUTH_TYPE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_AUTH_TYPE_NT4OWF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_AUTH_TYPE_CLEAR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_AUTH_TYPE_VERSION => 3
}
