#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class TCP_ICW_LEVEL extends Win32Enum {

    /**
     * Native name: TCP_ICW_LEVEL_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: TCP_ICW_LEVEL_HIGH
     * @type {Integer (Int32)}
     */
    static HIGH => 1

    /**
     * Native name: TCP_ICW_LEVEL_VERY_HIGH
     * @type {Integer (Int32)}
     */
    static VERY_HIGH => 2

    /**
     * Native name: TCP_ICW_LEVEL_AGGRESSIVE
     * @type {Integer (Int32)}
     */
    static AGGRESSIVE => 3

    /**
     * Native name: TCP_ICW_LEVEL_EXPERIMENTAL
     * @type {Integer (Int32)}
     */
    static EXPERIMENTAL => 4

    /**
     * Native name: TCP_ICW_LEVEL_COMPAT
     * @type {Integer (Int32)}
     */
    static COMPAT => 254

    /**
     * Native name: TCP_ICW_LEVEL_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 255
}
