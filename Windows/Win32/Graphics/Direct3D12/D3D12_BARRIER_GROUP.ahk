#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_TEXTURE_BARRIER.ahk" { D3D12_TEXTURE_BARRIER }
#Import ".\D3D12_BUFFER_BARRIER.ahk" { D3D12_BUFFER_BARRIER }
#Import ".\D3D12_BARRIER_TYPE.ahk" { D3D12_BARRIER_TYPE }
#Import ".\D3D12_GLOBAL_BARRIER.ahk" { D3D12_GLOBAL_BARRIER }

/**
 * Describes a group of barriers of a given type.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_barrier_group
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_BARRIER_GROUP {
    #StructPack 8

    /**
     * The type of barriers in the group.
     */
    Type : D3D12_BARRIER_TYPE

    /**
     * The number of barriers in the group.
     */
    NumBarriers : UInt32

    pGlobalBarriers : D3D12_GLOBAL_BARRIER.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pTextureBarriers', { type: D3D12_TEXTURE_BARRIER.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pBufferBarriers', { type: D3D12_BUFFER_BARRIER.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
