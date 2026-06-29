#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_ALLOCATIONLIST.ahk" { D3DDDI_ALLOCATIONLIST }
#Import ".\D3DDDI_PATCHLOCATIONLIST.ahk" { D3DDDI_PATCHLOCATIONLIST }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_RENDER {
    #StructPack 8

    hDevice : UInt32

    CommandOffset : UInt32

    CommandLength : UInt32

    AllocationCount : UInt32

    PatchLocationCount : UInt32

    pNewCommandBuffer : IntPtr

    NewCommandBufferSize : UInt32

    pNewAllocationList : D3DDDI_ALLOCATIONLIST.Ptr

    NewAllocationListSize : UInt32

    pNewPatchLocationList : D3DDDI_PATCHLOCATIONLIST.Ptr

    NewPatchLocationListSize : UInt32

    Flags : IntPtr

    PresentHistoryToken : Int64

    BroadcastContextCount : UInt32

    BroadcastContext : UInt32[64]

    QueuedBufferCount : UInt32

    NewCommandBuffer : Int64

    pPrivateDriverData : IntPtr

    PrivateDriverDataSize : UInt32

    static __New() {
        DefineProp(this.Prototype, 'hContext', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
