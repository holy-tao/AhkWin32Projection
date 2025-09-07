#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies types of display modes to filter out.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddisplaymodefilter
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDISPLAYMODEFILTER extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * The size of this structure. This should always be set to sizeof(D3DDISPLAYMODEFILTER).
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[D3DFORMAT](d3dformat.md)**
     * 
     * 
     * The display mode format to filter out. See [D3DFORMAT](d3dformat.md).
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: **[**D3DSCANLINEORDERING**](./d3dscanlineordering.md)**
     * 
     * 
     * Whether the scanline ordering is interlaced or progressive. See [**D3DSCANLINEORDERING**](./d3dscanlineordering.md).
     * @type {Integer}
     */
    ScanLineOrdering {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
