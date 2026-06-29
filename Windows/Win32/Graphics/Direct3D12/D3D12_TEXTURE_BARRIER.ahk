#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_BARRIER_SYNC.ahk" { D3D12_BARRIER_SYNC }
#Import ".\D3D12_TEXTURE_BARRIER_FLAGS.ahk" { D3D12_TEXTURE_BARRIER_FLAGS }
#Import ".\D3D12_BARRIER_SUBRESOURCE_RANGE.ahk" { D3D12_BARRIER_SUBRESOURCE_RANGE }
#Import ".\D3D12_BARRIER_LAYOUT.ahk" { D3D12_BARRIER_LAYOUT }
#Import ".\D3D12_BARRIER_ACCESS.ahk" { D3D12_BARRIER_ACCESS }
#Import ".\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Expresses an access transition for a texture.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_texture_barrier
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_TEXTURE_BARRIER {
    #StructPack 8

    /**
     * Synchronization scope of all preceding GPU work that must be completed before executing the barrier.
     */
    SyncBefore : D3D12_BARRIER_SYNC

    /**
     * Synchronization scope of all subsequent GPU work that must wait until the barrier execution is finished.
     */
    SyncAfter : D3D12_BARRIER_SYNC

    /**
     * Access bits corresponding with resource usage since the preceding barrier or the start of **ExecuteCommandLists** scope.
     */
    AccessBefore : D3D12_BARRIER_ACCESS

    /**
     * Access bits corresponding with resource usage after the barrier completes.
     */
    AccessAfter : D3D12_BARRIER_ACCESS

    /**
     * Layout of texture preceding the barrier execution.
     */
    LayoutBefore : D3D12_BARRIER_LAYOUT

    /**
     * Layout of texture upon completion of barrier execution.
     */
    LayoutAfter : D3D12_BARRIER_LAYOUT

    /**
     * Pointer to the buffer resource being using the barrier.
     */
    pResource : ID3D12Resource

    /**
     * Range of texture subresources being barriered.
     */
    Subresources : D3D12_BARRIER_SUBRESOURCE_RANGE

    /**
     * Optional flags values.
     */
    Flags : D3D12_TEXTURE_BARRIER_FLAGS

}
