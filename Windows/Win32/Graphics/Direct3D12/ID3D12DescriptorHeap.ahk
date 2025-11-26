#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Pageable.ahk

/**
 * A descriptor heap is a collection of contiguous allocations of descriptors, one allocation for every descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12descriptorheap
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DescriptorHeap extends ID3D12Pageable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12DescriptorHeap
     * @type {Guid}
     */
    static IID => Guid("{8efb471d-616c-4f49-90f7-127bb763fa51}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "GetCPUDescriptorHandleForHeapStart", "GetGPUDescriptorHandleForHeapStart"]

    /**
     * Gets the descriptor heap description.
     * @returns {D3D12_DESCRIPTOR_HEAP_DESC} Type: <b><a href="/windows/desktop/api/d3d12/ns-d3d12-d3d12_descriptor_heap_desc">D3D12_DESCRIPTOR_HEAP_DESC</a></b>
     * 
     * The description of the descriptor heap, as a <a href="/windows/desktop/api/d3d12/ns-d3d12-d3d12_descriptor_heap_desc">D3D12_DESCRIPTOR_HEAP_DESC</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12descriptorheap-getdesc
     */
    GetDesc() {
        result := ComCall(8, this, "ptr")
        return result
    }

    /**
     * Gets the CPU descriptor handle that represents the start of the heap.
     * @returns {D3D12_CPU_DESCRIPTOR_HANDLE} Type: <b><a href="/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a></b>
     * 
     * Returns the CPU descriptor handle that represents the start of the heap.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12descriptorheap-getcpudescriptorhandleforheapstart
     */
    GetCPUDescriptorHandleForHeapStart() {
        result := ComCall(9, this, "ptr")
        return result
    }

    /**
     * Gets the GPU descriptor handle that represents the start of the heap.
     * @returns {D3D12_GPU_DESCRIPTOR_HANDLE} Type: <b><a href="/windows/desktop/api/d3d12/ns-d3d12-d3d12_gpu_descriptor_handle">D3D12_GPU_DESCRIPTOR_HANDLE</a></b>
     * 
     * Returns the GPU descriptor handle that represents the start of the heap.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12descriptorheap-getgpudescriptorhandleforheapstart
     */
    GetGPUDescriptorHandleForHeapStart() {
        result := ComCall(10, this, "ptr")
        return result
    }
}
