#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device7.ahk

/**
 * Represents a virtual adapter. This interface extends [ID3D12Device7](../d3d12/nn-d3d12-id3d12device7.md).
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12device8
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device8 extends ID3D12Device7{
    /**
     * The interface identifier for ID3D12Device8
     * @type {Guid}
     */
    static IID => Guid("{9218e6bb-f944-4f7e-a75c-b1b2c7b701f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 68

    /**
     * 
     * @param {Integer} visibleMask 
     * @param {Integer} numResourceDescs 
     * @param {Pointer<D3D12_RESOURCE_DESC1>} pResourceDescs 
     * @param {Pointer<D3D12_RESOURCE_ALLOCATION_INFO1>} pResourceAllocationInfo1 
     * @returns {D3D12_RESOURCE_ALLOCATION_INFO} 
     */
    GetResourceAllocationInfo2(visibleMask, numResourceDescs, pResourceDescs, pResourceAllocationInfo1) {
        result := ComCall(68, this, "uint", visibleMask, "uint", numResourceDescs, "ptr", pResourceDescs, "ptr", pResourceAllocationInfo1, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_HEAP_PROPERTIES>} pHeapProperties 
     * @param {Integer} HeapFlags 
     * @param {Pointer<D3D12_RESOURCE_DESC1>} pDesc 
     * @param {Integer} InitialResourceState 
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue 
     * @param {Pointer<ID3D12ProtectedResourceSession>} pProtectedSession 
     * @param {Pointer<Guid>} riidResource 
     * @param {Pointer<Void>} ppvResource 
     * @returns {HRESULT} 
     */
    CreateCommittedResource2(pHeapProperties, HeapFlags, pDesc, InitialResourceState, pOptimizedClearValue, pProtectedSession, riidResource, ppvResource) {
        result := ComCall(69, this, "ptr", pHeapProperties, "int", HeapFlags, "ptr", pDesc, "int", InitialResourceState, "ptr", pOptimizedClearValue, "ptr", pProtectedSession, "ptr", riidResource, "ptr", ppvResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Heap>} pHeap 
     * @param {Integer} HeapOffset 
     * @param {Pointer<D3D12_RESOURCE_DESC1>} pDesc 
     * @param {Integer} InitialState 
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvResource 
     * @returns {HRESULT} 
     */
    CreatePlacedResource1(pHeap, HeapOffset, pDesc, InitialState, pOptimizedClearValue, riid, ppvResource) {
        result := ComCall(70, this, "ptr", pHeap, "uint", HeapOffset, "ptr", pDesc, "int", InitialState, "ptr", pOptimizedClearValue, "ptr", riid, "ptr", ppvResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pTargetedResource 
     * @param {Pointer<ID3D12Resource>} pFeedbackResource 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {String} Nothing - always returns an empty string
     */
    CreateSamplerFeedbackUnorderedAccessView(pTargetedResource, pFeedbackResource, DestDescriptor) {
        ComCall(71, this, "ptr", pTargetedResource, "ptr", pFeedbackResource, "ptr", DestDescriptor)
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_RESOURCE_DESC1>} pResourceDesc 
     * @param {Integer} FirstSubresource 
     * @param {Integer} NumSubresources 
     * @param {Integer} BaseOffset 
     * @param {Pointer<D3D12_PLACED_SUBRESOURCE_FOOTPRINT>} pLayouts 
     * @param {Pointer<UInt32>} pNumRows 
     * @param {Pointer<UInt64>} pRowSizeInBytes 
     * @param {Pointer<UInt64>} pTotalBytes 
     * @returns {String} Nothing - always returns an empty string
     */
    GetCopyableFootprints1(pResourceDesc, FirstSubresource, NumSubresources, BaseOffset, pLayouts, pNumRows, pRowSizeInBytes, pTotalBytes) {
        ComCall(72, this, "ptr", pResourceDesc, "uint", FirstSubresource, "uint", NumSubresources, "uint", BaseOffset, "ptr", pLayouts, "uint*", pNumRows, "uint*", pRowSizeInBytes, "uint*", pTotalBytes)
        return result
    }
}
