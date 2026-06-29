#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_BARRIER_SYNC.ahk" { D3D12_BARRIER_SYNC }
#Import ".\D3D12_BARRIER_ACCESS.ahk" { D3D12_BARRIER_ACCESS }
#Import ".\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Describes a buffer memory access barrier. Used by buffer barriers to indicate when resource memory must be made visible for a specific access type.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_buffer_barrier
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_BUFFER_BARRIER {
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
     * Access bits corresponding with resource usage since the preceding barrier, or the start of **ExecuteCommandLists** scope.
     */
    AccessBefore : D3D12_BARRIER_ACCESS

    /**
     * Access bits corresponding with resource usage after the barrier completes.
     */
    AccessAfter : D3D12_BARRIER_ACCESS

    /**
     * Pointer to the buffer resource being using the barrier.
     */
    pResource : ID3D12Resource

    /**
     * Must be 0.
     */
    Offset : Int64

    /**
     * Must be either **UINT64_MAX** or the size of the buffer in bytes.
     */
    Size : Int64

}
