#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Registry
 * @version v4.0.30319
 */
class REG_SAM_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_QUERY_VALUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_SET_VALUE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_CREATE_SUB_KEY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_ENUMERATE_SUB_KEYS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_NOTIFY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_CREATE_LINK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_WOW64_32KEY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_WOW64_64KEY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_WOW64_RES => 768

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_READ => 131097

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_WRITE => 131078

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_EXECUTE => 131097

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_ALL_ACCESS => 983103
}
