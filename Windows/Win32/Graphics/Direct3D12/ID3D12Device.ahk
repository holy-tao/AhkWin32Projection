#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Object.ahk

/**
 * Represents a virtual adapter; it is used to create command allocators, command lists, command queues, fences, resources, pipeline state objects, heaps, root signatures, samplers, and many resource views.
 * @remarks
 * 
  * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12createdevice">D3D12CreateDevice</a> to create a device. 
  * 
  * For Windows 10 Anniversary some additional functionality is available through <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12device1">ID3D12Device1</a>.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12device
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device extends ID3D12Object{
    /**
     * The interface identifier for ID3D12Device
     * @type {Guid}
     */
    static IID => Guid("{189819f1-1db6-4b57-be54-1821339b85f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @returns {Integer} 
     */
    GetNodeCount() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_COMMAND_QUEUE_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppCommandQueue 
     * @returns {HRESULT} 
     */
    CreateCommandQueue(pDesc, riid, ppCommandQueue) {
        result := ComCall(8, this, "ptr", pDesc, "ptr", riid, "ptr", ppCommandQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppCommandAllocator 
     * @returns {HRESULT} 
     */
    CreateCommandAllocator(type, riid, ppCommandAllocator) {
        result := ComCall(9, this, "int", type, "ptr", riid, "ptr", ppCommandAllocator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_GRAPHICS_PIPELINE_STATE_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppPipelineState 
     * @returns {HRESULT} 
     */
    CreateGraphicsPipelineState(pDesc, riid, ppPipelineState) {
        result := ComCall(10, this, "ptr", pDesc, "ptr", riid, "ptr", ppPipelineState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPUTE_PIPELINE_STATE_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppPipelineState 
     * @returns {HRESULT} 
     */
    CreateComputePipelineState(pDesc, riid, ppPipelineState) {
        result := ComCall(11, this, "ptr", pDesc, "ptr", riid, "ptr", ppPipelineState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nodeMask 
     * @param {Integer} type 
     * @param {Pointer<ID3D12CommandAllocator>} pCommandAllocator 
     * @param {Pointer<ID3D12PipelineState>} pInitialState 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppCommandList 
     * @returns {HRESULT} 
     */
    CreateCommandList(nodeMask, type, pCommandAllocator, pInitialState, riid, ppCommandList) {
        result := ComCall(12, this, "uint", nodeMask, "int", type, "ptr", pCommandAllocator, "ptr", pInitialState, "ptr", riid, "ptr", ppCommandList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Feature 
     * @param {Pointer} pFeatureSupportData 
     * @param {Integer} FeatureSupportDataSize 
     * @returns {HRESULT} 
     */
    CheckFeatureSupport(Feature, pFeatureSupportData, FeatureSupportDataSize) {
        result := ComCall(13, this, "int", Feature, "ptr", pFeatureSupportData, "uint", FeatureSupportDataSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_DESCRIPTOR_HEAP_DESC>} pDescriptorHeapDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvHeap 
     * @returns {HRESULT} 
     */
    CreateDescriptorHeap(pDescriptorHeapDesc, riid, ppvHeap) {
        result := ComCall(14, this, "ptr", pDescriptorHeapDesc, "ptr", riid, "ptr", ppvHeap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DescriptorHeapType 
     * @returns {Integer} 
     */
    GetDescriptorHandleIncrementSize(DescriptorHeapType) {
        result := ComCall(15, this, "int", DescriptorHeapType, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} nodeMask 
     * @param {Pointer<Void>} pBlobWithRootSignature 
     * @param {Pointer} blobLengthInBytes 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvRootSignature 
     * @returns {HRESULT} 
     */
    CreateRootSignature(nodeMask, pBlobWithRootSignature, blobLengthInBytes, riid, ppvRootSignature) {
        result := ComCall(16, this, "uint", nodeMask, "ptr", pBlobWithRootSignature, "ptr", blobLengthInBytes, "ptr", riid, "ptr", ppvRootSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_CONSTANT_BUFFER_VIEW_DESC>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {String} Nothing - always returns an empty string
     */
    CreateConstantBufferView(pDesc, DestDescriptor) {
        ComCall(17, this, "ptr", pDesc, "ptr", DestDescriptor)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pResource 
     * @param {Pointer<D3D12_SHADER_RESOURCE_VIEW_DESC>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {String} Nothing - always returns an empty string
     */
    CreateShaderResourceView(pResource, pDesc, DestDescriptor) {
        ComCall(18, this, "ptr", pResource, "ptr", pDesc, "ptr", DestDescriptor)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pResource 
     * @param {Pointer<ID3D12Resource>} pCounterResource 
     * @param {Pointer<D3D12_UNORDERED_ACCESS_VIEW_DESC>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {String} Nothing - always returns an empty string
     */
    CreateUnorderedAccessView(pResource, pCounterResource, pDesc, DestDescriptor) {
        ComCall(19, this, "ptr", pResource, "ptr", pCounterResource, "ptr", pDesc, "ptr", DestDescriptor)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pResource 
     * @param {Pointer<D3D12_RENDER_TARGET_VIEW_DESC>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {String} Nothing - always returns an empty string
     */
    CreateRenderTargetView(pResource, pDesc, DestDescriptor) {
        ComCall(20, this, "ptr", pResource, "ptr", pDesc, "ptr", DestDescriptor)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pResource 
     * @param {Pointer<D3D12_DEPTH_STENCIL_VIEW_DESC>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {String} Nothing - always returns an empty string
     */
    CreateDepthStencilView(pResource, pDesc, DestDescriptor) {
        ComCall(21, this, "ptr", pResource, "ptr", pDesc, "ptr", DestDescriptor)
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_SAMPLER_DESC>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {String} Nothing - always returns an empty string
     */
    CreateSampler(pDesc, DestDescriptor) {
        ComCall(22, this, "ptr", pDesc, "ptr", DestDescriptor)
        return result
    }

    /**
     * 
     * @param {Integer} NumDestDescriptorRanges 
     * @param {Pointer<D3D12_CPU_DESCRIPTOR_HANDLE>} pDestDescriptorRangeStarts 
     * @param {Pointer<UInt32>} pDestDescriptorRangeSizes 
     * @param {Integer} NumSrcDescriptorRanges 
     * @param {Pointer<D3D12_CPU_DESCRIPTOR_HANDLE>} pSrcDescriptorRangeStarts 
     * @param {Pointer<UInt32>} pSrcDescriptorRangeSizes 
     * @param {Integer} DescriptorHeapsType 
     * @returns {String} Nothing - always returns an empty string
     */
    CopyDescriptors(NumDestDescriptorRanges, pDestDescriptorRangeStarts, pDestDescriptorRangeSizes, NumSrcDescriptorRanges, pSrcDescriptorRangeStarts, pSrcDescriptorRangeSizes, DescriptorHeapsType) {
        ComCall(23, this, "uint", NumDestDescriptorRanges, "ptr", pDestDescriptorRangeStarts, "uint*", pDestDescriptorRangeSizes, "uint", NumSrcDescriptorRanges, "ptr", pSrcDescriptorRangeStarts, "uint*", pSrcDescriptorRangeSizes, "int", DescriptorHeapsType)
        return result
    }

    /**
     * 
     * @param {Integer} NumDescriptors 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptorRangeStart 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} SrcDescriptorRangeStart 
     * @param {Integer} DescriptorHeapsType 
     * @returns {String} Nothing - always returns an empty string
     */
    CopyDescriptorsSimple(NumDescriptors, DestDescriptorRangeStart, SrcDescriptorRangeStart, DescriptorHeapsType) {
        ComCall(24, this, "uint", NumDescriptors, "ptr", DestDescriptorRangeStart, "ptr", SrcDescriptorRangeStart, "int", DescriptorHeapsType)
        return result
    }

    /**
     * 
     * @param {Integer} visibleMask 
     * @param {Integer} numResourceDescs 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pResourceDescs 
     * @returns {D3D12_RESOURCE_ALLOCATION_INFO} 
     */
    GetResourceAllocationInfo(visibleMask, numResourceDescs, pResourceDescs) {
        result := ComCall(25, this, "uint", visibleMask, "uint", numResourceDescs, "ptr", pResourceDescs, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} nodeMask 
     * @param {Integer} heapType 
     * @returns {D3D12_HEAP_PROPERTIES} 
     */
    GetCustomHeapProperties(nodeMask, heapType) {
        result := ComCall(26, this, "uint", nodeMask, "int", heapType, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_HEAP_PROPERTIES>} pHeapProperties 
     * @param {Integer} HeapFlags 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pDesc 
     * @param {Integer} InitialResourceState 
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue 
     * @param {Pointer<Guid>} riidResource 
     * @param {Pointer<Void>} ppvResource 
     * @returns {HRESULT} 
     */
    CreateCommittedResource(pHeapProperties, HeapFlags, pDesc, InitialResourceState, pOptimizedClearValue, riidResource, ppvResource) {
        result := ComCall(27, this, "ptr", pHeapProperties, "int", HeapFlags, "ptr", pDesc, "int", InitialResourceState, "ptr", pOptimizedClearValue, "ptr", riidResource, "ptr", ppvResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_HEAP_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvHeap 
     * @returns {HRESULT} 
     */
    CreateHeap(pDesc, riid, ppvHeap) {
        result := ComCall(28, this, "ptr", pDesc, "ptr", riid, "ptr", ppvHeap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Heap>} pHeap 
     * @param {Integer} HeapOffset 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pDesc 
     * @param {Integer} InitialState 
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvResource 
     * @returns {HRESULT} 
     */
    CreatePlacedResource(pHeap, HeapOffset, pDesc, InitialState, pOptimizedClearValue, riid, ppvResource) {
        result := ComCall(29, this, "ptr", pHeap, "uint", HeapOffset, "ptr", pDesc, "int", InitialState, "ptr", pOptimizedClearValue, "ptr", riid, "ptr", ppvResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pDesc 
     * @param {Integer} InitialState 
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvResource 
     * @returns {HRESULT} 
     */
    CreateReservedResource(pDesc, InitialState, pOptimizedClearValue, riid, ppvResource) {
        result := ComCall(30, this, "ptr", pDesc, "int", InitialState, "ptr", pOptimizedClearValue, "ptr", riid, "ptr", ppvResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12DeviceChild>} pObject 
     * @param {Pointer<SECURITY_ATTRIBUTES>} pAttributes 
     * @param {Integer} Access 
     * @param {PWSTR} Name 
     * @param {Pointer<HANDLE>} pHandle 
     * @returns {HRESULT} 
     */
    CreateSharedHandle(pObject, pAttributes, Access, Name, pHandle) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(31, this, "ptr", pObject, "ptr", pAttributes, "uint", Access, "ptr", Name, "ptr", pHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} NTHandle 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvObj 
     * @returns {HRESULT} 
     */
    OpenSharedHandle(NTHandle, riid, ppvObj) {
        NTHandle := NTHandle is Win32Handle ? NumGet(NTHandle, "ptr") : NTHandle

        result := ComCall(32, this, "ptr", NTHandle, "ptr", riid, "ptr", ppvObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @param {Integer} Access 
     * @param {Pointer<HANDLE>} pNTHandle 
     * @returns {HRESULT} 
     */
    OpenSharedHandleByName(Name, Access, pNTHandle) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(33, this, "ptr", Name, "uint", Access, "ptr", pNTHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NumObjects 
     * @param {Pointer<ID3D12Pageable>} ppObjects 
     * @returns {HRESULT} 
     */
    MakeResident(NumObjects, ppObjects) {
        result := ComCall(34, this, "uint", NumObjects, "ptr", ppObjects, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NumObjects 
     * @param {Pointer<ID3D12Pageable>} ppObjects 
     * @returns {HRESULT} 
     */
    Evict(NumObjects, ppObjects) {
        result := ComCall(35, this, "uint", NumObjects, "ptr", ppObjects, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} InitialValue 
     * @param {Integer} Flags 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppFence 
     * @returns {HRESULT} 
     */
    CreateFence(InitialValue, Flags, riid, ppFence) {
        result := ComCall(36, this, "uint", InitialValue, "int", Flags, "ptr", riid, "ptr", ppFence, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetDeviceRemovedReason() {
        result := ComCall(37, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pResourceDesc 
     * @param {Integer} FirstSubresource 
     * @param {Integer} NumSubresources 
     * @param {Integer} BaseOffset 
     * @param {Pointer<D3D12_PLACED_SUBRESOURCE_FOOTPRINT>} pLayouts 
     * @param {Pointer<UInt32>} pNumRows 
     * @param {Pointer<UInt64>} pRowSizeInBytes 
     * @param {Pointer<UInt64>} pTotalBytes 
     * @returns {String} Nothing - always returns an empty string
     */
    GetCopyableFootprints(pResourceDesc, FirstSubresource, NumSubresources, BaseOffset, pLayouts, pNumRows, pRowSizeInBytes, pTotalBytes) {
        ComCall(38, this, "ptr", pResourceDesc, "uint", FirstSubresource, "uint", NumSubresources, "uint", BaseOffset, "ptr", pLayouts, "uint*", pNumRows, "uint*", pRowSizeInBytes, "uint*", pTotalBytes)
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_QUERY_HEAP_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvHeap 
     * @returns {HRESULT} 
     */
    CreateQueryHeap(pDesc, riid, ppvHeap) {
        result := ComCall(39, this, "ptr", pDesc, "ptr", riid, "ptr", ppvHeap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} Enable 
     * @returns {HRESULT} 
     */
    SetStablePowerState(Enable) {
        result := ComCall(40, this, "int", Enable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_COMMAND_SIGNATURE_DESC>} pDesc 
     * @param {Pointer<ID3D12RootSignature>} pRootSignature 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvCommandSignature 
     * @returns {HRESULT} 
     */
    CreateCommandSignature(pDesc, pRootSignature, riid, ppvCommandSignature) {
        result := ComCall(41, this, "ptr", pDesc, "ptr", pRootSignature, "ptr", riid, "ptr", ppvCommandSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pTiledResource 
     * @param {Pointer<UInt32>} pNumTilesForEntireResource 
     * @param {Pointer<D3D12_PACKED_MIP_INFO>} pPackedMipDesc 
     * @param {Pointer<D3D12_TILE_SHAPE>} pStandardTileShapeForNonPackedMips 
     * @param {Pointer<UInt32>} pNumSubresourceTilings 
     * @param {Integer} FirstSubresourceTilingToGet 
     * @param {Pointer<D3D12_SUBRESOURCE_TILING>} pSubresourceTilingsForNonPackedMips 
     * @returns {String} Nothing - always returns an empty string
     */
    GetResourceTiling(pTiledResource, pNumTilesForEntireResource, pPackedMipDesc, pStandardTileShapeForNonPackedMips, pNumSubresourceTilings, FirstSubresourceTilingToGet, pSubresourceTilingsForNonPackedMips) {
        ComCall(42, this, "ptr", pTiledResource, "uint*", pNumTilesForEntireResource, "ptr", pPackedMipDesc, "ptr", pStandardTileShapeForNonPackedMips, "uint*", pNumSubresourceTilings, "uint", FirstSubresourceTilingToGet, "ptr", pSubresourceTilingsForNonPackedMips)
        return result
    }

    /**
     * 
     * @returns {LUID} 
     */
    GetAdapterLuid() {
        result := ComCall(43, this, "ptr")
        return result
    }
}
