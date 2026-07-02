#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3DRESOURCESTATS.ahk" { D3DRESOURCESTATS }

/**
 * Resource usage statistics.
 * @remarks
 * D3DRTYPECOUNT refers to the number of enumerations in [**D3DRESOURCETYPE**](./d3dresourcetype.md).
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddevinfo-resourcemanager
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DDEVINFO_RESOURCEMANAGER {
    #StructPack 4

    /**
     * Type: **[**D3DRESOURCESTATS**](d3dresourcestats.md)**
     * 
     * 
     * Array of resource statistics elements. See [**D3DRESOURCESTATS**](d3dresourcestats.md).
     */
    stats : D3DRESOURCESTATS[8]

}
