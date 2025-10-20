#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device9.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device10 extends ID3D12Device9{
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
     * 
     * @param {Pointer<D3D12_HEAP_PROPERTIES>} pHeapProperties 
     * @param {Integer} HeapFlags 
     * @param {Pointer<D3D12_RESOURCE_DESC1>} pDesc 
     * @param {Integer} InitialLayout 
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue 
     * @param {Pointer<ID3D12ProtectedResourceSession>} pProtectedSession 
     * @param {Integer} NumCastableFormats 
     * @param {Pointer<Int32>} pCastableFormats 
     * @param {Pointer<Guid>} riidResource 
     * @param {Pointer<Void>} ppvResource 
     * @returns {HRESULT} 
     */
    CreateCommittedResource3(pHeapProperties, HeapFlags, pDesc, InitialLayout, pOptimizedClearValue, pProtectedSession, NumCastableFormats, pCastableFormats, riidResource, ppvResource) {
        result := ComCall(76, this, "ptr", pHeapProperties, "int", HeapFlags, "ptr", pDesc, "int", InitialLayout, "ptr", pOptimizedClearValue, "ptr", pProtectedSession, "uint", NumCastableFormats, "int*", pCastableFormats, "ptr", riidResource, "ptr", ppvResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Heap>} pHeap 
     * @param {Integer} HeapOffset 
     * @param {Pointer<D3D12_RESOURCE_DESC1>} pDesc 
     * @param {Integer} InitialLayout 
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue 
     * @param {Integer} NumCastableFormats 
     * @param {Pointer<Int32>} pCastableFormats 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvResource 
     * @returns {HRESULT} 
     */
    CreatePlacedResource2(pHeap, HeapOffset, pDesc, InitialLayout, pOptimizedClearValue, NumCastableFormats, pCastableFormats, riid, ppvResource) {
        result := ComCall(77, this, "ptr", pHeap, "uint", HeapOffset, "ptr", pDesc, "int", InitialLayout, "ptr", pOptimizedClearValue, "uint", NumCastableFormats, "int*", pCastableFormats, "ptr", riid, "ptr", ppvResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pDesc 
     * @param {Integer} InitialLayout 
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue 
     * @param {Pointer<ID3D12ProtectedResourceSession>} pProtectedSession 
     * @param {Integer} NumCastableFormats 
     * @param {Pointer<Int32>} pCastableFormats 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvResource 
     * @returns {HRESULT} 
     */
    CreateReservedResource2(pDesc, InitialLayout, pOptimizedClearValue, pProtectedSession, NumCastableFormats, pCastableFormats, riid, ppvResource) {
        result := ComCall(78, this, "ptr", pDesc, "int", InitialLayout, "ptr", pOptimizedClearValue, "ptr", pProtectedSession, "uint", NumCastableFormats, "int*", pCastableFormats, "ptr", riid, "ptr", ppvResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
