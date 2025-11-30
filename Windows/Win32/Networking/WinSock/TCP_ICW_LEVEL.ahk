#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class TCP_ICW_LEVEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TCP_ICW_LEVEL_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static TCP_ICW_LEVEL_HIGH => 1

    /**
     * @type {Integer (Int32)}
     */
    static TCP_ICW_LEVEL_VERY_HIGH => 2

    /**
     * @type {Integer (Int32)}
     */
    static TCP_ICW_LEVEL_AGGRESSIVE => 3

    /**
     * @type {Integer (Int32)}
     */
    static TCP_ICW_LEVEL_EXPERIMENTAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static TCP_ICW_LEVEL_COMPAT => 254

    /**
     * @type {Integer (Int32)}
     */
    static TCP_ICW_LEVEL_MAX => 255
}
