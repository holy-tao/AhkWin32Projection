#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_BARRIER_SYNC.ahk
#Include .\D3D12_BARRIER_ACCESS.ahk

/**
 * Describes a resource memory access barrier. Used by global, texture, and buffer barriers to indicate when resource memory must be made visible for a specific access type.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_global_barrier
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_GLOBAL_BARRIER extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * Synchronization scope of all preceding GPU work that must be completed before executing the barrier.
     * @type {D3D12_BARRIER_SYNC}
     */
    SyncBefore {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Synchronization scope of all subsequent GPU work that must wait until the barrier execution is finished.
     * @type {D3D12_BARRIER_SYNC}
     */
    SyncAfter {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Access bits corresponding with any relevant resource usage since the preceding barrier or the start of **ExecuteCommandLists** scope.
     * @type {D3D12_BARRIER_ACCESS}
     */
    AccessBefore {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Access bits corresponding with any relevant resource usage after the barrier completes.
     * @type {D3D12_BARRIER_ACCESS}
     */
    AccessAfter {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
