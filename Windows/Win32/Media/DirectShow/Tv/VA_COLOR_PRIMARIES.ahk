#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct VA_COLOR_PRIMARIES {
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
