#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a range.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3drange
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DRANGE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Offset, in bytes.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Size, in bytes.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
