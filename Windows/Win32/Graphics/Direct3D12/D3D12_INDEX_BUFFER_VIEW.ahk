#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }

/**
 * Describes the index buffer to view.
 * @remarks
 * This structure is passed into <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-iasetindexbuffer">ID3D12GraphicsCommandList::IASetIndexBuffer</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_index_buffer_view
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_INDEX_BUFFER_VIEW {
    #StructPack 8

    /**
     * The GPU virtual address of the index buffer.  
     *             D3D12_GPU_VIRTUAL_ADDRESS is a typedef'd synonym of UINT64.
     */
    BufferLocation : Int64

    /**
     * The size in bytes of the index buffer.
     */
    SizeInBytes : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value for the index-buffer format.
     */
    Format : DXGI_FORMAT

}
