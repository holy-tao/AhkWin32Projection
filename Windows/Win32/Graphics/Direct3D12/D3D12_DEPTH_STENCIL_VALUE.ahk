#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a depth and stencil value.
 * @remarks
 * This structure is used in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_clear_value">D3D12_CLEAR_VALUE</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_depth_stencil_value
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DEPTH_STENCIL_VALUE {
    #StructPack 4

    /**
     * Specifies the depth value.
     */
    Depth : Float32

    /**
     * Specifies the stencil value.
     */
    Stencil : Int8

}
