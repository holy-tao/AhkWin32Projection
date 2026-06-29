#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_DESCRIPTOR_HEAP_TYPE.ahk" { D3D12_DESCRIPTOR_HEAP_TYPE }
#Import ".\D3D12_DESCRIPTOR_HEAP_FLAGS.ahk" { D3D12_DESCRIPTOR_HEAP_FLAGS }

/**
 * Describes the descriptor heap.
 * @remarks
 * This structure is used by the following:
 *         
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12descriptorheap-getdesc">ID3D12DescriptorHeap::GetDesc</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createdescriptorheap">ID3D12Device::CreateDescriptorHeap</a>
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_descriptor_heap_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DESCRIPTOR_HEAP_DESC {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_descriptor_heap_type">D3D12_DESCRIPTOR_HEAP_TYPE</a>-typed value that specifies the types of descriptors in the heap.
     */
    Type : D3D12_DESCRIPTOR_HEAP_TYPE

    /**
     * The number of descriptors in the heap.
     */
    NumDescriptors : UInt32

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_descriptor_heap_flags">D3D12_DESCRIPTOR_HEAP_FLAGS</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies options for the heap.
     */
    Flags : D3D12_DESCRIPTOR_HEAP_FLAGS

    /**
     * For single-adapter operation, set this to zero.
     *             If there are multiple adapter nodes, set a bit to identify the node (one of the device's physical adapters) to which the descriptor heap applies.
     *             Each bit in the mask corresponds to a single node.
     *             Only one bit must be set.
     *             See <a href="https://docs.microsoft.com/windows/win32/direct3d12/multi-engine">Multi-adapter systems</a>.
     */
    NodeMask : UInt32

}
