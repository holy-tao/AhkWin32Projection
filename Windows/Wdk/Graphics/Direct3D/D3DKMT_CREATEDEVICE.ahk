#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_ALLOCATIONLIST.ahk" { D3DDDI_ALLOCATIONLIST }
#Import ".\D3DDDI_PATCHLOCATIONLIST.ahk" { D3DDDI_PATCHLOCATIONLIST }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CREATEDEVICE {
    #StructPack 8

    hAdapter : UInt32

    Flags : IntPtr

    hDevice : UInt32

    pCommandBuffer : IntPtr

    CommandBufferSize : UInt32

    pAllocationList : D3DDDI_ALLOCATIONLIST.Ptr

    AllocationListSize : UInt32

    pPatchLocationList : D3DDDI_PATCHLOCATIONLIST.Ptr

    PatchLocationListSize : UInt32

    static __New() {
        DefineProp(this.Prototype, 'pAdapter', { type: IntPtr, offset: 0 })
        this.DeleteProp("__New")
    }
}
