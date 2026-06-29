#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * Describes the display mode.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddisplaymode
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DDISPLAYMODE {
    #StructPack 4

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Screen width, in pixels.
     */
    Width : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Screen height, in pixels.
     */
    Height : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Refresh rate. The value of 0 indicates an adapter default.
     */
    RefreshRate : UInt32

    /**
     * Type: **[D3DFORMAT](d3dformat.md)**
     * 
     * 
     * Member of the [D3DFORMAT](d3dformat.md) enumerated type, describing the surface format of the display mode.
     */
    Format : D3DFORMAT

}
