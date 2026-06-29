#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_CPU_DESCRIPTOR_HANDLE.ahk" { D3D12_CPU_DESCRIPTOR_HANDLE }
#Import ".\D3D12_GPU_DESCRIPTOR_HANDLE.ahk" { D3D12_GPU_DESCRIPTOR_HANDLE }
#Import ".\D3D12_DESCRIPTOR_HEAP_DESC.ahk" { D3D12_DESCRIPTOR_HEAP_DESC }
#Import ".\ID3D12Pageable.ahk" { ID3D12Pageable }

/**
 * A descriptor heap is a collection of contiguous allocations of descriptors, one allocation for every descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12descriptorheap
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DescriptorHeap extends ID3D12Pageable {
    /**
     * The interface identifier for ID3D12DescriptorHeap
     * @type {Guid}
     */
    static IID := Guid("{8efb471d-616c-4f49-90f7-127bb763fa51}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DescriptorHeap interfaces
    */
    struct Vtbl extends ID3D12Pageable.Vtbl {
        GetDesc                            : IntPtr
        GetCPUDescriptorHandleForHeapStart : IntPtr
        GetGPUDescriptorHandleForHeapStart : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DescriptorHeap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the descriptor heap description.
     * @returns {D3D12_DESCRIPTOR_HEAP_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_descriptor_heap_desc">D3D12_DESCRIPTOR_HEAP_DESC</a></b>
     * 
     * The description of the descriptor heap, as a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_descriptor_heap_desc">D3D12_DESCRIPTOR_HEAP_DESC</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12descriptorheap-getdesc
     */
    GetDesc() {
        result := ComCall(8, this, D3D12_DESCRIPTOR_HEAP_DESC)
        return result
    }

    /**
     * Gets the CPU descriptor handle that represents the start of the heap.
     * @returns {D3D12_CPU_DESCRIPTOR_HANDLE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a></b>
     * 
     * Returns the CPU descriptor handle that represents the start of the heap.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12descriptorheap-getcpudescriptorhandleforheapstart
     */
    GetCPUDescriptorHandleForHeapStart() {
        result := ComCall(9, this, D3D12_CPU_DESCRIPTOR_HANDLE)
        return result
    }

    /**
     * Gets the GPU descriptor handle that represents the start of the heap.
     * @returns {D3D12_GPU_DESCRIPTOR_HANDLE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_gpu_descriptor_handle">D3D12_GPU_DESCRIPTOR_HANDLE</a></b>
     * 
     * Returns the GPU descriptor handle that represents the start of the heap. If the descriptor heap is not shader-visible, a null handle is returned.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12descriptorheap-getgpudescriptorhandleforheapstart
     */
    GetGPUDescriptorHandleForHeapStart() {
        result := ComCall(10, this, D3D12_GPU_DESCRIPTOR_HANDLE)
        return result
    }

    Query(iid) {
        if (ID3D12DescriptorHeap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 1)
        this.vtbl.GetCPUDescriptorHandleForHeapStart := CallbackCreate(GetMethod(implObj, "GetCPUDescriptorHandleForHeapStart"), flags, 1)
        this.vtbl.GetGPUDescriptorHandleForHeapStart := CallbackCreate(GetMethod(implObj, "GetGPUDescriptorHandleForHeapStart"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc)
        CallbackFree(this.vtbl.GetCPUDescriptorHandleForHeapStart)
        CallbackFree(this.vtbl.GetGPUDescriptorHandleForHeapStart)
    }
}
