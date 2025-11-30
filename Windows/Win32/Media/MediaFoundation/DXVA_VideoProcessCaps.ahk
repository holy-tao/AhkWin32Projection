#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA_VideoProcessCaps extends Win32Enum{

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
