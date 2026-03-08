#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device3.ahk

/**
 * Represents a virtual adapter. This interface extends [ID3D12Device3](../d3d12/nn-d3d12-id3d12device3.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device4
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
     * Creates a command list in the closed state.
     * @param {Integer} nodeMask Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * For single-GPU operation, set this to zero. If there are multiple GPU nodes, then set a bit to identify the node (the device's physical adapter) for which to create the command list. Each bit in the mask corresponds to a single node. Only one bit must be set. Also see [Multi-adapter systems](/windows/win32/direct3d12/multi-engine).
     * @param {Integer} type Type: **[D3D12_COMMAND_LIST_TYPE](./ne-d3d12-d3d12_command_list_type.md)**
     * 
     * Specifies the type of command list to create.
     * @param {Integer} flags Type: **[D3D12_COMMAND_LIST_FLAGS](./ne-d3d12-d3d12_command_list_flags.md)**
     * 
     * Specifies creation flags.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (**GUID**) of the command list interface to return in *ppCommandList*.
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * A pointer to a memory block that receives a pointer to the [ID3D12CommandList](./nn-d3d12-id3d12commandlist.md) or [ID3D12GraphicsCommandList](./nn-d3d12-id3d12graphicscommandlist.md) interface for the command list.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device4-createcommandlist1
     */
    CreateCommandList1(nodeMask, type, flags, riid) {
        result := ComCall(51, this, "uint", nodeMask, "int", type, "int", flags, "ptr", riid, "ptr*", &ppCommandList := 0, "HRESULT")
        return ppCommandList
    }

    /**
     * Creates an object that represents a session for content protection.
     * @param {Pointer<D3D12_PROTECTED_RESOURCE_SESSION_DESC>} pDesc Type: **const [D3D12_PROTECTED_RESOURCE_SESSION_DESC](./ns-d3d12-d3d12_protected_resource_session_desc.md)\***
     * 
     * A pointer to a constant **D3D12_PROTECTED_RESOURCE_SESSION_DESC** structure, describing the session to create.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (**GUID**) of the [ID3D12ProtectedResourceSession](./nn-d3d12-id3d12protectedresourcesession.md) interface.
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * A pointer to a memory block that receives an [ID3D12ProtectedResourceSession](./nn-d3d12-id3d12protectedresourcesession.md) interface pointer to the created session object.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device4-createprotectedresourcesession
     */
    CreateProtectedResourceSession(pDesc, riid) {
        result := ComCall(52, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppSession := 0, "HRESULT")
        return ppSession
    }

    /**
     * Creates both a resource and an implicit heap (optionally for a protected session), such that the heap is big enough to contain the entire resource, and the resource is mapped to the heap. (ID3D12Device4::CreateCommittedResource1)
     * @remarks
     * This method creates both a resource and a heap, such that the heap is big enough to contain the entire resource, and the resource is mapped to the heap. The created heap is known as an implicit heap, because the heap object can't be obtained by the application. Before releasing the final reference on the resource, your application must ensure that the GPU will no longer read nor write to this resource.
     * 
     * The implicit heap is made resident for GPU access before the method returns control to your application. Also see [Residency](/windows/win32/direct3d12/residency).
     * 
     * The resource GPU VA mapping can't be changed. See [ID3D12CommandQueue::UpdateTileMappings](./nf-d3d12-id3d12commandqueue-updatetilemappings.md) and [Volume tiled resources](/windows/win32/direct3d12/volume-tiled-resources).
     * 
     * This method may be called by multiple threads concurrently.
     * @param {Pointer<D3D12_HEAP_PROPERTIES>} pHeapProperties Type: **const [D3D12_HEAP_PROPERTIES](./ns-d3d12-d3d12_heap_properties.md)\***
     * 
     * A pointer to a **D3D12_HEAP_PROPERTIES** structure that provides properties for the resource's heap.
     * @param {Integer} HeapFlags Type: **[D3D12_HEAP_FLAGS](./ne-d3d12-d3d12_heap_flags.md)**
     * 
     * Heap options, as a bitwise-OR'd combination of **D3D12_HEAP_FLAGS** enumeration constants.
     * @param {Pointer<D3D12_RESOURCE_DESC>} pDesc Type: **const [D3D12_RESOURCE_DESC](./ns-d3d12-d3d12_resource_desc.md)\***
     * 
     * A pointer to a **D3D12_RESOURCE_DESC** structure that describes the resource.
     * @param {Integer} InitialResourceState Type: **[D3D12_RESOURCE_STATES](./ne-d3d12-d3d12_resource_states.md)**
     * 
     * The initial state of the resource, as a bitwise-OR'd combination of **D3D12_RESOURCE_STATES** enumeration constants.
     * 
     * When you create a resource together with a [D3D12_HEAP_TYPE_UPLOAD](./ne-d3d12-d3d12_heap_type.md) heap, you must set *InitialResourceState* to [D3D12_RESOURCE_STATE_GENERIC_READ](./ne-d3d12-d3d12_resource_states.md).
     * 
     * When you create a resource together with a [D3D12_HEAP_TYPE_READBACK](./ne-d3d12-d3d12_heap_type.md) heap, you must set *InitialResourceState* to [D3D12_RESOURCE_STATE_COPY_DEST](./ne-d3d12-d3d12_resource_states.md).
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue Type: **const [D3D12_CLEAR_VALUE](./ns-d3d12-d3d12_clear_value.md)\***
     * 
     * Specifies a **D3D12_CLEAR_VALUE** structure that describes the default value for a clear color.
     * 
     * *pOptimizedClearValue* specifies a value for which clear operations are most optimal. When the created resource is a texture with either the [D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET](./ne-d3d12-d3d12_resource_flags.md) or **D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL** flags, you should choose the value with which the clear operation will most commonly be called. You can call the clear operation with other values, but those operations won't be as efficient as when the value matches the one passed in to resource creation.
     * 
     * When you use [D3D12_RESOURCE_DIMENSION_BUFFER](./ne-d3d12-d3d12_resource_dimension.md), you must set *pOptimizedClearValue* to `nullptr`.
     * @param {ID3D12ProtectedResourceSession} pProtectedSession Type: **[ID3D12ProtectedResourceSession](./nn-d3d12-id3d12protectedresourcesession.md)\***
     * 
     * An optional pointer to an object that represents a session for content protection. If provided, this session indicates that the resource should be protected. You can obtain an **ID3D12ProtectedResourceSession** by calling [ID3D12Device4::CreateProtectedResourceSession](./nf-d3d12-id3d12device4-createprotectedresourcesession.md).
     * @param {Pointer<Guid>} riidResource Type: **REFIID**
     * 
     * A reference to the globally unique identifier (**GUID**) of the resource interface to return in *ppvResource*.
     * 
     * While *riidResource* is most commonly the **GUID** of [ID3D12Resource](./nn-d3d12-id3d12resource.md), it may be the **GUID** of any interface. If the resource object doesn't support the interface for this **GUID**, then creation fails with **E_NOINTERFACE**.
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * An optional pointer to a memory block that receives the requested interface pointer to the created resource object.
     * 
     * *ppvResource* can be `nullptr`, to enable capability testing. When *ppvResource* is `nullptr`, no object is created, and **S_FALSE** is returned when *pDesc* is valid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device4-createcommittedresource1
     */
    CreateCommittedResource1(pHeapProperties, HeapFlags, pDesc, InitialResourceState, pOptimizedClearValue, pProtectedSession, riidResource) {
        result := ComCall(53, this, "ptr", pHeapProperties, "int", HeapFlags, "ptr", pDesc, "int", InitialResourceState, "ptr", pOptimizedClearValue, "ptr", pProtectedSession, "ptr", riidResource, "ptr*", &ppvResource := 0, "HRESULT")
        return ppvResource
    }

    /**
     * Creates a heap (optionally for a protected session) that can be used with placed resources and reserved resources.
     * @remarks
     * **CreateHeap1** creates a heap that can be used with placed resources and reserved resources.
     * 
     * Before releasing the final reference on the heap, your application must ensure that the GPU will no longer read or write to this heap.
     * 
     * A placed resource object holds a reference on the heap it is created on; but a reserved resource doesn't hold a reference for each mapping made to a heap.
     * @param {Pointer<D3D12_HEAP_DESC>} pDesc Type: **const [D3D12_HEAP_DESC](./ns-d3d12-d3d12_heap_desc.md)\***
     * 
     * A pointer to a constant **D3D12_HEAP_DESC** structure that describes the heap.
     * @param {ID3D12ProtectedResourceSession} pProtectedSession Type: **[ID3D12ProtectedResourceSession](./nn-d3d12-id3d12protectedresourcesession.md)\***
     * 
     * An optional pointer to an object that represents a session for content protection. If provided, this session indicates that the heap should be protected. You can obtain an **ID3D12ProtectedResourceSession** by calling [ID3D12Device4::CreateProtectedResourceSession](./nf-d3d12-id3d12device4-createprotectedresourcesession.md).
     * 
     * A heap with a protected session can't be created with the [D3D12_HEAP_FLAG_SHARED_CROSS_ADAPTER](/windows/win32/api/d3d12/ne-d3d12-d3d12_heap_flags) flag.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (**GUID**) of the heap interface to return in *ppvHeap*.
     * 
     * While *riidResource* is most commonly the **GUID** of [ID3D12Heap](./nn-d3d12-id3d12heap.md), it may be the **GUID** of any interface. If the resource object doesn't support the interface for this **GUID**, then creation fails with **E_NOINTERFACE**.
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * An optional pointer to a memory block that receives the requested interface pointer to the created heap object.
     * 
     * *ppvHeap* can be `nullptr`, to enable capability testing. When *ppvHeap* is `nullptr`, no object is created, and **S_FALSE** is returned when *pDesc* is valid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device4-createheap1
     */
    CreateHeap1(pDesc, pProtectedSession, riid) {
        result := ComCall(54, this, "ptr", pDesc, "ptr", pProtectedSession, "ptr", riid, "ptr*", &ppvHeap := 0, "HRESULT")
        return ppvHeap
    }

    /**
     * Creates a resource (optionally for a protected session) that is reserved, and not yet mapped to any pages in a heap.
     * @remarks
     * **CreateReservedResource** is equivalent to [D3D11_RESOURCE_MISC_TILED](../d3d11/ne-d3d11-d3d11_resource_misc_flag.md) in Direct3D 11. It creates a resource with virtual memory only, no backing store.
     * 
     * You need to map the resource to physical memory (that is, to a heap) using <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12commandqueue-copytilemappings">CopyTileMappings</a> and <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12commandqueue-updatetilemappings">UpdateTileMappings</a>.
     * 
     * These resource types can only be created when the adapter supports tiled resource tier 1 or greater. The tiled resource tier defines the behavior of accessing a resource that is not mapped to a heap.
     * @param {Pointer<D3D12_RESOURCE_DESC>} pDesc Type: **const [D3D12_RESOURCE_DESC](./ns-d3d12-d3d12_resource_desc.md)\***
     * 
     * A pointer to a **D3D12_RESOURCE_DESC** structure that describes the resource.
     * @param {Integer} InitialState Type: **[D3D12_RESOURCE_STATES](./ne-d3d12-d3d12_resource_states.md)**
     * 
     * The initial state of the resource, as a bitwise-OR'd combination of **D3D12_RESOURCE_STATES** enumeration constants.
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue Type: **const [D3D12_CLEAR_VALUE](./ns-d3d12-d3d12_clear_value.md)\***
     * 
     * Specifies a **D3D12_CLEAR_VALUE** structure that describes the default value for a clear color.
     * 
     * *pOptimizedClearValue* specifies a value for which clear operations are most optimal. When the created resource is a texture with either the [D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET](./ne-d3d12-d3d12_resource_flags.md) or **D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL** flags, you should choose the value with which the clear operation will most commonly be called. You can call the clear operation with other values, but those operations won't be as efficient as when the value matches the one passed in to resource creation.
     * 
     * When you use [D3D12_RESOURCE_DIMENSION_BUFFER](./ne-d3d12-d3d12_resource_dimension.md), you must set *pOptimizedClearValue* to `nullptr`.
     * @param {ID3D12ProtectedResourceSession} pProtectedSession Type: **[ID3D12ProtectedResourceSession](./nn-d3d12-id3d12protectedresourcesession.md)\***
     * 
     * An optional pointer to an object that represents a session for content protection. If provided, this session indicates that the resource should be protected. You can obtain an **ID3D12ProtectedResourceSession** by calling [ID3D12Device4::CreateProtectedResourceSession](./nf-d3d12-id3d12device4-createprotectedresourcesession.md).
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (**GUID**) of the resource interface to return in *ppvResource*. See **Remarks**.
     * 
     * While *riidResource* is most commonly the **GUID** of [ID3D12Resource](./nn-d3d12-id3d12resource.md), it may be the **GUID** of any interface. If the resource object doesn't support the interface for this **GUID**, then creation fails with **E_NOINTERFACE**.
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * An optional pointer to a memory block that receives the requested interface pointer to the created resource object.
     * 
     * *ppvResource* can be `nullptr`, to enable capability testing. When *ppvResource* is `nullptr`, no object is created, and **S_FALSE** is returned when *pDesc* is valid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device4-createreservedresource1
     */
    CreateReservedResource1(pDesc, InitialState, pOptimizedClearValue, pProtectedSession, riid) {
        result := ComCall(55, this, "ptr", pDesc, "int", InitialState, "ptr", pOptimizedClearValue, "ptr", pProtectedSession, "ptr", riid, "ptr*", &ppvResource := 0, "HRESULT")
        return ppvResource
    }

    /**
     * Gets rich info about the size and alignment of memory required for a collection of resources on this adapter. (ID3D12Device4::GetResourceAllocationInfo1)
     * @remarks
     * When you're using [CreatePlacedResource](./nf-d3d12-id3d12device-createplacedresource.md), your application must use **GetResourceAllocationInfo** in order to understand the size and alignment characteristics of texture resources. The results of this method vary depending on the particular adapter, and must be treated as unique to this adapter and driver version.
     * 
     * Your application can't use the output of **GetResourceAllocationInfo** to understand packed mip properties of textures. To understand packed mip properties of textures, your application must use [GetResourceTiling](./nf-d3d12-id3d12device-getresourcetiling.md).
     * 
     * Texture resource sizes significantly differ from the information returned by **GetResourceTiling**, because some adapter architectures allocate extra memory for textures to reduce the effective bandwidth during common rendering scenarios. This even includes textures that have constraints on their texture layouts, or have standardized texture layouts. That extra memory can't be sparsely mapped nor remapped by an application using [CreateReservedResource](./nf-d3d12-id3d12device-createreservedresource.md) and [UpdateTileMappings](./nf-d3d12-id3d12commandqueue-updatetilemappings.md), so it isn't reported by **GetResourceTiling**.
     * 
     * Your application can forgo using **GetResourceAllocationInfo** for buffer resources ([D3D12_RESOURCE_DIMENSION_BUFFER](./ne-d3d12-d3d12_resource_dimension.md)). Buffers have the same size on all adapters, which is merely the smallest multiple of 64KB that's greater or equal to [D3D12_RESOURCE_DESC::Width](./ns-d3d12-d3d12_resource_desc.md).
     * 
     * When multiple resource descriptions are passed in, the C++ algorithm for calculating a structure size and alignment are used. For example, a three-element array with two tiny 64KB-aligned resources and a tiny 4MB-aligned resource, reports differing sizes based on the order of the array. If the 4MB aligned resource is in the middle, then the resulting **Size** is 12MB. Otherwise, the resulting **Size** is 8MB. The **Alignment** returned would always be 4MB, because it's the superset of all alignments in the resource array.
     * @param {Integer} visibleMask Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * For single-GPU operation, set this to zero. If there are multiple GPU nodes, then set bits to identify the nodes (the device's physical adapters). Each bit in the mask corresponds to a single node. Also see [Multi-adapter systems](/windows/win32/direct3d12/multi-engine).
     * @param {Integer} numResourceDescs Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * The number of resource descriptors in the *pResourceDescs* array. This is also the size (the number of elements in) *pResourceAllocationInfo1*.
     * @param {Pointer<D3D12_RESOURCE_DESC>} pResourceDescs Type: **const [D3D12_RESOURCE_DESC](./ns-d3d12-d3d12_resource_desc.md)\***
     * 
     * An array of **D3D12_RESOURCE_DESC** structures that described the resources to get info about.
     * @param {Pointer<D3D12_RESOURCE_ALLOCATION_INFO1>} pResourceAllocationInfo1 Type: **[D3D12_RESOURCE_ALLOCATION_INFO1](./ns-d3d12-d3d12_resource_allocation_info1.md)\***
     * 
     * An array of [D3D12_RESOURCE_ALLOCATION_INFO1](./ns-d3d12-d3d12_resource_allocation_info1.md) structures, containing additional details for each resource description passed as input. This makes it simpler for your application to allocate a heap for multiple resources, and without manually computing offsets for where each resource should be placed.
     * @returns {D3D12_RESOURCE_ALLOCATION_INFO} Type: **[D3D12_RESOURCE_ALLOCATION_INFO](./ns-d3d12-d3d12_resource_allocation_info.md)**
     * 
     * A [D3D12_RESOURCE_ALLOCATION_INFO](./ns-d3d12-d3d12_resource_allocation_info.md) structure that provides info about video memory allocated for the specified array of resources.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device4-getresourceallocationinfo1
     */
    GetResourceAllocationInfo1(visibleMask, numResourceDescs, pResourceDescs, pResourceAllocationInfo1) {
        result := ComCall(56, this, "uint", visibleMask, "uint", numResourceDescs, "ptr", pResourceDescs, "ptr", pResourceAllocationInfo1, "ptr")
        return result
    }
}
