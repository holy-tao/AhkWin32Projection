#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes a DirectX surface type for DirectX Video Acceleration (DXVA).
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ne-dxva2api-dxva2_surfacetype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA2_SurfaceType extends Win32Enum {

    /**
     * The surface is a decoder render target.
     * Native name: DXVA2_SurfaceType_DecoderRenderTarget
     * @type {Integer (Int32)}
     */
    static DecoderRenderTarget => 0

    /**
     * The surface is a video processor render target.
     * Native name: DXVA2_SurfaceType_ProcessorRenderTarget
     * @type {Integer (Int32)}
     */
    static ProcessorRenderTarget => 1

    /**
     * The surface is a Direct3D texture render target.
     * Native name: DXVA2_SurfaceType_D3DRenderTargetTexture
     * @type {Integer (Int32)}
     */
    static D3DRenderTargetTexture => 2
}
