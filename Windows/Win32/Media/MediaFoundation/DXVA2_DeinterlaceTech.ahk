#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA2_DeinterlaceTech extends Win32Enum {

    /**
     * Native name: DXVA2_DeinterlaceTech_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: DXVA2_DeinterlaceTech_BOBLineReplicate
     * @type {Integer (Int32)}
     */
    static BOBLineReplicate => 1

    /**
     * Native name: DXVA2_DeinterlaceTech_BOBVerticalStretch
     * @type {Integer (Int32)}
     */
    static BOBVerticalStretch => 2

    /**
     * Native name: DXVA2_DeinterlaceTech_BOBVerticalStretch4Tap
     * @type {Integer (Int32)}
     */
    static BOBVerticalStretch4Tap => 4

    /**
     * Native name: DXVA2_DeinterlaceTech_MedianFiltering
     * @type {Integer (Int32)}
     */
    static MedianFiltering => 8

    /**
     * Native name: DXVA2_DeinterlaceTech_EdgeFiltering
     * @type {Integer (Int32)}
     */
    static EdgeFiltering => 16

    /**
     * Native name: DXVA2_DeinterlaceTech_FieldAdaptive
     * @type {Integer (Int32)}
     */
    static FieldAdaptive => 32

    /**
     * Native name: DXVA2_DeinterlaceTech_PixelAdaptive
     * @type {Integer (Int32)}
     */
    static PixelAdaptive => 64

    /**
     * Native name: DXVA2_DeinterlaceTech_MotionVectorSteered
     * @type {Integer (Int32)}
     */
    static MotionVectorSteered => 128

    /**
     * Native name: DXVA2_DeinterlaceTech_InverseTelecine
     * @type {Integer (Int32)}
     */
    static InverseTelecine => 256

    /**
     * Native name: DXVA2_DeinterlaceTech_Mask
     * @type {Integer (Int32)}
     */
    static Mask => 511
}
