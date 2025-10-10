#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes a DirectX surface type for DirectX Video Acceleration (DXVA).
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/ne-dxva2api-dxva2_surfacetype
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_SurfaceType{

    /**
     * The surface is a decoder render target.
     * @type {Integer (Int32)}
     */
    static DXVA2_SurfaceType_DecoderRenderTarget => 0

    /**
     * The surface is a video processor render target.
     * @type {Integer (Int32)}
     */
    static DXVA2_SurfaceType_ProcessorRenderTarget => 1

    /**
     * The surface is a Direct3D texture render target.
     * @type {Integer (Int32)}
     */
    static DXVA2_SurfaceType_D3DRenderTargetTexture => 2
}
