#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device9.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device10
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device10 extends ID3D12Device9{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Device10
     * @type {Guid}
     */
    static IID => Guid("{517f8718-aa66-49f9-b02b-a7ab89c06031}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 76

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCommittedResource3", "CreatePlacedResource2", "CreateReservedResource2"]

    /**
     * 
     * @param {Pointer<D3D12_HEAP_PROPERTIES>} pHeapProperties 
     * @param {Integer} HeapFlags 
     * @param {Pointer<D3D12_RESOURCE_DESC1>} pDesc 
     * @param {Integer} InitialLayout 
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue 
     * @param {ID3D12ProtectedResourceSession} pProtectedSession 
     * @param {Integer} NumCastableFormats 
     * @param {Pointer<Integer>} pCastableFormats 
     * @param {Pointer<Guid>} riidResource 
     * @param {Pointer<Pointer<Void>>} ppvResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device10-createcommittedresource3
     */
    CreateCommittedResource3(pHeapProperties, HeapFlags, pDesc, InitialLayout, pOptimizedClearValue, pProtectedSession, NumCastableFormats, pCastableFormats, riidResource, ppvResource) {
        pCastableFormatsMarshal := pCastableFormats is VarRef ? "int*" : "ptr"

        result := ComCall(76, this, "ptr", pHeapProperties, "int", HeapFlags, "ptr", pDesc, "int", InitialLayout, "ptr", pOptimizedClearValue, "ptr", pProtectedSession, "uint", NumCastableFormats, pCastableFormatsMarshal, pCastableFormats, "ptr", riidResource, "ptr*", ppvResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12Heap} pHeap 
     * @param {Integer} HeapOffset 
     * @param {Pointer<D3D12_RESOURCE_DESC1>} pDesc 
     * @param {Integer} InitialLayout 
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue 
     * @param {Integer} NumCastableFormats 
     * @param {Pointer<Integer>} pCastableFormats 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device10-createplacedresource2
     */
    CreatePlacedResource2(pHeap, HeapOffset, pDesc, InitialLayout, pOptimizedClearValue, NumCastableFormats, pCastableFormats, riid, ppvResource) {
        pCastableFormatsMarshal := pCastableFormats is VarRef ? "int*" : "ptr"

        result := ComCall(77, this, "ptr", pHeap, "uint", HeapOffset, "ptr", pDesc, "int", InitialLayout, "ptr", pOptimizedClearValue, "uint", NumCastableFormats, pCastableFormatsMarshal, pCastableFormats, "ptr", riid, "ptr*", ppvResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pDesc 
     * @param {Integer} InitialLayout 
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue 
     * @param {ID3D12ProtectedResourceSession} pProtectedSession 
     * @param {Integer} NumCastableFormats 
     * @param {Pointer<Integer>} pCastableFormats 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device10-createreservedresource2
     */
    CreateReservedResource2(pDesc, InitialLayout, pOptimizedClearValue, pProtectedSession, NumCastableFormats, pCastableFormats, riid, ppvResource) {
        pCastableFormatsMarshal := pCastableFormats is VarRef ? "int*" : "ptr"

        result := ComCall(78, this, "ptr", pDesc, "int", InitialLayout, "ptr", pOptimizedClearValue, "ptr", pProtectedSession, "uint", NumCastableFormats, pCastableFormatsMarshal, pCastableFormats, "ptr", riid, "ptr*", ppvResource, "HRESULT")
        return result
    }
}
