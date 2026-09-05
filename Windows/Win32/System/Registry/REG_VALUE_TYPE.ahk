#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Registry
 */
class REG_VALUE_TYPE extends Win32Enum {

    /**
     * Native name: REG_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0

    /**
     * Native name: REG_SZ
     * @type {Integer (UInt32)}
     */
    static SZ => 1

    /**
     * Native name: REG_EXPAND_SZ
     * @type {Integer (UInt32)}
     */
    static EXPAND_SZ => 2

    /**
     * Native name: REG_BINARY
     * @type {Integer (UInt32)}
     */
    static BINARY => 3

    /**
     * Native name: REG_DWORD
     * @type {Integer (UInt32)}
     */
    static DWORD => 4

    /**
     * Native name: REG_DWORD_LITTLE_ENDIAN
     * @type {Integer (UInt32)}
     */
    static DWORD_LITTLE_ENDIAN => 4

    /**
     * Native name: REG_DWORD_BIG_ENDIAN
     * @type {Integer (UInt32)}
     */
    static DWORD_BIG_ENDIAN => 5

    /**
     * Native name: REG_LINK
     * @type {Integer (UInt32)}
     */
    static LINK => 6

    /**
     * Native name: REG_MULTI_SZ
     * @type {Integer (UInt32)}
     */
    static MULTI_SZ => 7

    /**
     * Native name: REG_RESOURCE_LIST
     * @type {Integer (UInt32)}
     */
    static RESOURCE_LIST => 8

    /**
     * Native name: REG_FULL_RESOURCE_DESCRIPTOR
     * @type {Integer (UInt32)}
     */
    static FULL_RESOURCE_DESCRIPTOR => 9

    /**
     * Native name: REG_RESOURCE_REQUIREMENTS_LIST
     * @type {Integer (UInt32)}
     */
    static RESOURCE_REQUIREMENTS_LIST => 10

    /**
     * Native name: REG_QWORD
     * @type {Integer (UInt32)}
     */
    static QWORD => 11

    /**
     * Native name: REG_QWORD_LITTLE_ENDIAN
     * @type {Integer (UInt32)}
     */
    static QWORD_LITTLE_ENDIAN => 11
}
