#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device3.ahk

/**
 * Represents a virtual adapter. This interface extends [ID3D12Device3](../d3d12/nn-d3d12-id3d12device3.md).
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12device4
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device4 extends ID3D12Device3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Device4
     * @type {Guid}
     */
    static IID => Guid("{e865df17-a9ee-46f9-a463-3098315aa2e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 51

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCommandList1", "CreateProtectedResourceSession", "CreateCommittedResource1", "CreateHeap1", "CreateReservedResource1", "GetResourceAllocationInfo1"]

    /**
     * 
     * @param {Integer} nodeMask 
     * @param {Integer} type 
     * @param {Integer} flags 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppCommandList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device4-createcommandlist1
     */
    CreateCommandList1(nodeMask, type, flags, riid, ppCommandList) {
        ppCommandListMarshal := ppCommandList is VarRef ? "ptr*" : "ptr"

        result := ComCall(51, this, "uint", nodeMask, "int", type, "int", flags, "ptr", riid, ppCommandListMarshal, ppCommandList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_PROTECTED_RESOURCE_SESSION_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device4-createprotectedresourcesession
     */
    CreateProtectedResourceSession(pDesc, riid, ppSession) {
        ppSessionMarshal := ppSession is VarRef ? "ptr*" : "ptr"

        result := ComCall(52, this, "ptr", pDesc, "ptr", riid, ppSessionMarshal, ppSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_HEAP_PROPERTIES>} pHeapProperties 
     * @param {Integer} HeapFlags 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pDesc 
     * @param {Integer} InitialResourceState 
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue 
     * @param {ID3D12ProtectedResourceSession} pProtectedSession 
     * @param {Pointer<Guid>} riidResource 
     * @param {Pointer<Pointer<Void>>} ppvResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device4-createcommittedresource1
     */
    CreateCommittedResource1(pHeapProperties, HeapFlags, pDesc, InitialResourceState, pOptimizedClearValue, pProtectedSession, riidResource, ppvResource) {
        ppvResourceMarshal := ppvResource is VarRef ? "ptr*" : "ptr"

        result := ComCall(53, this, "ptr", pHeapProperties, "int", HeapFlags, "ptr", pDesc, "int", InitialResourceState, "ptr", pOptimizedClearValue, "ptr", pProtectedSession, "ptr", riidResource, ppvResourceMarshal, ppvResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_HEAP_DESC>} pDesc 
     * @param {ID3D12ProtectedResourceSession} pProtectedSession 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvHeap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device4-createheap1
     */
    CreateHeap1(pDesc, pProtectedSession, riid, ppvHeap) {
        ppvHeapMarshal := ppvHeap is VarRef ? "ptr*" : "ptr"

        result := ComCall(54, this, "ptr", pDesc, "ptr", pProtectedSession, "ptr", riid, ppvHeapMarshal, ppvHeap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pDesc 
     * @param {Integer} InitialState 
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue 
     * @param {ID3D12ProtectedResourceSession} pProtectedSession 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device4-createreservedresource1
     */
    CreateReservedResource1(pDesc, InitialState, pOptimizedClearValue, pProtectedSession, riid, ppvResource) {
        ppvResourceMarshal := ppvResource is VarRef ? "ptr*" : "ptr"

        result := ComCall(55, this, "ptr", pDesc, "int", InitialState, "ptr", pOptimizedClearValue, "ptr", pProtectedSession, "ptr", riid, ppvResourceMarshal, ppvResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} visibleMask 
     * @param {Integer} numResourceDescs 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pResourceDescs 
     * @param {Pointer<D3D12_RESOURCE_ALLOCATION_INFO1>} pResourceAllocationInfo1 
     * @returns {D3D12_RESOURCE_ALLOCATION_INFO} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device4-getresourceallocationinfo1
     */
    GetResourceAllocationInfo1(visibleMask, numResourceDescs, pResourceDescs, pResourceAllocationInfo1) {
        result := ComCall(56, this, "uint", visibleMask, "uint", numResourceDescs, "ptr", pResourceDescs, "ptr", pResourceAllocationInfo1, "ptr")
        return result
    }
}
