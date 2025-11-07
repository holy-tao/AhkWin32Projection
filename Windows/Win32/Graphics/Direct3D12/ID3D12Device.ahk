#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNodeCount", "CreateCommandQueue", "CreateCommandAllocator", "CreateGraphicsPipelineState", "CreateComputePipelineState", "CreateCommandList", "CheckFeatureSupport", "CreateDescriptorHeap", "GetDescriptorHandleIncrementSize", "CreateRootSignature", "CreateConstantBufferView", "CreateShaderResourceView", "CreateUnorderedAccessView", "CreateRenderTargetView", "CreateDepthStencilView", "CreateSampler", "CopyDescriptors", "CopyDescriptorsSimple", "GetResourceAllocationInfo", "GetCustomHeapProperties", "CreateCommittedResource", "CreateHeap", "CreatePlacedResource", "CreateReservedResource", "CreateSharedHandle", "OpenSharedHandle", "OpenSharedHandleByName", "MakeResident", "Evict", "CreateFence", "GetDeviceRemovedReason", "GetCopyableFootprints", "CreateQueryHeap", "SetStablePowerState", "CreateCommandSignature", "GetResourceTiling", "GetAdapterLuid"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-getnodecount
     */
    GetNodeCount() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_COMMAND_QUEUE_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createcommandqueue
     */
    CreateCommandQueue(pDesc, riid) {
        result := ComCall(8, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppCommandQueue := 0, "HRESULT")
        return ppCommandQueue
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createcommandallocator
     */
    CreateCommandAllocator(type, riid) {
        result := ComCall(9, this, "int", type, "ptr", riid, "ptr*", &ppCommandAllocator := 0, "HRESULT")
        return ppCommandAllocator
    }

    /**
     * 
     * @param {Pointer<D3D12_GRAPHICS_PIPELINE_STATE_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-creategraphicspipelinestate
     */
    CreateGraphicsPipelineState(pDesc, riid) {
        result := ComCall(10, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppPipelineState := 0, "HRESULT")
        return ppPipelineState
    }

    /**
     * 
     * @param {Pointer<D3D12_COMPUTE_PIPELINE_STATE_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createcomputepipelinestate
     */
    CreateComputePipelineState(pDesc, riid) {
        result := ComCall(11, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppPipelineState := 0, "HRESULT")
        return ppPipelineState
    }

    /**
     * 
     * @param {Integer} nodeMask 
     * @param {Integer} type 
     * @param {ID3D12CommandAllocator} pCommandAllocator 
     * @param {ID3D12PipelineState} pInitialState 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createcommandlist
     */
    CreateCommandList(nodeMask, type, pCommandAllocator, pInitialState, riid) {
        result := ComCall(12, this, "uint", nodeMask, "int", type, "ptr", pCommandAllocator, "ptr", pInitialState, "ptr", riid, "ptr*", &ppCommandList := 0, "HRESULT")
        return ppCommandList
    }

    /**
     * 
     * @param {Integer} Feature 
     * @param {Pointer} pFeatureSupportData 
     * @param {Integer} FeatureSupportDataSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-checkfeaturesupport
     */
    CheckFeatureSupport(Feature, pFeatureSupportData, FeatureSupportDataSize) {
        result := ComCall(13, this, "int", Feature, "ptr", pFeatureSupportData, "uint", FeatureSupportDataSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_DESCRIPTOR_HEAP_DESC>} pDescriptorHeapDesc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createdescriptorheap
     */
    CreateDescriptorHeap(pDescriptorHeapDesc, riid) {
        result := ComCall(14, this, "ptr", pDescriptorHeapDesc, "ptr", riid, "ptr*", &ppvHeap := 0, "HRESULT")
        return ppvHeap
    }

    /**
     * 
     * @param {Integer} DescriptorHeapType 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-getdescriptorhandleincrementsize
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
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createrootsignature
     */
    CreateRootSignature(nodeMask, pBlobWithRootSignature, blobLengthInBytes, riid) {
        pBlobWithRootSignatureMarshal := pBlobWithRootSignature is VarRef ? "ptr" : "ptr"

        result := ComCall(16, this, "uint", nodeMask, pBlobWithRootSignatureMarshal, pBlobWithRootSignature, "ptr", blobLengthInBytes, "ptr", riid, "ptr*", &ppvRootSignature := 0, "HRESULT")
        return ppvRootSignature
    }

    /**
     * 
     * @param {Pointer<D3D12_CONSTANT_BUFFER_VIEW_DESC>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createconstantbufferview
     */
    CreateConstantBufferView(pDesc, DestDescriptor) {
        ComCall(17, this, "ptr", pDesc, "ptr", DestDescriptor)
    }

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @param {Pointer<D3D12_SHADER_RESOURCE_VIEW_DESC>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createshaderresourceview
     */
    CreateShaderResourceView(pResource, pDesc, DestDescriptor) {
        ComCall(18, this, "ptr", pResource, "ptr", pDesc, "ptr", DestDescriptor)
    }

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @param {ID3D12Resource} pCounterResource 
     * @param {Pointer<D3D12_UNORDERED_ACCESS_VIEW_DESC>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createunorderedaccessview
     */
    CreateUnorderedAccessView(pResource, pCounterResource, pDesc, DestDescriptor) {
        ComCall(19, this, "ptr", pResource, "ptr", pCounterResource, "ptr", pDesc, "ptr", DestDescriptor)
    }

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @param {Pointer<D3D12_RENDER_TARGET_VIEW_DESC>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createrendertargetview
     */
    CreateRenderTargetView(pResource, pDesc, DestDescriptor) {
        ComCall(20, this, "ptr", pResource, "ptr", pDesc, "ptr", DestDescriptor)
    }

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @param {Pointer<D3D12_DEPTH_STENCIL_VIEW_DESC>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createdepthstencilview
     */
    CreateDepthStencilView(pResource, pDesc, DestDescriptor) {
        ComCall(21, this, "ptr", pResource, "ptr", pDesc, "ptr", DestDescriptor)
    }

    /**
     * 
     * @param {Pointer<D3D12_SAMPLER_DESC>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createsampler
     */
    CreateSampler(pDesc, DestDescriptor) {
        ComCall(22, this, "ptr", pDesc, "ptr", DestDescriptor)
    }

    /**
     * 
     * @param {Integer} NumDestDescriptorRanges 
     * @param {Pointer<D3D12_CPU_DESCRIPTOR_HANDLE>} pDestDescriptorRangeStarts 
     * @param {Pointer<Integer>} pDestDescriptorRangeSizes 
     * @param {Integer} NumSrcDescriptorRanges 
     * @param {Pointer<D3D12_CPU_DESCRIPTOR_HANDLE>} pSrcDescriptorRangeStarts 
     * @param {Pointer<Integer>} pSrcDescriptorRangeSizes 
     * @param {Integer} DescriptorHeapsType 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-copydescriptors
     */
    CopyDescriptors(NumDestDescriptorRanges, pDestDescriptorRangeStarts, pDestDescriptorRangeSizes, NumSrcDescriptorRanges, pSrcDescriptorRangeStarts, pSrcDescriptorRangeSizes, DescriptorHeapsType) {
        pDestDescriptorRangeSizesMarshal := pDestDescriptorRangeSizes is VarRef ? "uint*" : "ptr"
        pSrcDescriptorRangeSizesMarshal := pSrcDescriptorRangeSizes is VarRef ? "uint*" : "ptr"

        ComCall(23, this, "uint", NumDestDescriptorRanges, "ptr", pDestDescriptorRangeStarts, pDestDescriptorRangeSizesMarshal, pDestDescriptorRangeSizes, "uint", NumSrcDescriptorRanges, "ptr", pSrcDescriptorRangeStarts, pSrcDescriptorRangeSizesMarshal, pSrcDescriptorRangeSizes, "int", DescriptorHeapsType)
    }

    /**
     * 
     * @param {Integer} NumDescriptors 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptorRangeStart 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} SrcDescriptorRangeStart 
     * @param {Integer} DescriptorHeapsType 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-copydescriptorssimple
     */
    CopyDescriptorsSimple(NumDescriptors, DestDescriptorRangeStart, SrcDescriptorRangeStart, DescriptorHeapsType) {
        ComCall(24, this, "uint", NumDescriptors, "ptr", DestDescriptorRangeStart, "ptr", SrcDescriptorRangeStart, "int", DescriptorHeapsType)
    }

    /**
     * 
     * @param {Integer} visibleMask 
     * @param {Integer} numResourceDescs 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pResourceDescs 
     * @returns {D3D12_RESOURCE_ALLOCATION_INFO} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-getresourceallocationinfo
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-getcustomheapproperties
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
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createcommittedresource
     */
    CreateCommittedResource(pHeapProperties, HeapFlags, pDesc, InitialResourceState, pOptimizedClearValue, riidResource) {
        result := ComCall(27, this, "ptr", pHeapProperties, "int", HeapFlags, "ptr", pDesc, "int", InitialResourceState, "ptr", pOptimizedClearValue, "ptr", riidResource, "ptr*", &ppvResource := 0, "HRESULT")
        return ppvResource
    }

    /**
     * 
     * @param {Pointer<D3D12_HEAP_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createheap
     */
    CreateHeap(pDesc, riid) {
        result := ComCall(28, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppvHeap := 0, "HRESULT")
        return ppvHeap
    }

    /**
     * 
     * @param {ID3D12Heap} pHeap 
     * @param {Integer} HeapOffset 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pDesc 
     * @param {Integer} InitialState 
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createplacedresource
     */
    CreatePlacedResource(pHeap, HeapOffset, pDesc, InitialState, pOptimizedClearValue, riid) {
        result := ComCall(29, this, "ptr", pHeap, "uint", HeapOffset, "ptr", pDesc, "int", InitialState, "ptr", pOptimizedClearValue, "ptr", riid, "ptr*", &ppvResource := 0, "HRESULT")
        return ppvResource
    }

    /**
     * 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pDesc 
     * @param {Integer} InitialState 
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createreservedresource
     */
    CreateReservedResource(pDesc, InitialState, pOptimizedClearValue, riid) {
        result := ComCall(30, this, "ptr", pDesc, "int", InitialState, "ptr", pOptimizedClearValue, "ptr", riid, "ptr*", &ppvResource := 0, "HRESULT")
        return ppvResource
    }

    /**
     * 
     * @param {ID3D12DeviceChild} pObject 
     * @param {Pointer<SECURITY_ATTRIBUTES>} pAttributes 
     * @param {Integer} Access 
     * @param {PWSTR} Name 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createsharedhandle
     */
    CreateSharedHandle(pObject, pAttributes, Access, Name) {
        Name := Name is String ? StrPtr(Name) : Name

        pHandle := HANDLE()
        result := ComCall(31, this, "ptr", pObject, "ptr", pAttributes, "uint", Access, "ptr", Name, "ptr", pHandle, "HRESULT")
        return pHandle
    }

    /**
     * 
     * @param {HANDLE} NTHandle 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-opensharedhandle
     */
    OpenSharedHandle(NTHandle, riid) {
        NTHandle := NTHandle is Win32Handle ? NumGet(NTHandle, "ptr") : NTHandle

        result := ComCall(32, this, "ptr", NTHandle, "ptr", riid, "ptr*", &ppvObj := 0, "HRESULT")
        return ppvObj
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @param {Integer} Access 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-opensharedhandlebyname
     */
    OpenSharedHandleByName(Name, Access) {
        Name := Name is String ? StrPtr(Name) : Name

        pNTHandle := HANDLE()
        result := ComCall(33, this, "ptr", Name, "uint", Access, "ptr", pNTHandle, "HRESULT")
        return pNTHandle
    }

    /**
     * 
     * @param {Integer} NumObjects 
     * @param {Pointer<ID3D12Pageable>} ppObjects 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-makeresident
     */
    MakeResident(NumObjects, ppObjects) {
        result := ComCall(34, this, "uint", NumObjects, "ptr*", ppObjects, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NumObjects 
     * @param {Pointer<ID3D12Pageable>} ppObjects 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-evict
     */
    Evict(NumObjects, ppObjects) {
        result := ComCall(35, this, "uint", NumObjects, "ptr*", ppObjects, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} InitialValue 
     * @param {Integer} Flags 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createfence
     */
    CreateFence(InitialValue, Flags, riid) {
        result := ComCall(36, this, "uint", InitialValue, "int", Flags, "ptr", riid, "ptr*", &ppFence := 0, "HRESULT")
        return ppFence
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-getdeviceremovedreason
     */
    GetDeviceRemovedReason() {
        result := ComCall(37, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pResourceDesc 
     * @param {Integer} FirstSubresource 
     * @param {Integer} NumSubresources 
     * @param {Integer} BaseOffset 
     * @param {Pointer<D3D12_PLACED_SUBRESOURCE_FOOTPRINT>} pLayouts 
     * @param {Pointer<Integer>} pNumRows 
     * @param {Pointer<Integer>} pRowSizeInBytes 
     * @param {Pointer<Integer>} pTotalBytes 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-getcopyablefootprints
     */
    GetCopyableFootprints(pResourceDesc, FirstSubresource, NumSubresources, BaseOffset, pLayouts, pNumRows, pRowSizeInBytes, pTotalBytes) {
        pNumRowsMarshal := pNumRows is VarRef ? "uint*" : "ptr"
        pRowSizeInBytesMarshal := pRowSizeInBytes is VarRef ? "uint*" : "ptr"
        pTotalBytesMarshal := pTotalBytes is VarRef ? "uint*" : "ptr"

        ComCall(38, this, "ptr", pResourceDesc, "uint", FirstSubresource, "uint", NumSubresources, "uint", BaseOffset, "ptr", pLayouts, pNumRowsMarshal, pNumRows, pRowSizeInBytesMarshal, pRowSizeInBytes, pTotalBytesMarshal, pTotalBytes)
    }

    /**
     * 
     * @param {Pointer<D3D12_QUERY_HEAP_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createqueryheap
     */
    CreateQueryHeap(pDesc, riid) {
        result := ComCall(39, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppvHeap := 0, "HRESULT")
        return ppvHeap
    }

    /**
     * 
     * @param {BOOL} Enable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-setstablepowerstate
     */
    SetStablePowerState(Enable) {
        result := ComCall(40, this, "int", Enable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_COMMAND_SIGNATURE_DESC>} pDesc 
     * @param {ID3D12RootSignature} pRootSignature 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createcommandsignature
     */
    CreateCommandSignature(pDesc, pRootSignature, riid) {
        result := ComCall(41, this, "ptr", pDesc, "ptr", pRootSignature, "ptr", riid, "ptr*", &ppvCommandSignature := 0, "HRESULT")
        return ppvCommandSignature
    }

    /**
     * 
     * @param {ID3D12Resource} pTiledResource 
     * @param {Pointer<Integer>} pNumTilesForEntireResource 
     * @param {Pointer<D3D12_PACKED_MIP_INFO>} pPackedMipDesc 
     * @param {Pointer<D3D12_TILE_SHAPE>} pStandardTileShapeForNonPackedMips 
     * @param {Pointer<Integer>} pNumSubresourceTilings 
     * @param {Integer} FirstSubresourceTilingToGet 
     * @param {Pointer<D3D12_SUBRESOURCE_TILING>} pSubresourceTilingsForNonPackedMips 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-getresourcetiling
     */
    GetResourceTiling(pTiledResource, pNumTilesForEntireResource, pPackedMipDesc, pStandardTileShapeForNonPackedMips, pNumSubresourceTilings, FirstSubresourceTilingToGet, pSubresourceTilingsForNonPackedMips) {
        pNumTilesForEntireResourceMarshal := pNumTilesForEntireResource is VarRef ? "uint*" : "ptr"
        pNumSubresourceTilingsMarshal := pNumSubresourceTilings is VarRef ? "uint*" : "ptr"

        ComCall(42, this, "ptr", pTiledResource, pNumTilesForEntireResourceMarshal, pNumTilesForEntireResource, "ptr", pPackedMipDesc, "ptr", pStandardTileShapeForNonPackedMips, pNumSubresourceTilingsMarshal, pNumSubresourceTilings, "uint", FirstSubresourceTilingToGet, "ptr", pSubresourceTilingsForNonPackedMips)
    }

    /**
     * 
     * @returns {LUID} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-getadapterluid
     */
    GetAdapterLuid() {
        result := ComCall(43, this, "ptr")
        return result
    }
}
