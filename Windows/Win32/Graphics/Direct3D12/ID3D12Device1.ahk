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
     * 
     * @param {Pointer<Void>} pLibraryBlob 
     * @param {Pointer} BlobLength 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppPipelineLibrary 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device1-createpipelinelibrary
     */
    CreatePipelineLibrary(pLibraryBlob, BlobLength, riid, ppPipelineLibrary) {
        pLibraryBlobMarshal := pLibraryBlob is VarRef ? "ptr" : "ptr"
        ppPipelineLibraryMarshal := ppPipelineLibrary is VarRef ? "ptr*" : "ptr"

        result := ComCall(44, this, pLibraryBlobMarshal, pLibraryBlob, "ptr", BlobLength, "ptr", riid, ppPipelineLibraryMarshal, ppPipelineLibrary, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Fence>} ppFences 
     * @param {Pointer<Integer>} pFenceValues 
     * @param {Integer} NumFences 
     * @param {Integer} Flags 
     * @param {HANDLE} hEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device1-seteventonmultiplefencecompletion
     */
    SetEventOnMultipleFenceCompletion(ppFences, pFenceValues, NumFences, Flags, hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        pFenceValuesMarshal := pFenceValues is VarRef ? "uint*" : "ptr"

        result := ComCall(45, this, "ptr*", ppFences, pFenceValuesMarshal, pFenceValues, "uint", NumFences, "int", Flags, "ptr", hEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NumObjects 
     * @param {Pointer<ID3D12Pageable>} ppObjects 
     * @param {Pointer<Integer>} pPriorities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device1-setresidencypriority
     */
    SetResidencyPriority(NumObjects, ppObjects, pPriorities) {
        pPrioritiesMarshal := pPriorities is VarRef ? "int*" : "ptr"

        result := ComCall(46, this, "uint", NumObjects, "ptr*", ppObjects, pPrioritiesMarshal, pPriorities, "HRESULT")
        return result
    }
}
