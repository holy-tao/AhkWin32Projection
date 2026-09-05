#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA_VideoProcessCaps extends Win32Enum {

    /**
     * Native name: DXVA_VideoProcess_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: DXVA_VideoProcess_YUV2RGB
     * @type {Integer (Int32)}
     */
    static YUV2RGB => 1

    /**
     * Native name: DXVA_VideoProcess_StretchX
     * @type {Integer (Int32)}
     */
    static StretchX => 2

    /**
     * Native name: DXVA_VideoProcess_StretchY
     * @type {Integer (Int32)}
     */
    static StretchY => 4

    /**
     * Native name: DXVA_VideoProcess_AlphaBlend
     * @type {Integer (Int32)}
     */
    static AlphaBlend => 8

    /**
     * Native name: DXVA_VideoProcess_SubRects
     * @type {Integer (Int32)}
     */
    static SubRects => 16

    /**
     * Native name: DXVA_VideoProcess_SubStreams
     * @type {Integer (Int32)}
     */
    static SubStreams => 32

    /**
     * Native name: DXVA_VideoProcess_SubStreamsExtended
     * @type {Integer (Int32)}
     */
    static SubStreamsExtended => 64

    /**
     * Native name: DXVA_VideoProcess_YUV2RGBExtended
     * @type {Integer (Int32)}
     */
    static YUV2RGBExtended => 128

    /**
     * Native name: DXVA_VideoProcess_AlphaBlendExtended
     * @type {Integer (Int32)}
     */
    static AlphaBlendExtended => 256
}
