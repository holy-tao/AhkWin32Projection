#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies triangles facing a particular direction are not drawn.
 * @remarks
 * Cull mode is specified in a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_rasterizer_desc">D3D12_RASTERIZER_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_cull_mode
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_CULL_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Always draw all triangles.
     * @type {Integer (Int32)}
     */
    static D3D12_CULL_MODE_NONE => 1

    /**
     * Do not draw triangles that are front-facing.
     * @type {Integer (Int32)}
     */
    static D3D12_CULL_MODE_FRONT => 2

    /**
     * Do not draw triangles that are back-facing.
     * @type {Integer (Int32)}
     */
    static D3D12_CULL_MODE_BACK => 3
}
