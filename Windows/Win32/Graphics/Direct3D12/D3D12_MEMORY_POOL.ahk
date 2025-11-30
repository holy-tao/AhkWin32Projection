#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the memory pool for the heap.
 * @remarks
 * 
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_heap_properties">D3D12_HEAP_PROPERTIES</a> structure.
 *       
 * 
 * When the adapter is UMA, D3D12_MEMORY_POOL_L0 and DXGI_MEMORY_SEGMENT_GROUP_LOCAL refer to the same memory.
 * 
 * When
 * 
 *  the adapter is not UMA:
 * D3D12_MEMORY_POOL_L0 and DXGI_MEMORY_SEGMENT_GROUP_NON_LOCAL refer to the same memory.
 * D3D12_MEMORY_POOL_L1 and DXGI_MEMORY_SEGMENT_GROUP_LOCAL refer to the same memory.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_memory_pool
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_MEMORY_POOL extends Win32Enum{

    /**
     * The memory pool is unknown.
     * @type {Integer (Int32)}
     */
    static D3D12_MEMORY_POOL_UNKNOWN => 0

    /**
     * The memory pool is L0.
     *             L0 is the physical system memory pool.
     *             When the adapter is discrete/NUMA, this pool has greater bandwidth for the CPU and less bandwidth for the GPU.
     *             When the adapter is UMA, this pool is the only one which is valid.
     * @type {Integer (Int32)}
     */
    static D3D12_MEMORY_POOL_L0 => 1

    /**
     * The memory pool is L1.
     *             L1 is typically known as the physical video memory pool.
     *             L1 is only available when the adapter is discrete/NUMA, and has greater bandwidth for the GPU and cannot even be accessed by the CPU.
     *             When the adapter is UMA, this pool is not available.
     * @type {Integer (Int32)}
     */
    static D3D12_MEMORY_POOL_L1 => 2
}
