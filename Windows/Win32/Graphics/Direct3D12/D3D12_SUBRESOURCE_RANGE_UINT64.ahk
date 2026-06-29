#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_RANGE_UINT64.ahk" { D3D12_RANGE_UINT64 }

/**
 * Describes a subresource memory range.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist1-atomiccopybufferuint">AtomicCopyBufferUINT</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist1-atomiccopybufferuint64">AtomicCopyBufferUINT64</a> methods.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_subresource_range_uint64
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SUBRESOURCE_RANGE_UINT64 {
    #StructPack 8

    /**
     * The index of the subresource.
     */
    Subresource : UInt32

    /**
     * A memory range within the subresource.
     */
    Range : D3D12_RANGE_UINT64

}
