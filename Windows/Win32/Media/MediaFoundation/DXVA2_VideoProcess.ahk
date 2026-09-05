#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA2_VideoProcess extends Win32Enum {

    /**
     * Native name: DXVA2_VideoProcess_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: DXVA2_VideoProcess_YUV2RGB
     * @type {Integer (Int32)}
     */
    static YUV2RGB => 1

    /**
     * Native name: DXVA2_VideoProcess_StretchX
     * @type {Integer (Int32)}
     */
    static StretchX => 2

    /**
     * Native name: DXVA2_VideoProcess_StretchY
     * @type {Integer (Int32)}
     */
    static StretchY => 4

    /**
     * Native name: DXVA2_VideoProcess_AlphaBlend
     * @type {Integer (Int32)}
     */
    static AlphaBlend => 8

    /**
     * Native name: DXVA2_VideoProcess_SubRects
     * @type {Integer (Int32)}
     */
    static SubRects => 16

    /**
     * Native name: DXVA2_VideoProcess_SubStreams
     * @type {Integer (Int32)}
     */
    static SubStreams => 32

    /**
     * Native name: DXVA2_VideoProcess_SubStreamsExtended
     * @type {Integer (Int32)}
     */
    static SubStreamsExtended => 64

    /**
     * Native name: DXVA2_VideoProcess_YUV2RGBExtended
     * @type {Integer (Int32)}
     */
    static YUV2RGBExtended => 128

    /**
     * Native name: DXVA2_VideoProcess_AlphaBlendExtended
     * @type {Integer (Int32)}
     */
    static AlphaBlendExtended => 256

    /**
     * Native name: DXVA2_VideoProcess_Constriction
     * @type {Integer (Int32)}
     */
    static Constriction => 512

    /**
     * Native name: DXVA2_VideoProcess_NoiseFilter
     * @type {Integer (Int32)}
     */
    static NoiseFilter => 1024

    /**
     * Native name: DXVA2_VideoProcess_DetailFilter
     * @type {Integer (Int32)}
     */
    static DetailFilter => 2048

    /**
     * Native name: DXVA2_VideoProcess_PlanarAlpha
     * @type {Integer (Int32)}
     */
    static PlanarAlpha => 4096

    /**
     * Native name: DXVA2_VideoProcess_LinearScaling
     * @type {Integer (Int32)}
     */
    static LinearScaling => 8192

    /**
     * Native name: DXVA2_VideoProcess_GammaCompensated
     * @type {Integer (Int32)}
     */
    static GammaCompensated => 16384

    /**
     * Native name: DXVA2_VideoProcess_MaintainsOriginalFieldData
     * @type {Integer (Int32)}
     */
    static MaintainsOriginalFieldData => 32768

    /**
     * Native name: DXVA2_VideoProcess_Mask
     * @type {Integer (Int32)}
     */
    static Mask => 65535
}
