#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_ACCESS_MASK extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_DELETE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_READ_CONTROL => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_WRITE_DAC => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_WRITE_OWNER => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_ACCESS_SYSTEM_SECURITY => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_ASSIGN_PRIMARY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_DUPLICATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_IMPERSONATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_QUERY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_QUERY_SOURCE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_ADJUST_PRIVILEGES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_ADJUST_GROUPS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_ADJUST_DEFAULT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_ADJUST_SESSIONID => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_READ => 131080

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_WRITE => 131296

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_EXECUTE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_TRUST_CONSTRAINT_MASK => 131096

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_ACCESS_PSEUDO_HANDLE_WIN8 => 24

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_ACCESS_PSEUDO_HANDLE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_ALL_ACCESS => 983551
}
