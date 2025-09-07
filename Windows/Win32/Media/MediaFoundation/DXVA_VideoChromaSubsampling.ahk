#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA_VideoChromaSubsampling{

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
