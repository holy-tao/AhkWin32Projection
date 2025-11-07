#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the descriptor heap.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_descriptor_heap_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DESCRIPTOR_HEAP_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_descriptor_heap_type">D3D12_DESCRIPTOR_HEAP_TYPE</a>-typed value that specifies the types of descriptors in the heap.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The number of descriptors in the heap.
     * @type {Integer}
     */
    NumDescriptors {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_descriptor_heap_flags">D3D12_DESCRIPTOR_HEAP_FLAGS</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies options for the heap.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * For single-adapter operation, set this to zero.
     *             If there are multiple adapter nodes, set a bit to identify the node (one of the device's physical adapters) to which the descriptor heap applies.
     *             Each bit in the mask corresponds to a single node.
     *             Only one bit must be set.
     *             See <a href="https://docs.microsoft.com/windows/win32/direct3d12/multi-engine">Multi-adapter systems</a>.
     * @type {Integer}
     */
    NodeMask {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
