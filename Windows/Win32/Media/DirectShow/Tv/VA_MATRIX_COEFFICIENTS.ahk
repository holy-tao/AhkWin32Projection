#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct VA_MATRIX_COEFFICIENTS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
