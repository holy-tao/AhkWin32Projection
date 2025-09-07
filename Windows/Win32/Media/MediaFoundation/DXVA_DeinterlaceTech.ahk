#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA_DeinterlaceTech{

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_DeinterlaceTech_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_DeinterlaceTech_BOBLineReplicate => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_DeinterlaceTech_BOBVerticalStretch => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_DeinterlaceTech_BOBVerticalStretch4Tap => 256

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_DeinterlaceTech_MedianFiltering => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_DeinterlaceTech_EdgeFiltering => 16

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_DeinterlaceTech_FieldAdaptive => 32

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_DeinterlaceTech_PixelAdaptive => 64

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_DeinterlaceTech_MotionVectorSteered => 128
}
