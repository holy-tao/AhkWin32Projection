#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class VA_COLOR_PRIMARIES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static VA_PRIMARIES_ITU_R_BT_709 => 1

    /**
     * @type {Integer (Int32)}
     */
    static VA_PRIMARIES_UNSPECIFIED => 2

    /**
     * @type {Integer (Int32)}
     */
    static VA_PRIMARIES_ITU_R_BT_470_SYSTEM_M => 4

    /**
     * @type {Integer (Int32)}
     */
    static VA_PRIMARIES_ITU_R_BT_470_SYSTEM_B_G => 5

    /**
     * @type {Integer (Int32)}
     */
    static VA_PRIMARIES_SMPTE_170M => 6

    /**
     * @type {Integer (Int32)}
     */
    static VA_PRIMARIES_SMPTE_240M => 7

    /**
     * @type {Integer (Int32)}
     */
    static VA_PRIMARIES_H264_GENERIC_FILM => 8
}
