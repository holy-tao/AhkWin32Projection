#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_ALLOCATIONRESIDENCYSTATUS.ahk" { D3DKMT_ALLOCATIONRESIDENCYSTATUS }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYALLOCATIONRESIDENCY {
    #StructPack 8

    hDevice : UInt32

    hResource : UInt32

    phAllocationList : IntPtr

    AllocationCount : UInt32

    pResidencyStatus : D3DKMT_ALLOCATIONRESIDENCYSTATUS.Ptr

}
