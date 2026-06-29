#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a DirectX surface type for DirectX Video Acceleration (DXVA).
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ne-dxva2api-dxva2_surfacetype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_SurfaceType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
