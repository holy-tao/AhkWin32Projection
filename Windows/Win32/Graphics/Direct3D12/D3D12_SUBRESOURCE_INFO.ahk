#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes subresource data.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_subresource_info
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SUBRESOURCE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Offset, in bytes, between the start of the parent resource and this subresource.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The row pitch, or width, or physical size, in bytes, of the subresource data.
     * @type {Integer}
     */
    RowPitch {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The depth pitch, or width, or physical size, in bytes, of the subresource data.
     * @type {Integer}
     */
    DepthPitch {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
