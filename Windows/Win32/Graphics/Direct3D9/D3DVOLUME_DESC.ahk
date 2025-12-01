#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a volume.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dvolume-desc
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DVOLUME_DESC extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Type: **[D3DFORMAT](d3dformat.md)**
     * 
     * 
     * Member of the [D3DFORMAT](d3dformat.md) enumerated type, describing the surface format of the volume.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[**D3DRESOURCETYPE**](./d3dresourcetype.md)**
     * 
     * 
     * Member of the [**D3DRESOURCETYPE**](./d3dresourcetype.md) enumerated type, identifying this resource as a volume.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Currently not used. Always returned as 0.
     * @type {Integer}
     */
    Usage {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[**D3DPOOL**](./d3dpool.md)**
     * 
     * 
     * Member of the [**D3DPOOL**](./d3dpool.md) enumerated type, specifying the class of memory allocated for this volume.
     * @type {Integer}
     */
    Pool {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Width of the volume, in pixels.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Height of the volume, in pixels.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Depth of the volume, in pixels.
     * @type {Integer}
     */
    Depth {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
