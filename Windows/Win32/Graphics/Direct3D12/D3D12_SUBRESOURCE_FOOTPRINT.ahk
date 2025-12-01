#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the format, width, height, depth, and row-pitch of the subresource into the parent resource.
 * @remarks
 * Use this structure in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_placed_subresource_footprint">D3D12_PLACED_SUBRESOURCE_FOOTPRINT</a> structure.
 *       
 * 
 * The helper structure is <a href="https://docs.microsoft.com/windows/desktop/direct3d12/cd3dx12-subresource-footprint">CD3DX12_SUBRESOURCE_FOOTPRINT</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_subresource_footprint
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SUBRESOURCE_FOOTPRINT extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value that  specifies the viewing format.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The width of the subresource.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The height of the subresource.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The depth of the subresource.
     * @type {Integer}
     */
    Depth {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The row pitch, or width, or physical size, in bytes, of the subresource data.
     *             This must be a multiple of D3D12_TEXTURE_DATA_PITCH_ALIGNMENT (256), and must be greater than or equal to the size of the data within a row.
     * @type {Integer}
     */
    RowPitch {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
