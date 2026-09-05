#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA2_VideoRenderTargetType extends Win32Enum {

    /**
     * Native name: DXVA2_VideoDecoderRenderTarget
     * @type {Integer (Int32)}
     */
    static DecoderRenderTarget => 0

    /**
     * Native name: DXVA2_VideoProcessorRenderTarget
     * @type {Integer (Int32)}
     */
    static ProcessorRenderTarget => 1

    /**
     * Native name: DXVA2_VideoSoftwareRenderTarget
     * @type {Integer (Int32)}
     */
    static SoftwareRenderTarget => 2
}
