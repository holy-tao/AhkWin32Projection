#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class VA_TRANSFER_CHARACTERISTICS extends Win32Enum {

    /**
     * Native name: VA_TRANSFER_CHARACTERISTICS_ITU_R_BT_709
     * @type {Integer (Int32)}
     */
    static ITU_R_BT_709 => 1

    /**
     * Native name: VA_TRANSFER_CHARACTERISTICS_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED => 2

    /**
     * Native name: VA_TRANSFER_CHARACTERISTICS_ITU_R_BT_470_SYSTEM_M
     * @type {Integer (Int32)}
     */
    static ITU_R_BT_470_SYSTEM_M => 4

    /**
     * Native name: VA_TRANSFER_CHARACTERISTICS_ITU_R_BT_470_SYSTEM_B_G
     * @type {Integer (Int32)}
     */
    static ITU_R_BT_470_SYSTEM_B_G => 5

    /**
     * Native name: VA_TRANSFER_CHARACTERISTICS_SMPTE_170M
     * @type {Integer (Int32)}
     */
    static SMPTE_170M => 6

    /**
     * Native name: VA_TRANSFER_CHARACTERISTICS_SMPTE_240M
     * @type {Integer (Int32)}
     */
    static SMPTE_240M => 7

    /**
     * Native name: VA_TRANSFER_CHARACTERISTICS_LINEAR
     * @type {Integer (Int32)}
     */
    static LINEAR => 8

    /**
     * Native name: VA_TRANSFER_CHARACTERISTICS_H264_LOG_100_TO_1
     * @type {Integer (Int32)}
     */
    static H264_LOG_100_TO_1 => 9

    /**
     * Native name: VA_TRANSFER_CHARACTERISTICS_H264_LOG_316_TO_1
     * @type {Integer (Int32)}
     */
    static H264_LOG_316_TO_1 => 10
}
