#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_NominalRange {
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
    static DXVA_NominalRangeShift => 12

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_NominalRangeMask => 28672

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_NominalRange_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_NominalRange_Normal => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_NominalRange_Wide => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_NominalRange_0_255 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_NominalRange_16_235 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_NominalRange_48_208 => 3
}
