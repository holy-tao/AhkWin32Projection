#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class VA_MATRIX_COEFFICIENTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static VA_MATRIX_COEFF_H264_RGB => 0

    /**
     * @type {Integer (Int32)}
     */
    static VA_MATRIX_COEFF_ITU_R_BT_709 => 1

    /**
     * @type {Integer (Int32)}
     */
    static VA_MATRIX_COEFF_UNSPECIFIED => 2

    /**
     * @type {Integer (Int32)}
     */
    static VA_MATRIX_COEFF_FCC => 4

    /**
     * @type {Integer (Int32)}
     */
    static VA_MATRIX_COEFF_ITU_R_BT_470_SYSTEM_B_G => 5

    /**
     * @type {Integer (Int32)}
     */
    static VA_MATRIX_COEFF_SMPTE_170M => 6

    /**
     * @type {Integer (Int32)}
     */
    static VA_MATRIX_COEFF_SMPTE_240M => 7

    /**
     * @type {Integer (Int32)}
     */
    static VA_MATRIX_COEFF_H264_YCgCo => 8
}
