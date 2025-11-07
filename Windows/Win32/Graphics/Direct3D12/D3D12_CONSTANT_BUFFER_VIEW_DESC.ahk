#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a constant buffer to view.
 * @remarks
 * 
 * This structure is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createconstantbufferview">CreateConstantBufferView</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_constant_buffer_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_CONSTANT_BUFFER_VIEW_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The D3D12_GPU_VIRTUAL_ADDRESS of the constant buffer.
     *             D3D12_GPU_VIRTUAL_ADDRESS is a typedef'd alias of UINT64.
     * @type {Integer}
     */
    BufferLocation {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size in bytes of the constant buffer.
     * @type {Integer}
     */
    SizeInBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
