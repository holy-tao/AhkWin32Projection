#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_RESOURCE_BARRIER_FLAGS.ahk" { D3D12_RESOURCE_BARRIER_FLAGS }
#Import ".\D3D12_RESOURCE_BARRIER_TYPE.ahk" { D3D12_RESOURCE_BARRIER_TYPE }
#Import ".\D3D12_RESOURCE_UAV_BARRIER.ahk" { D3D12_RESOURCE_UAV_BARRIER }
#Import ".\D3D12_RESOURCE_STATES.ahk" { D3D12_RESOURCE_STATES }
#Import ".\D3D12_RESOURCE_ALIASING_BARRIER.ahk" { D3D12_RESOURCE_ALIASING_BARRIER }
#Import ".\D3D12_RESOURCE_TRANSITION_BARRIER.ahk" { D3D12_RESOURCE_TRANSITION_BARRIER }
#Import ".\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Describes a resource barrier (transition in resource use).
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-resourcebarrier">ID3D12GraphicsCommandList::ResourceBarrier</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_barrier
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RESOURCE_BARRIER {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_barrier_type">D3D12_RESOURCE_BARRIER_TYPE</a>-typed value that specifies the type of resource barrier. 
     *             This member determines which type to use in the union below.
     */
    Type : D3D12_RESOURCE_BARRIER_TYPE

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_barrier_flags">D3D12_RESOURCE_BARRIER_FLAGS</a> enumeration constant such as for "begin only" or "end only".
     */
    Flags : D3D12_RESOURCE_BARRIER_FLAGS

    Transition : D3D12_RESOURCE_TRANSITION_BARRIER

    static __New() {
        DefineProp(this.Prototype, 'Aliasing', { type: D3D12_RESOURCE_ALIASING_BARRIER, offset: 8 })
        DefineProp(this.Prototype, 'UAV', { type: D3D12_RESOURCE_UAV_BARRIER, offset: 8 })
        this.DeleteProp("__New")
    }
}
