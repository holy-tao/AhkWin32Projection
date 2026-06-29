#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identify the portion of a depth-stencil buffer for writing depth data. (D3D11_DEPTH_WRITE_MASK)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_depth_write_mask
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_DEPTH_WRITE_MASK {
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
    static D3D11_DEPTH_WRITE_MASK_ZERO => 0

    /**
     * Turn on writes to the depth-stencil buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_DEPTH_WRITE_MASK_ALL => 1
}
