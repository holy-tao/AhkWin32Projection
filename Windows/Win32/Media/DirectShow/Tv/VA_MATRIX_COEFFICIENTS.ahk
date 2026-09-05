#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class VA_MATRIX_COEFFICIENTS extends Win32Enum {

    /**
     * Native name: VA_MATRIX_COEFF_H264_RGB
     * @type {Integer (Int32)}
     */
    static COEFF_H264_RGB => 0

    /**
     * Native name: VA_MATRIX_COEFF_ITU_R_BT_709
     * @type {Integer (Int32)}
     */
    static COEFF_ITU_R_BT_709 => 1

    /**
     * Native name: VA_MATRIX_COEFF_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static COEFF_UNSPECIFIED => 2

    /**
     * Native name: VA_MATRIX_COEFF_FCC
     * @type {Integer (Int32)}
     */
    static COEFF_FCC => 4

    /**
     * Native name: VA_MATRIX_COEFF_ITU_R_BT_470_SYSTEM_B_G
     * @type {Integer (Int32)}
     */
    static COEFF_ITU_R_BT_470_SYSTEM_B_G => 5

    /**
     * Native name: VA_MATRIX_COEFF_SMPTE_170M
     * @type {Integer (Int32)}
     */
    static COEFF_SMPTE_170M => 6

    /**
     * Native name: VA_MATRIX_COEFF_SMPTE_240M
     * @type {Integer (Int32)}
     */
    static COEFF_SMPTE_240M => 7

    /**
     * Native name: VA_MATRIX_COEFF_H264_YCgCo
     * @type {Integer (Int32)}
     */
    static COEFF_H264_YCgCo => 8
}
