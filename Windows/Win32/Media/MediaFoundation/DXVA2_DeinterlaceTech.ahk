#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_DeinterlaceTech {
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
    static DXVA2_DeinterlaceTech_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DeinterlaceTech_BOBLineReplicate => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DeinterlaceTech_BOBVerticalStretch => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DeinterlaceTech_BOBVerticalStretch4Tap => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DeinterlaceTech_MedianFiltering => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DeinterlaceTech_EdgeFiltering => 16

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DeinterlaceTech_FieldAdaptive => 32

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DeinterlaceTech_PixelAdaptive => 64

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DeinterlaceTech_MotionVectorSteered => 128

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DeinterlaceTech_InverseTelecine => 256

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DeinterlaceTech_Mask => 511
}
