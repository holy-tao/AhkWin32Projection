#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_VideoProcessCaps {
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
    static DXVA_VideoProcess_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoProcess_YUV2RGB => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoProcess_StretchX => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoProcess_StretchY => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoProcess_AlphaBlend => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoProcess_SubRects => 16

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoProcess_SubStreams => 32

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoProcess_SubStreamsExtended => 64

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoProcess_YUV2RGBExtended => 128

    /**
     * @type {Integer (Int32)}
     */
    static DXVA_VideoProcess_AlphaBlendExtended => 256
}
