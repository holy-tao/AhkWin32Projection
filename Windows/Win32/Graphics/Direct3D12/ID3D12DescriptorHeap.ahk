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
     * 
     * @returns {D3D12_DESCRIPTOR_HEAP_DESC} 
     */
    GetDesc() {
        result := ComCall(8, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {D3D12_CPU_DESCRIPTOR_HANDLE} 
     */
    GetCPUDescriptorHandleForHeapStart() {
        result := ComCall(9, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {D3D12_GPU_DESCRIPTOR_HANDLE} 
     */
    GetGPUDescriptorHandleForHeapStart() {
        result := ComCall(10, this, "ptr")
        return result
    }
}
