#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DRESOURCETYPE.ahk" { D3DRESOURCETYPE }
#Import ".\D3DPOOL.ahk" { D3DPOOL }
#Import ".\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * Describes a vertex buffer.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dvertexbuffer-desc
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DVERTEXBUFFER_DESC {
    #StructPack 4

    /**
     * Type: **[D3DFORMAT](d3dformat.md)**
     * 
     * 
     * Member of the [D3DFORMAT](d3dformat.md) enumerated type, describing the surface format of the vertex buffer data.
     */
    Format : D3DFORMAT

    /**
     * Type: **[**D3DRESOURCETYPE**](./d3dresourcetype.md)**
     * 
     * 
     * Member of the [**D3DRESOURCETYPE**](./d3dresourcetype.md) enumerated type, identifying this resource as a vertex buffer.
     */
    Type : D3DRESOURCETYPE

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Combination of one or more [**D3DUSAGE**](d3dusage.md) flags.
     */
    Usage : UInt32

    /**
     * Type: **[**D3DPOOL**](./d3dpool.md)**
     * 
     * 
     * Member of the [**D3DPOOL**](./d3dpool.md) enumerated type, specifying the class of memory allocated for this vertex buffer.
     */
    Pool : D3DPOOL

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Size of the vertex buffer, in bytes.
     */
    Size : UInt32

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Combination of [D3DFVF](d3dfvf.md) that describes the vertex format of the vertices in this buffer.
     */
    FVF : UInt32

}
