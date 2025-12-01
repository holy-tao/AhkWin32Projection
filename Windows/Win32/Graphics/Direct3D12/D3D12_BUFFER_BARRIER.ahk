#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a buffer memory access barrier. Used by buffer barriers to indicate when resource memory must be made visible for a specific access type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_buffer_barrier
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_BUFFER_BARRIER extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Synchronization scope of all preceding GPU work that must be completed before executing the barrier.
     * @type {Integer}
     */
    SyncBefore {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Synchronization scope of all subsequent GPU work that must wait until the barrier execution is finished.
     * @type {Integer}
     */
    SyncAfter {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Access bits corresponding with resource usage since the preceding barrier, or the start of **ExecuteCommandLists** scope.
     * @type {Integer}
     */
    AccessBefore {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Access bits corresponding with resource usage after the barrier completes.
     * @type {Integer}
     */
    AccessAfter {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Pointer to the buffer resource being using the barrier.
     * @type {ID3D12Resource}
     */
    pResource {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Must be 0.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Must be either **UINT64_MAX** or the size of the buffer in bytes.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
