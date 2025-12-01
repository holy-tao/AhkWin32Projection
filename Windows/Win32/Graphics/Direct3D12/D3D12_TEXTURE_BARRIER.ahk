#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_BARRIER_SUBRESOURCE_RANGE.ahk

/**
 * Expresses an access transition for a texture.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_texture_barrier
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_TEXTURE_BARRIER extends Win32Struct
{
    static sizeof => 64

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
     * Access bits corresponding with resource usage since the preceding barrier or the start of **ExecuteCommandLists** scope.
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
     * Layout of texture preceding the barrier execution.
     * @type {Integer}
     */
    LayoutBefore {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Layout of texture upon completion of barrier execution.
     * @type {Integer}
     */
    LayoutAfter {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Pointer to the buffer resource being using the barrier.
     * @type {ID3D12Resource}
     */
    pResource {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Range of texture subresources being barriered.
     * @type {D3D12_BARRIER_SUBRESOURCE_RANGE}
     */
    Subresources{
        get {
            if(!this.HasProp("__Subresources"))
                this.__Subresources := D3D12_BARRIER_SUBRESOURCE_RANGE(32, this)
            return this.__Subresources
        }
    }

    /**
     * Optional flags values.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
