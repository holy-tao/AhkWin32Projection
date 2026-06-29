#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the dimensions of a viewport. (D3D10_VIEWPORT)
 * @remarks
 * In all cases, <b>Width</b> and <b>Height</b> must be ≥ 0 and <b>TopLeftX</b> + <b>Width</b> and <b>TopLeftY</b> + <b>Height</b> must be ≤ D3D10_VIEWPORT_BOUNDS_MAX.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_viewport
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_VIEWPORT {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * X position of the left hand side of the viewport. Ranges between D3D10_VIEWPORT_BOUNDS_MIN and D3D10_VIEWPORT_BOUNDS_MAX.
     */
    TopLeftX : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Y position of the top of the viewport. Ranges between D3D10_VIEWPORT_BOUNDS_MIN and D3D10_VIEWPORT_BOUNDS_MAX.
     */
    TopLeftY : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Width of the viewport.
     */
    Width : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Height of the viewport.
     */
    Height : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Minimum depth of the viewport. Ranges between 0 and 1.
     */
    MinDepth : Float32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Maximum depth of the viewport. Ranges between 0 and 1.
     */
    MaxDepth : Float32

}
