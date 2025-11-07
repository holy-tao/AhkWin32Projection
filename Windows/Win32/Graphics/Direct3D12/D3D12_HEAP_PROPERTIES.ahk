#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes heap properties.
 * @remarks
 * 
 * This structure is used by the following:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_heap_desc">D3D12_HEAP_DESC</a> structure
 *           </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12resource-getheapproperties">ID3D12Resource::GetHeapProperties</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-getcustomheapproperties">ID3D12Device::GetCustomHeapProperties</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createcommittedresource">ID3D12Device::CreateCommittedResource</a>
 * </li>
 * </ul>
 * Valid combinations of struct member values:
 * 
 * <ul>
 * <li>When <b>Type</b> is <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_heap_type">D3D12_HEAP_TYPE</a>_CUSTOM,
 *             <b>CPUPageProperty</b> and <b>MemoryPoolPreference</b> must not be ..._UNKNOWN.
 *           </li>
 * <li>When <b>Type</b> is not D3D12_HEAP_TYPE_CUSTOM,
 *             <b>CPUPageProperty</b> and <b>MemoryPoolPreference</b> must be ..._UNKNOWN.
 *           </li>
 * <li>When using D3D12_HEAP_TYPE_CUSTOM and <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_memory_pool">D3D12_MEMORY_POOL</a>_L1, on NUMA adapters,
 *             <b>CPUPageProperty</b> must be <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_cpu_page_property">D3D12_CPU_PAGE_PROPERTY</a>_NOT_AVAILABLE.
 *             To differentiate NUMA from UMA adapters, see
 *             <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a>_ARCHITECTURE and
 *             <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_architecture">D3D12_FEATURE_DATA_ARCHITECTURE</a>.
 *           </li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_heap_properties
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_HEAP_PROPERTIES extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_heap_type">D3D12_HEAP_TYPE</a>-typed value that specifies the type of heap.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_cpu_page_property">D3D12_CPU_PAGE_PROPERTY</a>-typed value that specifies the CPU-page properties for the heap.
     * @type {Integer}
     */
    CPUPageProperty {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_memory_pool">D3D12_MEMORY_POOL</a>-typed value that specifies the memory pool for the heap.
     * @type {Integer}
     */
    MemoryPoolPreference {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * For multi-adapter operation, this indicates the node where the resource should be created.
     * 
     * Exactly one bit of this UINT must be set. See <a href="https://docs.microsoft.com/windows/win32/direct3d12/multi-engine">Multi-adapter systems</a>.
     * 
     * Passing zero is equivalent to passing one, in order to simplify the usage of single-GPU adapters.
     * @type {Integer}
     */
    CreationNodeMask {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * For multi-adapter operation, this indicates the set of nodes where the resource is visible.
     * 
     * <i>VisibleNodeMask</i> must have the same bit set that is set in <i>CreationNodeMask</i>. <i>VisibleNodeMask</i> can *also* have additional bits set for cross-node resources, but doing so can potentially reduce performance for resource accesses, so you should do so only when needed.
     * 
     * Passing zero is equivalent to passing one, in order to simplify the usage of single-GPU adapters.
     * @type {Integer}
     */
    VisibleNodeMask {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
