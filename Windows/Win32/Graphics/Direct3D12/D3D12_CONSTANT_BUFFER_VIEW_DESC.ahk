#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a constant buffer to view.
 * @remarks
 * This structure is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createconstantbufferview">CreateConstantBufferView</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_constant_buffer_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_CONSTANT_BUFFER_VIEW_DESC {
    #StructPack 8

    /**
     * The D3D12_GPU_VIRTUAL_ADDRESS of the constant buffer.
     *             D3D12_GPU_VIRTUAL_ADDRESS is a typedef'd alias of UINT64.
     */
    BufferLocation : Int64

    /**
     * The size in bytes of the constant buffer.
     */
    SizeInBytes : UInt32

}
