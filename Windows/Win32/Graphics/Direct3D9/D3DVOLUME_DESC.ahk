#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DRESOURCETYPE.ahk" { D3DRESOURCETYPE }
#Import ".\D3DPOOL.ahk" { D3DPOOL }
#Import ".\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * Describes a volume.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dvolume-desc
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DVOLUME_DESC {
    #StructPack 4

    /**
     * Type: **[D3DFORMAT](d3dformat.md)**
     * 
     * 
     * Member of the [D3DFORMAT](d3dformat.md) enumerated type, describing the surface format of the volume.
     */
    Format : D3DFORMAT

    /**
     * Type: **[**D3DRESOURCETYPE**](./d3dresourcetype.md)**
     * 
     * 
     * Member of the [**D3DRESOURCETYPE**](./d3dresourcetype.md) enumerated type, identifying this resource as a volume.
     */
    Type : D3DRESOURCETYPE

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Currently not used. Always returned as 0.
     */
    Usage : UInt32

    /**
     * Type: **[**D3DPOOL**](./d3dpool.md)**
     * 
     * 
     * Member of the [**D3DPOOL**](./d3dpool.md) enumerated type, specifying the class of memory allocated for this volume.
     */
    Pool : D3DPOOL

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Width of the volume, in pixels.
     */
    Width : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Height of the volume, in pixels.
     */
    Height : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Depth of the volume, in pixels.
     */
    Depth : UInt32

}
