#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_VideoChromaSubsampling {
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
    static DXVA_VideoChromaSubsamplingShift => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoChromaSubsamplingMask => 3840

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoChromaSubsampling_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoChromaSubsampling_ProgressiveChroma => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoChromaSubsampling_Horizontally_Cosited => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoChromaSubsampling_Vertically_Cosited => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoChromaSubsampling_Vertically_AlignedChromaPlanes => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoChromaSubsampling_MPEG2 => 5

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoChromaSubsampling_MPEG1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoChromaSubsampling_DV_PAL => 6

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoChromaSubsampling_Cosited => 7
}
