#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes allocation data related to a GPU page fault on a given virtual address (VA).
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_dred_page_fault_output
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DRED_PAGE_FAULT_OUTPUT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A [D3D12_GPU_VIRTUAL_ADDRESS](/windows/desktop/direct3d12/d3d12_gpu_virtual_address) containing the GPU virtual address (VA) of the faulting operation if device removal was due to a GPU page fault.
     * @type {Integer}
     */
    PageFaultVA {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a constant [D3D12_DRED_ALLOCATION_NODE](ns-d3d12-d3d12_dred_allocation_node.md) object representing the head of a linked list of allocation nodes for active allocated runtime objects with virtual address (VA) ranges that match the faulting VA (`PageFaultVA`). Has a value of `nullptr` if the list is empty.
     * @type {Pointer<D3D12_DRED_ALLOCATION_NODE>}
     */
    pHeadExistingAllocationNode {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a constant [D3D12_DRED_ALLOCATION_NODE](ns-d3d12-d3d12_dred_allocation_node.md) object representing the head of a linked list of allocation nodes for recently freed runtime objects with virtual address (VA) ranges that match the faulting VA (`PageFaultVA`). Has a value of `nullptr` if the list is empty.
     * @type {Pointer<D3D12_DRED_ALLOCATION_NODE>}
     */
    pHeadRecentFreedAllocationNode {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
