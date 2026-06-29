#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a resolve operation.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist1-resolvesubresourceregion">ID3D12GraphicsCommandList1::ResolveSubresourceRegion</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resolve_mode
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RESOLVE_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Resolves compressed source samples to their uncompressed values. When using this operation, the source and destination resources must have the same sample count, unlike the min, max, and average operations that require the destination to have a sample count of 1.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOLVE_MODE_DECOMPRESS => 0

    /**
     * Resolves the source samples to their minimum value. It can be used with any render target or depth stencil format.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOLVE_MODE_MIN => 1

    /**
     * Resolves the source samples to their maximum value. It can be used with any render target or depth stencil format.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOLVE_MODE_MAX => 2

    /**
     * Resolves the source samples to their average value. It can be used with any non-integer render target format, including the depth plane. It can't be used with integer render target formats, including the stencil plane.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOLVE_MODE_AVERAGE => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RESOLVE_MODE_ENCODE_SAMPLER_FEEDBACK => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RESOLVE_MODE_DECODE_SAMPLER_FEEDBACK => 5
}
