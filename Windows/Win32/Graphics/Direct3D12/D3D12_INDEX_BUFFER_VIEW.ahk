#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the index buffer to view.
 * @remarks
 * This structure is passed into <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-iasetindexbuffer">ID3D12GraphicsCommandList::IASetIndexBuffer</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_index_buffer_view
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_INDEX_BUFFER_VIEW extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The GPU virtual address of the index buffer.  
     *             D3D12_GPU_VIRTUAL_ADDRESS is a typedef'd synonym of UINT64.
     * @type {Integer}
     */
    BufferLocation {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size in bytes of the index buffer.
     * @type {Integer}
     */
    SizeInBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value for the index-buffer format.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
