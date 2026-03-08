#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device7.ahk

/**
 * Represents a virtual adapter. This interface extends [ID3D12Device7](../d3d12/nn-d3d12-id3d12device7.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device8
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device8 extends ID3D12Device7{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResourceAllocationInfo2", "CreateCommittedResource2", "CreatePlacedResource1", "CreateSamplerFeedbackUnorderedAccessView", "GetCopyableFootprints1"]

    /**
     * Gets rich info about the size and alignment of memory required for a collection of resources on this adapter. (ID3D12Device8::GetResourceAllocationInfo2)
     * @remarks
     * For remarks, see [ID3D12Device4::GetResourceAllocationInfo1](./nf-d3d12-id3d12device4-getresourceallocationinfo1.md).
     * @param {Integer} visibleMask Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * For single-GPU operation, set this to zero. If there are multiple GPU nodes, then set bits to identify the nodes (the device's physical adapters). Each bit in the mask corresponds to a single node. Also see [Multi-adapter systems](/windows/win32/direct3d12/multi-engine).
     * @param {Integer} numResourceDescs Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * The number of resource descriptors in the *pResourceDescs* array. This is also the size (the number of elements in) *pResourceAllocationInfo1*.
     * @param {Pointer<D3D12_RESOURCE_DESC1>} pResourceDescs Type: **const [D3D12_RESOURCE_DESC1](./ns-d3d12-d3d12_resource_desc1.md)\***
     * 
     * An array of **D3D12_RESOURCE_DESC1** structures that described the resources to get info about.
     * @param {Pointer<D3D12_RESOURCE_ALLOCATION_INFO1>} pResourceAllocationInfo1 Type: **[D3D12_RESOURCE_ALLOCATION_INFO1](./ns-d3d12-d3d12_resource_allocation_info1.md)\***
     * 
     * An array of [D3D12_RESOURCE_ALLOCATION_INFO1](./ns-d3d12-d3d12_resource_allocation_info1.md) structures, containing additional details for each resource description passed as input. This makes it simpler for your application to allocate a heap for multiple resources, and without manually computing offsets for where each resource should be placed.
     * @returns {D3D12_RESOURCE_ALLOCATION_INFO} Type: **[D3D12_RESOURCE_ALLOCATION_INFO](./ns-d3d12-d3d12_resource_allocation_info.md)**
     * 
     * A [D3D12_RESOURCE_ALLOCATION_INFO](./ns-d3d12-d3d12_resource_allocation_info.md) structure that provides info about video memory allocated for the specified array of resources.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device8-getresourceallocationinfo2
     */
    GetResourceAllocationInfo2(visibleMask, numResourceDescs, pResourceDescs, pResourceAllocationInfo1) {
        result := ComCall(68, this, "uint", visibleMask, "uint", numResourceDescs, "ptr", pResourceDescs, "ptr", pResourceAllocationInfo1, "ptr")
        return result
    }

    /**
     * Creates both a resource and an implicit heap (optionally for a protected session), such that the heap is big enough to contain the entire resource, and the resource is mapped to the heap.
     * @remarks
     * This method creates both a resource and a heap, such that the heap is big enough to contain the entire resource, and the resource is mapped to the heap. The created heap is known as an implicit heap, because the heap object can't be obtained by the application. Before releasing the final reference on the resource, your application must ensure that the GPU will no longer read nor write to this resource.
     * 
     * The implicit heap is made resident for GPU access before the method returns control to your application. Also see [Residency](/windows/win32/direct3d12/residency).
     * 
     * The resource GPU VA mapping can't be changed. See [ID3D12CommandQueue::UpdateTileMappings](/windows/win32/api/d3d12/nf-d3d12-id3d12commandqueue-updatetilemappings) and [Volume tiled resources](/windows/win32/direct3d12/volume-tiled-resources).
     * 
     * This method may be called by multiple threads concurrently.
     * @param {Pointer<D3D12_HEAP_PROPERTIES>} pHeapProperties Type: \_In\_ **const [D3D12_HEAP_PROPERTIES](/windows/win32/api/d3d12/ns-d3d12-d3d12_heap_properties)\***
     * 
     * A pointer to a **D3D12_HEAP_PROPERTIES** structure that provides properties for the resource's heap.
     * @param {Integer} HeapFlags Type: **[D3D12_HEAP_FLAGS](/windows/win32/api/d3d12/ne-d3d12-d3d12_heap_flags)**
     * 
     * Heap options, as a bitwise-OR'd combination of **D3D12_HEAP_FLAGS** enumeration constants.
     * @param {Pointer<D3D12_RESOURCE_DESC1>} pDesc Type: **const [D3D12_RESOURCE_DESC1](/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_desc1)\***
     * 
     * A pointer to a **D3D12_RESOURCE_DESC1** structure that describes the resource, including a mip region.
     * @param {Integer} InitialResourceState Type: **[D3D12_RESOURCE_STATES](/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_states)**
     * 
     * The initial state of the resource, as a bitwise-OR'd combination of **D3D12_RESOURCE_STATES** enumeration constants.
     * 
     * When you create a resource together with a [D3D12_HEAP_TYPE_UPLOAD](/windows/win32/api/d3d12/ne-d3d12-d3d12_heap_type) heap, you must set *InitialResourceState* to [D3D12_RESOURCE_STATE_GENERIC_READ](/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_states).
     * 
     * When you create a resource together with a [D3D12_HEAP_TYPE_READBACK](/windows/win32/api/d3d12/ne-d3d12-d3d12_heap_type) heap, you must set *InitialResourceState* to [D3D12_RESOURCE_STATE_COPY_DEST](/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_states).
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue Type: **const [D3D12_CLEAR_VALUE](/windows/win32/api/d3d12/ns-d3d12-d3d12_clear_value)\***
     * 
     * Specifies a **D3D12_CLEAR_VALUE** structure that describes the default value for a clear color.
     * 
     * *pOptimizedClearValue* specifies a value for which clear operations are most optimal. When the created resource is a texture with either the [D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET](/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_flags) or **D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL** flags, you should choose the value with which the clear operation will most commonly be called. You can call the clear operation with other values, but those operations won't be as efficient as when the value matches the one passed in to resource creation.
     * 
     * When you use [D3D12_RESOURCE_DIMENSION_BUFFER](/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_dimension), you must set *pOptimizedClearValue* to `nullptr`.
     * @param {ID3D12ProtectedResourceSession} pProtectedSession Type: **[ID3D12ProtectedResourceSession](/windows/win32/api/d3d12/nn-d3d12-id3d12protectedresourcesession)\***
     * 
     * An optional pointer to an object that represents a session for content protection. If provided, this session indicates that the resource should be protected. You can obtain an **ID3D12ProtectedResourceSession** by calling [ID3D12Device4::CreateProtectedResourceSession](/windows/win32/api/d3d12/nf-d3d12-id3d12device4-createprotectedresourcesession).
     * @param {Pointer<Guid>} riidResource Type: **REFIID**
     * 
     * A reference to the globally unique identifier (**GUID**) of the resource interface to return in *ppvResource*.
     * 
     * While *riidResource* is most commonly the **GUID** of [ID3D12Resource](/windows/win32/api/d3d12/nn-d3d12-id3d12resource), it may be the **GUID** of any interface. If the resource object doesn't support the interface for this **GUID**, then creation fails with **E_NOINTERFACE**.
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * An optional pointer to a memory block that receives the requested interface pointer to the created resource object.
     * 
     * *ppvResource* can be `nullptr`, to enable capability testing. When *ppvResource* is `nullptr`, no object is created, and **S_FALSE** is returned when *pDesc* is valid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device8-createcommittedresource2
     */
    CreateCommittedResource2(pHeapProperties, HeapFlags, pDesc, InitialResourceState, pOptimizedClearValue, pProtectedSession, riidResource) {
        result := ComCall(69, this, "ptr", pHeapProperties, "int", HeapFlags, "ptr", pDesc, "int", InitialResourceState, "ptr", pOptimizedClearValue, "ptr", pProtectedSession, "ptr", riidResource, "ptr*", &ppvResource := 0, "HRESULT")
        return ppvResource
    }

    /**
     * Creates a resource that is placed in a specific heap. Placed resources are the lightest weight resource objects available, and are the fastest to create and destroy.
     * @remarks
     * See [ID3D12Device::CreatePlacedResource](./nf-d3d12-id3d12device-createplacedresource.md).
     * @param {ID3D12Heap} pHeap Type: [in] **<a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12heap">ID3D12Heap</a>***
     * 
     * A pointer to the **ID3D12Heap** interface that represents the heap in which the resource is placed.
     * @param {Integer} HeapOffset Type: **<a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT64</a>**
     * 
     * The offset, in bytes, to the resource. The *HeapOffset* must be a multiple of the resource's alignment, and *HeapOffset* plus the resource size must be smaller than or equal to the heap size. <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-getresourceallocationinfo">**GetResourceAllocationInfo**</a> must be used to understand the sizes of texture resources.
     * @param {Pointer<D3D12_RESOURCE_DESC1>} pDesc Type: [in] **const <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_desc1">D3D12_RESOURCE_DESC1</a>***
     * 
     * A pointer to a **D3D12_RESOURCE_DESC1** structure that describes the resource, including a mip region.
     * @param {Integer} InitialState Type: **<a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATES</a>**
     * 
     * The initial state of the resource, as a bitwise-OR'd combination of **D3D12_RESOURCE_STATES** enumeration constants.
     * 
     * When a resource is created together with a **D3D12_HEAP_TYPE_UPLOAD** heap, *InitialState* must be **D3D12_RESOURCE_STATE_GENERIC_READ**. When a resource is created together with a **D3D12_HEAP_TYPE_READBACK** heap, *InitialState* must be **D3D12_RESOURCE_STATE_COPY_DEST**.
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue Type: [in, optional] **const <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_clear_value">D3D12_CLEAR_VALUE</a>***
     * 
     * Specifies a **D3D12_CLEAR_VALUE** that describes the default value for a clear color.
     * 
     * *pOptimizedClearValue* specifies a value for which clear operations are most optimal. When the created resource is a texture with either the **D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET** or **D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL** flags, your application should choose the value that the clear operation will most commonly be called with.
     * 
     * Clear operations can be called with other values, but those operations will not be as efficient as when the value matches the one passed into resource creation.
     * 
     * *pOptimizedClearValue* must be NULL when used with **D3D12_RESOURCE_DIMENSION_BUFFER**.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * The globally unique identifier (**GUID**) for the resource interface. This is an input parameter.
     * 
     * The **REFIID**, or **GUID**, of the interface to the resource can be obtained by using the `__uuidof` macro. For example, `__uuidof(ID3D12Resource)` gets the **GUID** of the interface to a resource. Although **riid** is, most commonly, the GUID for <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12resource">**ID3D12Resource**</a>, it may be any **GUID** for any interface. If the resource object doesn't support the interface for this **GUID**, then creation fails with **E_NOINTERFACE**.
     * @returns {Pointer<Void>} Type: [out, optional] **void****
     * 
     * A pointer to a memory block that receives a pointer to the resource. *ppvResource* can be NULL, to enable capability testing. When *ppvResource* is NULL, no object will be created and S_FALSE will be returned when *pResourceDesc* and other parameters are valid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device8-createplacedresource1
     */
    CreatePlacedResource1(pHeap, HeapOffset, pDesc, InitialState, pOptimizedClearValue, riid) {
        result := ComCall(70, this, "ptr", pHeap, "uint", HeapOffset, "ptr", pDesc, "int", InitialState, "ptr", pOptimizedClearValue, "ptr", riid, "ptr*", &ppvResource := 0, "HRESULT")
        return ppvResource
    }

    /**
     * For purposes of sampler feedback, creates a descriptor suitable for binding.
     * @param {ID3D12Resource} pTargetedResource Type: \_In\_opt\_ **[ID3D12Resource](./nn-d3d12-id3d12heap.md)\***
     * 
     * The targeted resource, such as a texture, to create a descriptor for.
     * @param {ID3D12Resource} pFeedbackResource Type: \_In\_opt\_ **[ID3D12Resource](./nn-d3d12-id3d12heap.md)\***
     * 
     * The feedback resource, such as a texture, to create a descriptor for.
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor Type: \_In\_ **[D3D12_CPU_DESCRIPTOR_HANDLE](./ns-d3d12-d3d12_cpu_descriptor_handle.md)**
     * 
     * The CPU descriptor handle.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device8-createsamplerfeedbackunorderedaccessview
     */
    CreateSamplerFeedbackUnorderedAccessView(pTargetedResource, pFeedbackResource, DestDescriptor) {
        ComCall(71, this, "ptr", pTargetedResource, "ptr", pFeedbackResource, "ptr", DestDescriptor)
    }

    /**
     * Gets a resource layout that can be copied. Helps your app fill in [D3D12_PLACED_SUBRESOURCE_FOOTPRINT](../d3d12/ns-d3d12-d3d12_placed_subresource_footprint.md) and [D3D12_SUBRESOURCE_FOOTPRINT](../d3d12/ns-d3d12-d3d12_subresource_footprint.md) when suballocating space in upload heaps.
     * @remarks
     * For remarks and examples, see [ID3D12Device::GetCopyableFootprints](./nf-d3d12-id3d12device-getcopyablefootprints.md).
     * @param {Pointer<D3D12_RESOURCE_DESC1>} pResourceDesc Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_desc1">D3D12_RESOURCE_DESC1</a>*</b>
     * 
     * A description of the resource, as a pointer to a **D3D12_RESOURCE_DESC1** structure.
     * @param {Integer} FirstSubresource Type: [in] <b>UINT</b>
     * 
     * Index of the first subresource in the resource. The range of valid values is 0 to D3D12_REQ_SUBRESOURCES.
     * @param {Integer} NumSubresources Type: [in] <b>UINT</b>
     * 
     * The number of subresources in the resource. The range of valid values is 0 to (D3D12_REQ_SUBRESOURCES - <i>FirstSubresource</i>).
     * @param {Integer} BaseOffset Type: <b>UINT64</b>
     * 
     * The offset, in bytes, to the resource.
     * @param {Pointer<D3D12_PLACED_SUBRESOURCE_FOOTPRINT>} pLayouts Type: [out, optional] <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_placed_subresource_footprint">D3D12_PLACED_SUBRESOURCE_FOOTPRINT</a>*</b>
     * 
     * A pointer to an array (of length <i>NumSubresources</i>) of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_placed_subresource_footprint">D3D12_PLACED_SUBRESOURCE_FOOTPRINT</a> structures, to be filled with the description and placement of each subresource.
     * @param {Pointer<Integer>} pNumRows Type: [out, optional] <b>UINT*</b>
     * 
     * A pointer to an array (of length <i>NumSubresources</i>) of integer  variables, to be filled with the number of rows for each subresource.
     * @param {Pointer<Integer>} pRowSizeInBytes Type: [out, optional] <b>UINT64*</b>
     * 
     * A pointer to an array (of length <i>NumSubresources</i>) of integer variables, each entry to be filled with the unpadded size in bytes of a row, of each subresource.
     * 
     * For example, if a Texture2D resource has a width of 32 and bytes per pixel of 4, then <i>pRowSizeInBytes</i> returns 128.
     * 
     * <i>pRowSizeInBytes</i> should not be confused with <b>row pitch</b>, as examining <i>pLayouts</i> and getting the row pitch from that will give you 256 as it is aligned to D3D12_TEXTURE_DATA_PITCH_ALIGNMENT.
     * @param {Pointer<Integer>} pTotalBytes Type: [out, optional] <b>UINT64*</b>
     * 
     * A pointer to an integer variable, to be filled with the total size, in bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device8-getcopyablefootprints1
     */
    GetCopyableFootprints1(pResourceDesc, FirstSubresource, NumSubresources, BaseOffset, pLayouts, pNumRows, pRowSizeInBytes, pTotalBytes) {
        pNumRowsMarshal := pNumRows is VarRef ? "uint*" : "ptr"
        pRowSizeInBytesMarshal := pRowSizeInBytes is VarRef ? "uint*" : "ptr"
        pTotalBytesMarshal := pTotalBytes is VarRef ? "uint*" : "ptr"

        ComCall(72, this, "ptr", pResourceDesc, "uint", FirstSubresource, "uint", NumSubresources, "uint", BaseOffset, "ptr", pLayouts, pNumRowsMarshal, pNumRows, pRowSizeInBytesMarshal, pRowSizeInBytes, pTotalBytesMarshal, pTotalBytes)
    }
}
