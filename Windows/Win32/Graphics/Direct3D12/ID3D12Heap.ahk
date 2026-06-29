#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_HEAP_DESC.ahk" { D3D12_HEAP_DESC }
#Import ".\ID3D12Pageable.ahk" { ID3D12Pageable }

/**
 * A heap is an abstraction of contiguous memory allocation, used to manage physical memory. This heap can be used with ID3D12Resource objects to support placed resources or reserved resources.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12heap
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Heap extends ID3D12Pageable {
    /**
     * The interface identifier for ID3D12Heap
     * @type {Guid}
     */
    static IID := Guid("{6b3b2502-6e51-45b3-90ee-9884265e8df3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Heap interfaces
    */
    struct Vtbl extends ID3D12Pageable.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Heap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the heap description.
     * @returns {D3D12_HEAP_DESC} This method has no parameters.
     * 
     * 
     * Type: **[**D3D12\_HEAP\_DESC**](/windows/desktop/api/d3d12/ns-d3d12-d3d12_heap_desc)**
     * 
     * Returns the [**D3D12\_HEAP\_DESC**](/windows/desktop/api/d3d12/ns-d3d12-d3d12_heap_desc) structure that describes the heap.
     * @see https://learn.microsoft.com/windows/win32/direct3d12/id3d12heap-getdesc
     */
    GetDesc() {
        result := ComCall(8, this, D3D12_HEAP_DESC)
        return result
    }

    Query(iid) {
        if (ID3D12Heap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc)
    }
}
