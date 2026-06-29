#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_DESCRIPTOR_RANGE1.ahk" { D3D12_DESCRIPTOR_RANGE1 }

/**
 * Describes the root signature 1.1 layout of a descriptor table as a collection of descriptor ranges that are all relative to a single base descriptor handle.
 * @remarks
 * Samplers are not allowed in the same descriptor table as constant-buffer views (CBVs), unordered-access views (UAVs), and shader-resource views (SRVs).
 *       
 * 
 * <b>D3D12_ROOT_DESCRIPTOR_TABLE1</b> is the data type of the
 *        <b>DescriptorTable</b> member of
 *         <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_parameter1">D3D12_ROOT_PARAMETER1</a>.
 *         Use a
 *         <b>D3D12_ROOT_DESCRIPTOR_TABLE1</b> when you set <b>D3D12_ROOT_PARAMETER1</b>'s <b>SlotType</b> member to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_root_parameter_type">D3D12_ROOT_PARAMETER_TYPE_DESCRIPTOR_TABLE</a>.
 *       
 * 
 * Refer to the helper structure <a href="https://docs.microsoft.com/windows/desktop/direct3d12/cd3dx12-root-descriptor-table1">CD3DX12_ROOT_DESCRIPTOR_TABLE1</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_root_descriptor_table1
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_ROOT_DESCRIPTOR_TABLE1 {
    #StructPack 8

    /**
     * The number of descriptor ranges in the table layout.
     */
    NumDescriptorRanges : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_descriptor_range1">D3D12_DESCRIPTOR_RANGE1</a> structures that describe the descriptor ranges.
     */
    pDescriptorRanges : D3D12_DESCRIPTOR_RANGE1.Ptr

}
