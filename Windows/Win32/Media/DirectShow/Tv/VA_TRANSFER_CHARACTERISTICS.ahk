#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class VA_TRANSFER_CHARACTERISTICS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static VA_TRANSFER_CHARACTERISTICS_ITU_R_BT_709 => 1

    /**
     * @type {Integer (Int32)}
     */
    static VA_TRANSFER_CHARACTERISTICS_UNSPECIFIED => 2

    /**
     * @type {Integer (Int32)}
     */
    static VA_TRANSFER_CHARACTERISTICS_ITU_R_BT_470_SYSTEM_M => 4

    /**
     * @type {Integer (Int32)}
     */
    static VA_TRANSFER_CHARACTERISTICS_ITU_R_BT_470_SYSTEM_B_G => 5

    /**
     * @type {Integer (Int32)}
     */
    static VA_TRANSFER_CHARACTERISTICS_SMPTE_170M => 6

    /**
     * @type {Integer (Int32)}
     */
    static VA_TRANSFER_CHARACTERISTICS_SMPTE_240M => 7

    /**
     * @type {Integer (Int32)}
     */
    static VA_TRANSFER_CHARACTERISTICS_LINEAR => 8

    /**
     * @type {Integer (Int32)}
     */
    static VA_TRANSFER_CHARACTERISTICS_H264_LOG_100_TO_1 => 9

    /**
     * @type {Integer (Int32)}
     */
    static VA_TRANSFER_CHARACTERISTICS_H264_LOG_316_TO_1 => 10
}
