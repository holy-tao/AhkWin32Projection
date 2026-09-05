#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security
 */
class TOKEN_ACCESS_MASK extends Win32BitflagEnum {

    /**
     * Native name: TOKEN_DELETE
     * @type {Integer (UInt32)}
     */
    static DELETE => 65536

    /**
     * Native name: TOKEN_READ_CONTROL
     * @type {Integer (UInt32)}
     */
    static READ_CONTROL => 131072

    /**
     * Native name: TOKEN_WRITE_DAC
     * @type {Integer (UInt32)}
     */
    static WRITE_DAC => 262144

    /**
     * Native name: TOKEN_WRITE_OWNER
     * @type {Integer (UInt32)}
     */
    static WRITE_OWNER => 524288

    /**
     * Native name: TOKEN_ACCESS_SYSTEM_SECURITY
     * @type {Integer (UInt32)}
     */
    static SYSTEM_SECURITY => 16777216

    /**
     * Native name: TOKEN_ASSIGN_PRIMARY
     * @type {Integer (UInt32)}
     */
    static ASSIGN_PRIMARY => 1

    /**
     * Native name: TOKEN_DUPLICATE
     * @type {Integer (UInt32)}
     */
    static DUPLICATE => 2

    /**
     * Native name: TOKEN_IMPERSONATE
     * @type {Integer (UInt32)}
     */
    static IMPERSONATE => 4

    /**
     * Native name: TOKEN_QUERY
     * @type {Integer (UInt32)}
     */
    static QUERY => 8

    /**
     * Native name: TOKEN_QUERY_SOURCE
     * @type {Integer (UInt32)}
     */
    static QUERY_SOURCE => 16

    /**
     * Native name: TOKEN_ADJUST_PRIVILEGES
     * @type {Integer (UInt32)}
     */
    static ADJUST_PRIVILEGES => 32

    /**
     * Native name: TOKEN_ADJUST_GROUPS
     * @type {Integer (UInt32)}
     */
    static ADJUST_GROUPS => 64

    /**
     * Native name: TOKEN_ADJUST_DEFAULT
     * @type {Integer (UInt32)}
     */
    static ADJUST_DEFAULT => 128

    /**
     * Native name: TOKEN_ADJUST_SESSIONID
     * @type {Integer (UInt32)}
     */
    static ADJUST_SESSIONID => 256

    /**
     * Native name: TOKEN_READ
     * @type {Integer (UInt32)}
     */
    static READ => 131080

    /**
     * Native name: TOKEN_WRITE
     * @type {Integer (UInt32)}
     */
    static WRITE => 131296

    /**
     * Native name: TOKEN_EXECUTE
     * @type {Integer (UInt32)}
     */
    static EXECUTE => 131072

    /**
     * Native name: TOKEN_TRUST_CONSTRAINT_MASK
     * @type {Integer (UInt32)}
     */
    static TRUST_CONSTRAINT_MASK => 131096

    /**
     * Native name: TOKEN_ACCESS_PSEUDO_HANDLE_WIN8
     * @type {Integer (UInt32)}
     */
    static PSEUDO_HANDLE_WIN8 => 24

    /**
     * Native name: TOKEN_ACCESS_PSEUDO_HANDLE
     * @type {Integer (UInt32)}
     */
    static PSEUDO_HANDLE => 24

    /**
     * Native name: TOKEN_ALL_ACCESS
     * @type {Integer (UInt32)}
     */
    static ALL_ACCESS => 983551
}
