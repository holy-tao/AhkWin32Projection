#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA_DeinterlaceTech extends Win32Enum {

    /**
     * Native name: DXVA_DeinterlaceTech_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: DXVA_DeinterlaceTech_BOBLineReplicate
     * @type {Integer (Int32)}
     */
    static BOBLineReplicate => 1

    /**
     * Native name: DXVA_DeinterlaceTech_BOBVerticalStretch
     * @type {Integer (Int32)}
     */
    static BOBVerticalStretch => 2

    /**
     * Native name: DXVA_DeinterlaceTech_BOBVerticalStretch4Tap
     * @type {Integer (Int32)}
     */
    static BOBVerticalStretch4Tap => 256

    /**
     * Native name: DXVA_DeinterlaceTech_MedianFiltering
     * @type {Integer (Int32)}
     */
    static MedianFiltering => 4

    /**
     * Native name: DXVA_DeinterlaceTech_EdgeFiltering
     * @type {Integer (Int32)}
     */
    static EdgeFiltering => 16

    /**
     * Native name: DXVA_DeinterlaceTech_FieldAdaptive
     * @type {Integer (Int32)}
     */
    static FieldAdaptive => 32

    /**
     * Native name: DXVA_DeinterlaceTech_PixelAdaptive
     * @type {Integer (Int32)}
     */
    static PixelAdaptive => 64

    /**
     * Native name: DXVA_DeinterlaceTech_MotionVectorSteered
     * @type {Integer (Int32)}
     */
    static MotionVectorSteered => 128
}
