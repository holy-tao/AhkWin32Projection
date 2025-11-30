#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Registry
 * @version v4.0.30319
 */
class REG_VALUE_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static REG_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static REG_SZ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REG_EXPAND_SZ => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REG_BINARY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static REG_DWORD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static REG_DWORD_LITTLE_ENDIAN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static REG_DWORD_BIG_ENDIAN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static REG_LINK => 6

    /**
     * @type {Integer (UInt32)}
     */
    static REG_MULTI_SZ => 7

    /**
     * @type {Integer (UInt32)}
     */
    static REG_RESOURCE_LIST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static REG_FULL_RESOURCE_DESCRIPTOR => 9

    /**
     * @type {Integer (UInt32)}
     */
    static REG_RESOURCE_REQUIREMENTS_LIST => 10

    /**
     * @type {Integer (UInt32)}
     */
    static REG_QWORD => 11

    /**
     * @type {Integer (UInt32)}
     */
    static REG_QWORD_LITTLE_ENDIAN => 11
}
