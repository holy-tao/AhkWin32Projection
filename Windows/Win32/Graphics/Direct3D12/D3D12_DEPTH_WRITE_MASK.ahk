#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the portion of a depth-stencil buffer for writing depth data.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_depth_stencil_desc">D3D12_DEPTH_STENCIL_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_depth_write_mask
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DEPTH_WRITE_MASK {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Turn off writes to the depth-stencil buffer.
     * @type {Integer (Int32)}
     */
    static D3D12_DEPTH_WRITE_MASK_ZERO => 0

    /**
     * Turn on writes to the depth-stencil buffer.
     * @type {Integer (Int32)}
     */
    static D3D12_DEPTH_WRITE_MASK_ALL => 1
}
