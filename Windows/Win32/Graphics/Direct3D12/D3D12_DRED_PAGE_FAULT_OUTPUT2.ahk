#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_DRED_ALLOCATION_NODE1.ahk" { D3D12_DRED_ALLOCATION_NODE1 }
#Import ".\D3D12_DRED_PAGE_FAULT_FLAGS.ahk" { D3D12_DRED_PAGE_FAULT_FLAGS }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DRED_PAGE_FAULT_OUTPUT2 {
    #StructPack 8

    PageFaultVA : Int64

    pHeadExistingAllocationNode : D3D12_DRED_ALLOCATION_NODE1.Ptr

    pHeadRecentFreedAllocationNode : D3D12_DRED_ALLOCATION_NODE1.Ptr

    PageFaultFlags : D3D12_DRED_PAGE_FAULT_FLAGS

}
