#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device9.ahk

/**
 * TBD
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nn-d3d12-id3d12device10
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
     * Creates a committed resource with an initial layout rather than an initial state.
     * @param {Pointer<D3D12_HEAP_PROPERTIES>} pHeapProperties Type: \_In\_ **const [D3D12_HEAP_PROPERTIES](/windows/win32/api/d3d12/ns-d3d12-d3d12_heap_properties)\***
     * 
     * A pointer to a **D3D12_HEAP_PROPERTIES** structure that provides properties for the resource's heap.
     * @param {Integer} HeapFlags Type: **[D3D12_HEAP_FLAGS](/windows/win32/api/d3d12/ne-d3d12-d3d12_heap_flags)**
     * 
     * Heap options, as a bitwise-OR'd combination of **D3D12_HEAP_FLAGS** enumeration constants.
     * @param {Pointer<D3D12_RESOURCE_DESC1>} pDesc Type: **const [D3D12_RESOURCE_DESC1](/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_desc1)\***
     * 
     * A pointer to a **D3D12_RESOURCE_DESC1** structure that describes the resource, including a mip region.
     * @param {Integer} InitialLayout The initial layout of the texture resource; **D3D12_BARRIER_LAYOUT::D3D12_BARRIER_LAYOUT_UNDEFINED** for buffers.
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
     * @param {Integer} NumCastableFormats The number of elements in *pCastableFormats*.
     * @param {Pointer<Integer>} pCastableFormats A contiguous array of [DXGI_FORMAT](/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format) structures that this resource can be cast to.
     * @param {Pointer<Guid>} riidResource Type: **REFIID**
     * 
     * A reference to the globally unique identifier (**GUID**) of the resource interface to return in *ppvResource*.
     * 
     * While *riidResource* is most commonly the **GUID** of [ID3D12Resource](/windows/win32/api/d3d12/nn-d3d12-id3d12resource), it may be the **GUID** of any interface. If the resource object doesn't support the interface for this **GUID**, then creation fails with **E_NOINTERFACE**.
     * @returns {Pointer<Pointer<Void>>} Type: **void\*\***
     * 
     * An optional pointer to a memory block that receives the requested interface pointer to the created resource object.
     * 
     * *ppvResource* can be `nullptr`, to enable capability testing. When *ppvResource* is `nullptr`, no object is created, and **S_FALSE** is returned when *pDesc* is valid.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nf-d3d12-id3d12device10-createcommittedresource3
     */
    CreateCommittedResource3(pHeapProperties, HeapFlags, pDesc, InitialLayout, pOptimizedClearValue, pProtectedSession, NumCastableFormats, pCastableFormats, riidResource) {
        pCastableFormatsMarshal := pCastableFormats is VarRef ? "int*" : "ptr"

        result := ComCall(76, this, "ptr", pHeapProperties, "int", HeapFlags, "ptr", pDesc, "int", InitialLayout, "ptr", pOptimizedClearValue, "ptr", pProtectedSession, "uint", NumCastableFormats, pCastableFormatsMarshal, pCastableFormats, "ptr", riidResource, "ptr*", &ppvResource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvResource
    }

    /**
     * Creates a resource that is placed in a specific heap. Placed resources are the lightest weight resource objects available, and are the fastest to create and destroy.
     * @remarks
     * See **Remarks** for [ID3D12Device::CreatePlacedResource](nf-d3d12-id3d12device-createplacedresource.md).
     * @param {ID3D12Heap} pHeap Type: [in] **<a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12heap">ID3D12Heap</a>***
     * 
     * A pointer to the **ID3D12Heap** interface that represents the heap in which the resource is placed.
     * @param {Integer} HeapOffset Type: **<a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT64</a>**
     * 
     * The offset, in bytes, to the resource. The *HeapOffset* must be a multiple of the resource's alignment, and *HeapOffset* plus the resource size must be smaller than or equal to the heap size. <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-getresourceallocationinfo">**GetResourceAllocationInfo**</a> must be used to understand the sizes of texture resources.
     * @param {Pointer<D3D12_RESOURCE_DESC1>} pDesc Type: [in] **const <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_desc">D3D12_RESOURCE_DESC</a>***
     * 
     * A pointer to a **D3D12_RESOURCE_DESC** structure that describes the resource.
     * @param {Integer} InitialLayout The initial layout of the texture resource; **D3D12_BARRIER_LAYOUT::D3D12_BARRIER_LAYOUT_UNDEFINED** for buffers.
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue Type: [in, optional] **const <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_clear_value">D3D12_CLEAR_VALUE</a>***
     * 
     * Specifies a **D3D12_CLEAR_VALUE** that describes the default value for a clear color.
     * 
     * *pOptimizedClearValue* specifies a value for which clear operations are most optimal. When the created resource is a texture with either the **D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET** or **D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL** flags, your application should choose the value that the clear operation will most commonly be called with.
     * 
     * Clear operations can be called with other values, but those operations will not be as efficient as when the value matches the one passed into resource creation.
     * 
     * *pOptimizedClearValue* must be NULL when used with **D3D12_RESOURCE_DIMENSION_BUFFER**.
     * @param {Integer} NumCastableFormats The number of elements in *pCastableFormats*.
     * @param {Pointer<Integer>} pCastableFormats A contiguous array of [DXGI_FORMAT](/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format) structures that this resource can be cast to.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * The globally unique identifier (**GUID**) for the resource interface. This is an input parameter.
     * 
     * The **REFIID**, or **GUID**, of the interface to the resource can be obtained by using the `__uuidof` macro. For example, `__uuidof(ID3D12Resource)` gets the **GUID** of the interface to a resource. Although **riid** is, most commonly, the GUID for <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12resource">**ID3D12Resource**</a>, it may be any **GUID** for any interface. If the resource object doesn't support the interface for this **GUID**, then creation fails with **E_NOINTERFACE**.
     * @returns {Pointer<Pointer<Void>>} Type: [out, optional] **void****
     * 
     * A pointer to a memory block that receives a pointer to the resource. *ppvResource* can be NULL, to enable capability testing. When *ppvResource* is NULL, no object will be created and S_FALSE will be returned when *pResourceDesc* and other parameters are valid.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nf-d3d12-id3d12device10-createplacedresource2
     */
    CreatePlacedResource2(pHeap, HeapOffset, pDesc, InitialLayout, pOptimizedClearValue, NumCastableFormats, pCastableFormats, riid) {
        pCastableFormatsMarshal := pCastableFormats is VarRef ? "int*" : "ptr"

        result := ComCall(77, this, "ptr", pHeap, "uint", HeapOffset, "ptr", pDesc, "int", InitialLayout, "ptr", pOptimizedClearValue, "uint", NumCastableFormats, pCastableFormatsMarshal, pCastableFormats, "ptr", riid, "ptr*", &ppvResource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvResource
    }

    /**
     * Creates a resource that is reserved, and not yet mapped to any pages in a heap.
     * @remarks
     * See **Remarks** for [ID3D12Device.CreateReservedResource](nf-d3d12-id3d12device-createreservedresource.md).
     * @param {Pointer<D3D12_RESOURCE_DESC>} pDesc Type: **const [D3D12_RESOURCE_DESC](./ns-d3d12-d3d12_resource_desc.md)\***
     * 
     * A pointer to a **D3D12_RESOURCE_DESC** structure that describes the resource.
     * @param {Integer} InitialLayout The initial layout of the texture resource; **D3D12_BARRIER_LAYOUT::D3D12_BARRIER_LAYOUT_UNDEFINED** for buffers.
     * @param {Pointer<D3D12_CLEAR_VALUE>} pOptimizedClearValue Type: **const [D3D12_CLEAR_VALUE](./ns-d3d12-d3d12_clear_value.md)\***
     * 
     * Specifies a **D3D12_CLEAR_VALUE** structure that describes the default value for a clear color.
     * 
     * *pOptimizedClearValue* specifies a value for which clear operations are most optimal. When the created resource is a texture with either the [D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET](./ne-d3d12-d3d12_resource_flags.md) or **D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL** flags, you should choose the value with which the clear operation will most commonly be called. You can call the clear operation with other values, but those operations won't be as efficient as when the value matches the one passed in to resource creation.
     * 
     * When you use [D3D12_RESOURCE_DIMENSION_BUFFER](./ne-d3d12-d3d12_resource_dimension.md), you must set *pOptimizedClearValue* to `nullptr`.
     * @param {ID3D12ProtectedResourceSession} pProtectedSession Type: **[ID3D12ProtectedResourceSession](/windows/win32/api/d3d12/nn-d3d12-id3d12protectedresourcesession)\***
     * 
     * An optional pointer to an object that represents a session for content protection. If provided, this session indicates that the resource should be protected. You can obtain an **ID3D12ProtectedResourceSession** by calling [ID3D12Device4::CreateProtectedResourceSession](/windows/win32/api/d3d12/nf-d3d12-id3d12device4-createprotectedresourcesession).
     * @param {Integer} NumCastableFormats The number of elements in *pCastableFormats*.
     * @param {Pointer<Integer>} pCastableFormats A contiguous array of [DXGI_FORMAT](/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format) structures that this resource can be cast to.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (**GUID**) of the resource interface to return in *ppvResource*. See **Remarks**.
     * 
     * While *riidResource* is most commonly the **GUID** of [ID3D12Resource](./nn-d3d12-id3d12resource.md), it may be the **GUID** of any interface. If the resource object doesn't support the interface for this **GUID**, then creation fails with **E_NOINTERFACE**.
     * @returns {Pointer<Pointer<Void>>} Type: **void\*\***
     * 
     * An optional pointer to a memory block that receives the requested interface pointer to the created resource object.
     * 
     * *ppvResource* can be `nullptr`, to enable capability testing. When *ppvResource* is `nullptr`, no object is created, and **S_FALSE** is returned when *pDesc* is valid.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nf-d3d12-id3d12device10-createreservedresource2
     */
    CreateReservedResource2(pDesc, InitialLayout, pOptimizedClearValue, pProtectedSession, NumCastableFormats, pCastableFormats, riid) {
        pCastableFormatsMarshal := pCastableFormats is VarRef ? "int*" : "ptr"

        result := ComCall(78, this, "ptr", pDesc, "int", InitialLayout, "ptr", pOptimizedClearValue, "ptr", pProtectedSession, "uint", NumCastableFormats, pCastableFormatsMarshal, pCastableFormats, "ptr", riid, "ptr*", &ppvResource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvResource
    }
}
