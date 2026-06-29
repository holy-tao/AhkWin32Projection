#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_OPENALLOCATIONINFO2.ahk" { D3DDDI_OPENALLOCATIONINFO2 }
#Import ".\D3DDDI_OPENALLOCATIONINFO.ahk" { D3DDDI_OPENALLOCATIONINFO }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OPENRESOURCE {
    #StructPack 8

    hDevice : UInt32

    hGlobalShare : UInt32

    NumAllocations : UInt32

    pOpenAllocationInfo : D3DDDI_OPENALLOCATIONINFO.Ptr

    pPrivateRuntimeData : IntPtr

    PrivateRuntimeDataSize : UInt32

    pResourcePrivateDriverData : IntPtr

    ResourcePrivateDriverDataSize : UInt32

    pTotalPrivateDriverDataBuffer : IntPtr

    TotalPrivateDriverDataBufferSize : UInt32

    hResource : UInt32

    static __New() {
        DefineProp(this.Prototype, 'pOpenAllocationInfo2', { type: D3DDDI_OPENALLOCATIONINFO2.Ptr, offset: 16 })
        this.DeleteProp("__New")
    }
}
