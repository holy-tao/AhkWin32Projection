#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA_VideoChromaSubsampling extends Win32Enum {

    /**
     * Native name: DXVA_VideoChromaSubsamplingShift
     * @type {Integer (Int32)}
     */
    static Shift => 8

    /**
     * Native name: DXVA_VideoChromaSubsamplingMask
     * @type {Integer (Int32)}
     */
    static Mask => 3840

    /**
     * Native name: DXVA_VideoChromaSubsampling_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: DXVA_VideoChromaSubsampling_ProgressiveChroma
     * @type {Integer (Int32)}
     */
    static ProgressiveChroma => 8

    /**
     * Native name: DXVA_VideoChromaSubsampling_Horizontally_Cosited
     * @type {Integer (Int32)}
     */
    static Horizontally_Cosited => 4

    /**
     * Native name: DXVA_VideoChromaSubsampling_Vertically_Cosited
     * @type {Integer (Int32)}
     */
    static Vertically_Cosited => 2

    /**
     * Native name: DXVA_VideoChromaSubsampling_Vertically_AlignedChromaPlanes
     * @type {Integer (Int32)}
     */
    static Vertically_AlignedChromaPlanes => 1

    /**
     * Native name: DXVA_VideoChromaSubsampling_MPEG2
     * @type {Integer (Int32)}
     */
    static MPEG2 => 5

    /**
     * Native name: DXVA_VideoChromaSubsampling_MPEG1
     * @type {Integer (Int32)}
     */
    static MPEG1 => 1

    /**
     * Native name: DXVA_VideoChromaSubsampling_DV_PAL
     * @type {Integer (Int32)}
     */
    static DV_PAL => 6

    /**
     * Native name: DXVA_VideoChromaSubsampling_Cosited
     * @type {Integer (Int32)}
     */
    static Cosited => 7
}
