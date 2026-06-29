#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DSCANLINEORDERING.ahk" { D3DSCANLINEORDERING }
#Import ".\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * Specifies types of display modes to filter out.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddisplaymodefilter
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DDISPLAYMODEFILTER {
    #StructPack 4

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * The size of this structure. This should always be set to sizeof(D3DDISPLAYMODEFILTER).
     */
    Size : UInt32

    /**
     * Type: **[D3DFORMAT](d3dformat.md)**
     * 
     * 
     * The display mode format to filter out. See [D3DFORMAT](d3dformat.md).
     */
    Format : D3DFORMAT

    /**
     * Type: **[**D3DSCANLINEORDERING**](./d3dscanlineordering.md)**
     * 
     * 
     * Whether the scanline ordering is interlaced or progressive. See [**D3DSCANLINEORDERING**](./d3dscanlineordering.md).
     */
    ScanLineOrdering : D3DSCANLINEORDERING

}
