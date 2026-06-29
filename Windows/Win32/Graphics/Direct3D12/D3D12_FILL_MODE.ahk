#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the fill mode to use when rendering triangles.
 * @remarks
 * Fill mode is specified in a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_rasterizer_desc">D3D12_RASTERIZER_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_fill_mode
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FILL_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Draw lines connecting the vertices. Adjacent vertices are not drawn.
     * @type {Integer (Int32)}
     */
    static D3D12_FILL_MODE_WIREFRAME => 2

    /**
     * Fill the triangles formed by the vertices. Adjacent vertices are not drawn.
     * @type {Integer (Int32)}
     */
    static D3D12_FILL_MODE_SOLID => 3
}
