#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_VideoProcess{

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
