#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\D3D12_DRED_ALLOCATION_TYPE.ahk" { D3D12_DRED_ALLOCATION_TYPE }

/**
 * Describes, as a node in a linked list, data about an allocation tracked by Device Removed Extended Data (DRED).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_dred_allocation_node
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DRED_ALLOCATION_NODE {
    #StructPack 8

    /**
     * A pointer to the ANSI debug name of the allocated runtime object.
     */
    ObjectNameA : IntPtr

    /**
     * A pointer to the wide debug name of the allocated runtime object.
     */
    ObjectNameW : PWSTR

    /**
     * A [D3D12_DRED_ALLOCATION_TYPE](ne-d3d12-d3d12_dred_allocation_type.md) value representing the runtime object's allocation type.
     */
    AllocationType : D3D12_DRED_ALLOCATION_TYPE

    /**
     * A pointer to a constant **D3D12_DRED_ALLOCATION_NODE** representing the next allocation node in the list, or `nullptr` if this is the last node.
     */
    pNext : D3D12_DRED_ALLOCATION_NODE.Ptr

}
