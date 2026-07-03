#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_ALLOCATIONLIST.ahk" { D3DDDI_ALLOCATIONLIST }
#Import ".\D3DDDI_PATCHLOCATIONLIST.ahk" { D3DDDI_PATCHLOCATIONLIST }
#Import ".\D3DKMT_CLIENTHINT.ahk" { D3DKMT_CLIENTHINT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CREATECONTEXT {
    #StructPack 8

    hDevice : UInt32

    NodeOrdinal : UInt32

    EngineAffinity : UInt32

    Flags : IntPtr

    pPrivateDriverData : IntPtr

    PrivateDriverDataSize : UInt32

    ClientHint : D3DKMT_CLIENTHINT

    hContext : UInt32

    pCommandBuffer : IntPtr

    CommandBufferSize : UInt32

    pAllocationList : D3DDDI_ALLOCATIONLIST.Ptr

    AllocationListSize : UInt32

    pPatchLocationList : D3DDDI_PATCHLOCATIONLIST.Ptr

    PatchLocationListSize : UInt32

    CommandBuffer : Int64

}
