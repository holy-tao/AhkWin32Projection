#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_RESIDENCY_PRIORITY.ahk" { D3D12_RESIDENCY_PRIORITY }
#Import ".\D3D12_MULTIPLE_FENCE_WAIT_FLAGS.ahk" { D3D12_MULTIPLE_FENCE_WAIT_FLAGS }
#Import ".\ID3D12Fence.ahk" { ID3D12Fence }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D12Device.ahk" { ID3D12Device }
#Import ".\ID3D12Pageable.ahk" { ID3D12Pageable }

/**
 * Represents a virtual adapter, and expands on the range of methods provided by ID3D12Device.
 * @remarks
 * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12createdevice">D3D12CreateDevice</a> to create a device.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device1
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Device1 extends ID3D12Device {
    /**
     * The interface identifier for ID3D12Device1
     * @type {Guid}
     */
    static IID := Guid("{77acce80-638e-4e65-8895-c1f23386863e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Device1 interfaces
    */
    struct Vtbl extends ID3D12Device.Vtbl {
        CreatePipelineLibrary             : IntPtr
        SetEventOnMultipleFenceCompletion : IntPtr
        SetResidencyPriority              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Device1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a cached pipeline library.
     * @remarks
     * A pipeline library enables the following operations.
     * 
     * - Adding pipeline state objects (PSOs) to an existing library object (refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12pipelinelibrary-storepipeline">StorePipeline</a>).
     * - Serializing a PSO library into a contiguous block of memory for disk storage (refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12pipelinelibrary-serialize">Serialize</a>).
     * - De-serializing a PSO library from persistent storage (this is handled by <b>CreatePipelineLibrary</b>).
     * - Retrieving individual PSOs from the library (refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12pipelinelibrary-loadcomputepipeline">LoadComputePipeline</a> and <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12pipelinelibrary-loadgraphicspipeline">LoadGraphicsPipeline</a>).
     * 
     * At no point in the lifecycle of a pipeline library is there duplication between PSOs with identical sub-components. 
     * 
     * A recommended solution for managing the lifetime of the provided pointer while only having to ref-count the returned interface is to leverage <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12object-setprivatedatainterface">ID3D12Object::SetPrivateDataInterface</a>, and use an object which implements <b>IUnknown</b>, and frees the memory when the ref-count reaches 0.
     * @param {Pointer<Void>} pLibraryBlob Type: [in] **const void\***
     * 
     * If the input library blob is empty, then the initial content of the library is empty. If the input library blob is not empty, then it is validated for integrity, parsed, and the pointer is stored. The pointer provided as input to this method must remain valid for the lifetime of the object returned. For efficiency reasons, the data is not copied.
     * @param {Pointer} BlobLength Type: **[SIZE_T](/windows/win32/winprog/windows-data-types)**
     * 
     * Specifies the length of *pLibraryBlob* in bytes.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * Specifies a unique REFIID for the [ID3D12PipelineLibrary](./nn-d3d12-id3d12pipelinelibrary.md) object. Typically set this and the following parameter with the macro `IID_PPV_ARGS(&Library)`, where **Library** is the name of the object.
     * @returns {Pointer<Void>} Type: [out] **void\*\***
     * 
     * Returns a pointer to the created library.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device1-createpipelinelibrary
     */
    CreatePipelineLibrary(pLibraryBlob, BlobLength, riid) {
        pLibraryBlobMarshal := pLibraryBlob is VarRef ? "ptr" : "ptr"

        result := ComCall(44, this, pLibraryBlobMarshal, pLibraryBlob, "ptr", BlobLength, Guid.Ptr, riid, "ptr*", &ppPipelineLibrary := 0, "HRESULT")
        return ppPipelineLibrary
    }

    /**
     * Specifies an event that should be fired when one or more of a collection of fences reach specific values.
     * @remarks
     * To specify a single fence refer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12fence-seteventoncompletion">SetEventOnCompletion</a> method.
     * 
     * If *hEvent* is a null handle, then this API will not return until the specified fence value(s) have been reached.
     * @param {Pointer<ID3D12Fence>} ppFences Type: <b>ID3D12Fence*</b>
     * 
     * An array of length <i>NumFences</i> that specifies the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12fence">ID3D12Fence</a> objects.
     * @param {Pointer<Integer>} pFenceValues Type: <b>const UINT64*</b>
     * 
     * An array of length <i>NumFences</i> that specifies the fence values required for the event is to be signaled.
     * @param {Integer} NumFences Type: <b>UINT</b>
     * 
     * Specifies the number of fences to be included.
     * @param {D3D12_MULTIPLE_FENCE_WAIT_FLAGS} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_multiple_fence_wait_flags">D3D12_MULTIPLE_FENCE_WAIT_FLAGS</a></b>
     * 
     * Specifies one  of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_multiple_fence_wait_flags">D3D12_MULTIPLE_FENCE_WAIT_FLAGS</a> that determines how to proceed.
     * @param {HANDLE} hEvent Type: <b>HANDLE</b>
     * 
     * A handle to the event object.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device1-seteventonmultiplefencecompletion
     */
    SetEventOnMultipleFenceCompletion(ppFences, pFenceValues, NumFences, Flags, hEvent) {
        pFenceValuesMarshal := pFenceValues is VarRef ? "uint*" : "ptr"

        result := ComCall(45, this, ID3D12Fence.Ptr, ppFences, pFenceValuesMarshal, pFenceValues, "uint", NumFences, D3D12_MULTIPLE_FENCE_WAIT_FLAGS, Flags, HANDLE, hEvent, "HRESULT")
        return result
    }

    /**
     * This method sets residency priorities of a specified list of objects.
     * @remarks
     * For more information, refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/residency">Residency</a>.
     * @param {Integer} NumObjects Type: <b>UINT</b>
     * 
     * Specifies the number of objects in the <i>ppObjects</i> and <i>pPriorities</i> arrays.
     * @param {Pointer<ID3D12Pageable>} ppObjects Type: <b>ID3D12Pageable*</b>
     * 
     * Specifies an array, of length <i>NumObjects</i>, containing references to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pageable">ID3D12Pageable</a> objects.
     * @param {Pointer<D3D12_RESIDENCY_PRIORITY>} pPriorities Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_residency_priority">D3D12_RESIDENCY_PRIORITY</a>*</b>
     * 
     * Specifies an array, of length <i>NumObjects</i>, of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_residency_priority">D3D12_RESIDENCY_PRIORITY</a> values for the list of objects.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device1-setresidencypriority
     */
    SetResidencyPriority(NumObjects, ppObjects, pPriorities) {
        pPrioritiesMarshal := pPriorities is VarRef ? "int*" : "ptr"

        result := ComCall(46, this, "uint", NumObjects, ID3D12Pageable.Ptr, ppObjects, pPrioritiesMarshal, pPriorities, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D12Device1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreatePipelineLibrary := CallbackCreate(GetMethod(implObj, "CreatePipelineLibrary"), flags, 5)
        this.vtbl.SetEventOnMultipleFenceCompletion := CallbackCreate(GetMethod(implObj, "SetEventOnMultipleFenceCompletion"), flags, 6)
        this.vtbl.SetResidencyPriority := CallbackCreate(GetMethod(implObj, "SetResidencyPriority"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreatePipelineLibrary)
        CallbackFree(this.vtbl.SetEventOnMultipleFenceCompletion)
        CallbackFree(this.vtbl.SetResidencyPriority)
    }
}
