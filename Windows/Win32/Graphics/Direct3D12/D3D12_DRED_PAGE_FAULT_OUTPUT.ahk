#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_DRED_ALLOCATION_NODE.ahk" { D3D12_DRED_ALLOCATION_NODE }

/**
 * Describes allocation data related to a GPU page fault on a given virtual address (VA).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_dred_page_fault_output
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DRED_PAGE_FAULT_OUTPUT {
    #StructPack 8

    /**
     * A [D3D12_GPU_VIRTUAL_ADDRESS](/windows/desktop/direct3d12/d3d12_gpu_virtual_address) containing the GPU virtual address (VA) of the faulting operation if device removal was due to a GPU page fault.
     */
    PageFaultVA : Int64

    /**
     * A pointer to a constant [D3D12_DRED_ALLOCATION_NODE](ns-d3d12-d3d12_dred_allocation_node.md) object representing the head of a linked list of allocation nodes for active allocated runtime objects with virtual address (VA) ranges that match the faulting VA (`PageFaultVA`). Has a value of `nullptr` if the list is empty.
     */
    pHeadExistingAllocationNode : D3D12_DRED_ALLOCATION_NODE.Ptr

    /**
     * A pointer to a constant [D3D12_DRED_ALLOCATION_NODE](ns-d3d12-d3d12_dred_allocation_node.md) object representing the head of a linked list of allocation nodes for recently freed runtime objects with virtual address (VA) ranges that match the faulting VA (`PageFaultVA`). Has a value of `nullptr` if the list is empty.
     */
    pHeadRecentFreedAllocationNode : D3D12_DRED_ALLOCATION_NODE.Ptr

}
