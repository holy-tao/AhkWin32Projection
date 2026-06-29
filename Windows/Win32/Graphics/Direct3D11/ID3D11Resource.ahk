#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11DeviceChild.ahk" { ID3D11DeviceChild }
#Import ".\D3D11_RESOURCE_DIMENSION.ahk" { D3D11_RESOURCE_DIMENSION }

/**
 * A resource interface provides common actions on all resources. (ID3D11Resource)
 * @remarks
 * You don't directly create a resource interface; instead, you create buffers and textures that inherit from a resource interface. For more info,  see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-buffers-vertex-how-to">How to: Create a Vertex Buffer</a>, <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-buffers-index-how-to">How to: Create an Index Buffer</a>, <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-buffers-constant-how-to">How to: Create a Constant Buffer</a>, and <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-textures-create">How to: Create a Texture</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11resource
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11Resource extends ID3D11DeviceChild {
    /**
     * The interface identifier for ID3D11Resource
     * @type {Guid}
     */
    static IID := Guid("{dc8e63f3-d12b-4952-b47b-5e45026a862d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11Resource interfaces
    */
    struct Vtbl extends ID3D11DeviceChild.Vtbl {
        GetType             : IntPtr
        SetEvictionPriority : IntPtr
        GetEvictionPriority : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11Resource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the type of the resource. (ID3D11Resource.GetType)
     * @remarks
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * @param {Pointer<D3D11_RESOURCE_DIMENSION>} pResourceDimension Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_dimension">D3D11_RESOURCE_DIMENSION</a>*</b>
     * 
     * Pointer to the resource type (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_dimension">D3D11_RESOURCE_DIMENSION</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11resource-gettype
     */
    GetType(pResourceDimension) {
        pResourceDimensionMarshal := pResourceDimension is VarRef ? "int*" : "ptr"

        ComCall(7, this, pResourceDimensionMarshal, pResourceDimension)
    }

    /**
     * Set the eviction priority of a resource. (ID3D11Resource.SetEvictionPriority)
     * @remarks
     * Resource priorities determine which resource to evict from video memory when the system has run out of video memory. The resource will not be lost; it will be removed from video memory and placed into system memory, or possibly placed onto the hard drive. The resource will be loaded back into video memory when it is required.
     * 
     * A resource that is set to the maximum priority, DXGI_RESOURCE_PRIORITY_MAXIMUM, is only evicted if there is no other way of resolving the incoming memory request. The Windows Display Driver Model (WDDM) tries to split an incoming memory request to its minimum size and evict lower-priority resources before evicting a resource with maximum priority.
     * 
     * Changing the priorities of resources should be done carefully. The wrong eviction priorities could be a detriment to performance rather than an improvement.
     * @param {Integer} EvictionPriority Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11resource-setevictionpriority
     */
    SetEvictionPriority(EvictionPriority) {
        ComCall(8, this, "uint", EvictionPriority)
    }

    /**
     * Get the eviction priority of a resource. (ID3D11Resource.GetEvictionPriority)
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * One of the following values, which specifies the eviction priority for the resource:
     * 
     * <ul>
     * <li>DXGI_RESOURCE_PRIORITY_MINIMUM</li>
     * <li>DXGI_RESOURCE_PRIORITY_LOW</li>
     * <li>DXGI_RESOURCE_PRIORITY_NORMAL</li>
     * <li>DXGI_RESOURCE_PRIORITY_HIGH</li>
     * <li>DXGI_RESOURCE_PRIORITY_MAXIMUM</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11resource-getevictionpriority
     */
    GetEvictionPriority() {
        result := ComCall(9, this, UInt32)
        return result
    }

    Query(iid) {
        if (ID3D11Resource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 2)
        this.vtbl.SetEvictionPriority := CallbackCreate(GetMethod(implObj, "SetEvictionPriority"), flags, 2)
        this.vtbl.GetEvictionPriority := CallbackCreate(GetMethod(implObj, "GetEvictionPriority"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetType)
        CallbackFree(this.vtbl.SetEvictionPriority)
        CallbackFree(this.vtbl.GetEvictionPriority)
    }
}
