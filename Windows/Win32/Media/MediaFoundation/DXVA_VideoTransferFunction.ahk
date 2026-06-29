#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_VideoTransferFunction {
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
    static DXVA_VideoTransFuncShift => 27

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoTransFuncMask => -134217728

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoTransFunc_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoTransFunc_10 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoTransFunc_18 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoTransFunc_20 => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoTransFunc_22 => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoTransFunc_22_709 => 5

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoTransFunc_22_240M => 6

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoTransFunc_22_8bit_sRGB => 7

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoTransFunc_28 => 8
}
