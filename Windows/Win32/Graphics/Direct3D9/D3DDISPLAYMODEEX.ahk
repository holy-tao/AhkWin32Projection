#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Information about the properties of a display mode.
 * @remarks
 * This structure is used in various methods to create and manage Direct3D 9Ex devices ([**IDirect3DDevice9Ex**](/windows/desktop/api/d3d9/nn-d3d9-idirect3ddevice9ex)) and swapchains ([**IDirect3DSwapChain9Ex**](/windows/desktop/api/d3d9/nn-d3d9-idirect3dswapchain9ex)).
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddisplaymodeex
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDISPLAYMODEEX extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * The size of this structure. This should always be set to sizeof(D3DDISPLAYMODEEX).
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Width of the display mode.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Height of the display mode.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Refresh rate of the display mode.
     * @type {Integer}
     */
    RefreshRate {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: **[D3DFORMAT](d3dformat.md)**
     * 
     * 
     * Format of the display mode. See [D3DFORMAT](d3dformat.md).
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: **[**D3DSCANLINEORDERING**](./d3dscanlineordering.md)**
     * 
     * 
     * Indicates whether the scanline order is progressive or interlaced. See [**D3DSCANLINEORDERING**](./d3dscanlineordering.md).
     * @type {Integer}
     */
    ScanLineOrdering {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
