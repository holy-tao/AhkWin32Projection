#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_VideoProcess {
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
    static DXVA2_VideoProcess_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoProcess_YUV2RGB => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoProcess_StretchX => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoProcess_StretchY => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoProcess_AlphaBlend => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoProcess_SubRects => 16

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoProcess_SubStreams => 32

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoProcess_SubStreamsExtended => 64

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoProcess_YUV2RGBExtended => 128

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoProcess_AlphaBlendExtended => 256

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoProcess_Constriction => 512

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoProcess_NoiseFilter => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoProcess_DetailFilter => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoProcess_PlanarAlpha => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoProcess_LinearScaling => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoProcess_GammaCompensated => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoProcess_MaintainsOriginalFieldData => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoProcess_Mask => 65535
}
