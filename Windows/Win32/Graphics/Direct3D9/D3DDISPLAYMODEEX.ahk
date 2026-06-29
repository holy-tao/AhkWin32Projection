#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DSCANLINEORDERING.ahk" { D3DSCANLINEORDERING }
#Import ".\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * Information about the properties of a display mode.
 * @remarks
 * This structure is used in various methods to create and manage Direct3D 9Ex devices ([**IDirect3DDevice9Ex**](/windows/desktop/api/d3d9/nn-d3d9-idirect3ddevice9ex)) and swapchains ([**IDirect3DSwapChain9Ex**](/windows/desktop/api/d3d9/nn-d3d9-idirect3dswapchain9ex)).
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddisplaymodeex
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DDISPLAYMODEEX {
    #StructPack 4

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * The size of this structure. This should always be set to sizeof(D3DDISPLAYMODEEX).
     */
    Size : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Width of the display mode.
     */
    Width : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Height of the display mode.
     */
    Height : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Refresh rate of the display mode.
     */
    RefreshRate : UInt32

    /**
     * Type: **[D3DFORMAT](d3dformat.md)**
     * 
     * 
     * Format of the display mode. See [D3DFORMAT](d3dformat.md).
     */
    Format : D3DFORMAT

    /**
     * Type: **[**D3DSCANLINEORDERING**](./d3dscanlineordering.md)**
     * 
     * 
     * Indicates whether the scanline order is progressive or interlaced. See [**D3DSCANLINEORDERING**](./d3dscanlineordering.md).
     */
    ScanLineOrdering : D3DSCANLINEORDERING

}
