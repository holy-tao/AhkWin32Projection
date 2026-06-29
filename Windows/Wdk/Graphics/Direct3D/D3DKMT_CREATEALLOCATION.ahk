#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DDDI_ALLOCATIONINFO2.ahk" { D3DDDI_ALLOCATIONINFO2 }
#Import ".\D3DKMT_CREATESTANDARDALLOCATION.ahk" { D3DKMT_CREATESTANDARDALLOCATION }
#Import ".\D3DDDI_ALLOCATIONINFO.ahk" { D3DDDI_ALLOCATIONINFO }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CREATEALLOCATION {
    #StructPack 8

    hDevice : UInt32

    hResource : UInt32

    hGlobalShare : UInt32

    pPrivateRuntimeData : IntPtr

    PrivateRuntimeDataSize : UInt32

    pStandardAllocation : D3DKMT_CREATESTANDARDALLOCATION.Ptr

    PrivateDriverDataSize : UInt32

    NumAllocations : UInt32

    pAllocationInfo : D3DDDI_ALLOCATIONINFO.Ptr

    Flags : IntPtr

    hPrivateRuntimeResourceHandle : HANDLE

    static __New() {
        DefineProp(this.Prototype, 'pPrivateDriverData', { type: IntPtr, offset: 32 })
        DefineProp(this.Prototype, 'pAllocationInfo2', { type: D3DDDI_ALLOCATIONINFO2.Ptr, offset: 48 })
        this.DeleteProp("__New")
    }
}
