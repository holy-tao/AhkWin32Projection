#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12Fence.ahk" { ID3D12Fence }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3D12_RESIDENCY_FLAGS.ahk" { D3D12_RESIDENCY_FLAGS }
#Import ".\ID3D12Device2.ahk" { ID3D12Device2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D12Pageable.ahk" { ID3D12Pageable }

/**
 * Represents a virtual adapter. This interface extends ID3D12Device2 to support the creation of special-purpose diagnostic heaps in system memory that persist even in the event of a GPU-fault or device-removed scenario.
 * @remarks
 * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12createdevice">D3D12CreateDevice</a> to create a device.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device3
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Device3 extends ID3D12Device2 {
    /**
     * The interface identifier for ID3D12Device3
     * @type {Guid}
     */
    static IID := Guid("{81dadc15-2bad-4392-93c5-101345c4aa98}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Device3 interfaces
    */
    struct Vtbl extends ID3D12Device2.Vtbl {
        OpenExistingHeapFromAddress     : IntPtr
        OpenExistingHeapFromFileMapping : IntPtr
        EnqueueMakeResident             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Device3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a special-purpose diagnostic heap in system memory from an address. The created heap can persist even in the event of a GPU-fault or device-removed scenario.
     * @remarks
     * The heap is created in system memory and permits CPU access. It wraps the entire VirtualAlloc region.
     * 
     * Heaps can be used for placed and reserved resources, as orthogonally as other heaps. Restrictions may still exist based on the flags that cannot be app-chosen.
     * @param {Pointer<Void>} pAddress Type: <b>const void*</b>
     * 
     * The address used to create the heap.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the heap interface (<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12heap">ID3D12Heap</a>).
     * 
     * The <b>REFIID</b>, or <b>GUID</b>, of the interface to the heap can be obtained by using the <b>__uuidof()</b> macro. For example, <b>__uuidof(ID3D12Heap)</b> will retrieve the <b>GUID</b> of the interface to a heap.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015&preserve-view=true">SAL</a>: <c>_COM_Outptr_</c>
     * 
     * A pointer to a memory block. On success, the D3D12 runtime will write a pointer to the newly-opened heap into the memory block. The type of the pointer depends on the provided <b>riid</b> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device3-openexistingheapfromaddress
     */
    OpenExistingHeapFromAddress(pAddress, riid) {
        pAddressMarshal := pAddress is VarRef ? "ptr" : "ptr"

        result := ComCall(48, this, pAddressMarshal, pAddress, Guid.Ptr, riid, "ptr*", &ppvHeap := 0, "HRESULT")
        return ppvHeap
    }

    /**
     * Creates a special-purpose diagnostic heap in system memory from a file mapping object. The created heap can persist even in the event of a GPU-fault or device-removed scenario.
     * @remarks
     * The heap is created in system memory, and it permits CPU access. It wraps the entire VirtualAlloc region.
     * 
     * Heaps can be used for placed and reserved resources, as orthogonally as other heaps. Restrictions may still exist based on the flags that cannot be app-chosen.
     * @param {HANDLE} hFileMapping Type: **[HANDLE](/windows/win32/winprog/windows-data-types)**
     * 
     * The handle to the file mapping object to use to create the heap.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * The globally unique identifier (**GUID**) for the heap interface (<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12heap">ID3D12Heap</a>).
     * 
     * The **REFIID**, or **GUID**, of the interface to the heap can be obtained by using the **__uuidof()** macro. For example, **__uuidof(ID3D12Heap)** will retrieve the **GUID** of the interface to a heap.
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015&preserve-view=true">SAL</a>: <c>_COM_Outptr_</c>
     * 
     * A pointer to a memory block. On success, the D3D12 runtime will write a pointer to the newly-opened heap into the memory block. The type of the pointer depends on the provided **riid** parameter.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device3-openexistingheapfromfilemapping
     */
    OpenExistingHeapFromFileMapping(hFileMapping, riid) {
        result := ComCall(49, this, HANDLE, hFileMapping, Guid.Ptr, riid, "ptr*", &ppvHeap := 0, "HRESULT")
        return ppvHeap
    }

    /**
     * Asynchronously makes objects resident for the device.
     * @remarks
     * <b>EnqueueMakeResident</b> performs the same actions as <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-makeresident">MakeResident</a>, but does not wait for the resources to be made resident. Instead, <b>EnqueueMakeResident</b> signals a fence when the work is done. 
     * 
     * The system will not allow work that references the resources that are being made resident by using <b>EnqueueMakeResident</b> before its fence is signaled. Instead, calls to this API are guaranteed to signal their corresponding fence in order, so the same fence can be used from call to call.
     * @param {D3D12_RESIDENCY_FLAGS} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_residency_flags">D3D12_RESIDENCY_FLAGS</a></b>
     * 
     * Controls whether the objects should be made resident if the application is over its memory budget.
     * @param {Integer} NumObjects Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of objects  in the <i>ppObjects</i> array to make resident for the device.
     * @param {Pointer<ID3D12Pageable>} ppObjects Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pageable">ID3D12Pageable</a>*</b>
     * 
     * A pointer to a memory block; contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pageable">ID3D12Pageable</a> interface pointers for the objects.
     *           
     * 
     * Even though most D3D12 objects inherit from <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pageable">ID3D12Pageable</a>, residency changes are only supported on the following: 
     * 
     * <ul>
     * <li>descriptor heaps</li>
     * <li>heaps</li>
     * <li>committed resources</li>
     * <li>query heaps</li>
     * </ul>
     * @param {ID3D12Fence} pFenceToSignal Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12fence">ID3D12Fence</a>*</b>
     * 
     * A pointer to the fence used to signal when the work is done.
     * @param {Integer} FenceValueToSignal Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * An unsigned 64-bit value signaled to the fence when the work is done.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device3-enqueuemakeresident
     */
    EnqueueMakeResident(Flags, NumObjects, ppObjects, pFenceToSignal, FenceValueToSignal) {
        result := ComCall(50, this, D3D12_RESIDENCY_FLAGS, Flags, "uint", NumObjects, ID3D12Pageable.Ptr, ppObjects, "ptr", pFenceToSignal, "uint", FenceValueToSignal, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D12Device3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OpenExistingHeapFromAddress := CallbackCreate(GetMethod(implObj, "OpenExistingHeapFromAddress"), flags, 4)
        this.vtbl.OpenExistingHeapFromFileMapping := CallbackCreate(GetMethod(implObj, "OpenExistingHeapFromFileMapping"), flags, 4)
        this.vtbl.EnqueueMakeResident := CallbackCreate(GetMethod(implObj, "EnqueueMakeResident"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OpenExistingHeapFromAddress)
        CallbackFree(this.vtbl.OpenExistingHeapFromFileMapping)
        CallbackFree(this.vtbl.EnqueueMakeResident)
    }
}
