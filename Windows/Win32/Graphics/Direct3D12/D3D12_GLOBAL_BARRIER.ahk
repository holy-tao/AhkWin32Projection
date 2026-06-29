#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_BARRIER_SYNC.ahk" { D3D12_BARRIER_SYNC }
#Import ".\D3D12_BARRIER_ACCESS.ahk" { D3D12_BARRIER_ACCESS }

/**
 * Describes a resource memory access barrier. Used by global, texture, and buffer barriers to indicate when resource memory must be made visible for a specific access type.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_global_barrier
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_GLOBAL_BARRIER {
    #StructPack 4

    /**
     * Synchronization scope of all preceding GPU work that must be completed before executing the barrier.
     */
    SyncBefore : D3D12_BARRIER_SYNC

    /**
     * Synchronization scope of all subsequent GPU work that must wait until the barrier execution is finished.
     */
    SyncAfter : D3D12_BARRIER_SYNC

    /**
     * Access bits corresponding with any relevant resource usage since the preceding barrier or the start of **ExecuteCommandLists** scope.
     */
    AccessBefore : D3D12_BARRIER_ACCESS

    /**
     * Access bits corresponding with any relevant resource usage after the barrier completes.
     */
    AccessAfter : D3D12_BARRIER_ACCESS

}
