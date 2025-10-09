#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_RESOURCE_TRANSITION_BARRIER.ahk
#Include .\D3D12_RESOURCE_ALIASING_BARRIER.ahk
#Include .\D3D12_RESOURCE_UAV_BARRIER.ahk

/**
 * Describes a resource barrier (transition in resource use).
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-resourcebarrier">ID3D12GraphicsCommandList::ResourceBarrier</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_barrier
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RESOURCE_BARRIER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_barrier_type">D3D12_RESOURCE_BARRIER_TYPE</a>-typed value that specifies the type of resource barrier. 
     *             This member determines which type to use in the union below.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_barrier_flags">D3D12_RESOURCE_BARRIER_FLAGS</a> enumeration constant such as for "begin only" or "end only".
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3D12_RESOURCE_TRANSITION_BARRIER}
     */
    Transition{
        get {
            if(!this.HasProp("__Transition"))
                this.__Transition := D3D12_RESOURCE_TRANSITION_BARRIER(this.ptr + 8)
            return this.__Transition
        }
    }

    /**
     * @type {D3D12_RESOURCE_ALIASING_BARRIER}
     */
    Aliasing{
        get {
            if(!this.HasProp("__Aliasing"))
                this.__Aliasing := D3D12_RESOURCE_ALIASING_BARRIER(this.ptr + 8)
            return this.__Aliasing
        }
    }

    /**
     * @type {D3D12_RESOURCE_UAV_BARRIER}
     */
    UAV{
        get {
            if(!this.HasProp("__UAV"))
                this.__UAV := D3D12_RESOURCE_UAV_BARRIER(this.ptr + 8)
            return this.__UAV
        }
    }
}
