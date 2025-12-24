#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device.ahk

/**
 * Represents a virtual adapter, and expands on the range of methods provided by ID3D12Device.
 * @remarks
 * 
 * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12createdevice">D3D12CreateDevice</a> to create a device.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12device1
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device1 extends ID3D12Device{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Device1
     * @type {Guid}
     */
    static IID => Guid("{77acce80-638e-4e65-8895-c1f23386863e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 44

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePipelineLibrary", "SetEventOnMultipleFenceCompletion", "SetResidencyPriority"]

    /**
     * Creates a cached pipeline library.
     * @param {Pointer<Void>} pLibraryBlob Type: **const void\***
     * 
     * If the input library blob is empty, then the initial content of the library is empty. If the input library blob is not empty, then it is validated for integrity, parsed, and the pointer is stored. The pointer provided as input to this method must remain valid for the lifetime of the object returned. For efficiency reasons, the data is not copied.
     * @param {Pointer} BlobLength Type: **[SIZE_T](/windows/win32/winprog/windows-data-types)**
     * 
     * Specifies the length of *pLibraryBlob* in bytes.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * Specifies a unique REFIID for the [ID3D12PipelineLibrary](./nn-d3d12-id3d12pipelinelibrary.md) object. Typically set this and the following parameter with the macro `IID_PPV_ARGS(&Library)`, where **Library** is the name of the object.
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * Returns a pointer to the created library.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device1-createpipelinelibrary
     */
    CreatePipelineLibrary(pLibraryBlob, BlobLength, riid) {
        pLibraryBlobMarshal := pLibraryBlob is VarRef ? "ptr" : "ptr"

        result := ComCall(44, this, pLibraryBlobMarshal, pLibraryBlob, "ptr", BlobLength, "ptr", riid, "ptr*", &ppPipelineLibrary := 0, "HRESULT")
        return ppPipelineLibrary
    }

    /**
     * Specifies an event that should be fired when one or more of a collection of fences reach specific values.
     * @param {Pointer<ID3D12Fence>} ppFences Type: <b>ID3D12Fence*</b>
     * 
     * An array of length <i>NumFences</i> that specifies the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12fence">ID3D12Fence</a> objects.
     * @param {Pointer<Integer>} pFenceValues Type: <b>const UINT64*</b>
     * 
     * An array of length <i>NumFences</i> that specifies the fence values required for the event is to be signaled.
     * @param {Integer} NumFences Type: <b>UINT</b>
     * 
     * Specifies the number of fences to be included.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_multiple_fence_wait_flags">D3D12_MULTIPLE_FENCE_WAIT_FLAGS</a></b>
     * 
     * Specifies one  of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_multiple_fence_wait_flags">D3D12_MULTIPLE_FENCE_WAIT_FLAGS</a> that determines how to proceed.
     * @param {HANDLE} hEvent Type: <b>HANDLE</b>
     * 
     * A handle to the event object.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device1-seteventonmultiplefencecompletion
     */
    SetEventOnMultipleFenceCompletion(ppFences, pFenceValues, NumFences, Flags, hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        pFenceValuesMarshal := pFenceValues is VarRef ? "uint*" : "ptr"

        result := ComCall(45, this, "ptr*", ppFences, pFenceValuesMarshal, pFenceValues, "uint", NumFences, "int", Flags, "ptr", hEvent, "HRESULT")
        return result
    }

    /**
     * This method sets residency priorities of a specified list of objects.
     * @param {Integer} NumObjects Type: <b>UINT</b>
     * 
     * Specifies the number of objects in the <i>ppObjects</i> and <i>pPriorities</i> arrays.
     * @param {Pointer<ID3D12Pageable>} ppObjects Type: <b>ID3D12Pageable*</b>
     * 
     * Specifies an array, of length <i>NumObjects</i>, containing references to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12pageable">ID3D12Pageable</a> objects.
     * @param {Pointer<Integer>} pPriorities Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_residency_priority">D3D12_RESIDENCY_PRIORITY</a>*</b>
     * 
     * Specifies an array, of length <i>NumObjects</i>, of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_residency_priority">D3D12_RESIDENCY_PRIORITY</a> values for the list of objects.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device1-setresidencypriority
     */
    SetResidencyPriority(NumObjects, ppObjects, pPriorities) {
        pPrioritiesMarshal := pPriorities is VarRef ? "int*" : "ptr"

        result := ComCall(46, this, "uint", NumObjects, "ptr*", ppObjects, pPrioritiesMarshal, pPriorities, "HRESULT")
        return result
    }
}
