#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10DeviceChild.ahk" { ID3D10DeviceChild }
#Import ".\D3D10_RESOURCE_DIMENSION.ahk" { D3D10_RESOURCE_DIMENSION }

/**
 * A resource interface provides common actions on all resources. (ID3D10Resource)
 * @remarks
 * A resource interface cannot be created directly; instead, <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">buffers</a> and textures are created that inherit from a resource interface (see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-creating">Creating Buffer Resources</a> or <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-creating-textures">Creating Texture Resources</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/nn-d3d10-id3d10resource
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10Resource extends ID3D10DeviceChild {
    /**
     * The interface identifier for ID3D10Resource
     * @type {Guid}
     */
    static IID := Guid("{9b7e4c01-342c-4106-a19f-4f2704f689f0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10Resource interfaces
    */
    struct Vtbl extends ID3D10DeviceChild.Vtbl {
        GetType             : IntPtr
        SetEvictionPriority : IntPtr
        GetEvictionPriority : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10Resource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the type of the resource. (ID3D10Resource.GetType)
     * @param {Pointer<D3D10_RESOURCE_DIMENSION>} rType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_resource_dimension">D3D10_RESOURCE_DIMENSION</a>*</b>
     * 
     * Pointer to the resource type (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_resource_dimension">D3D10_RESOURCE_DIMENSION</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10resource-gettype
     */
    GetType(rType) {
        rTypeMarshal := rType is VarRef ? "int*" : "ptr"

        ComCall(7, this, rTypeMarshal, rType)
    }

    /**
     * Set the eviction priority of a resource. (ID3D10Resource.SetEvictionPriority)
     * @remarks
     * Resource priorities determine which resource to evict from video memory when the system has run out of video memory. The resource will not be lost; it will be removed from video memory and placed into system memory, or possibly placed onto the hard drive. The resource will be loaded back into video memory when it is required.
     * 
     * A resource that is set to the maximum priority, DXGI_RESOURCE_PRIORITY_MAXIMUM, is only evicted if there is no other way of resolving the incoming memory request. The Windows Display Driver Model (WDDM) tries to split an incoming memory request to its minimum size and evict lower-priority resources before evicting a resource with maximum priority.
     * 
     * Changing the priorities of resources should be done carefully. The wrong eviction priorities could be a detriment to performance rather than an improvement. See <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgidevice-queryresourceresidency">QueryResourceResidency</a> for additional information.
     * 
     * This method is a wrapper for <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiresource-setevictionpriority">SetEvictionPriority</a> and is provided in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource Interface</a> interface for convenience.
     * @param {Integer} EvictionPriority Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10resource-setevictionpriority
     */
    SetEvictionPriority(EvictionPriority) {
        ComCall(8, this, "uint", EvictionPriority)
    }

    /**
     * Get the eviction priority of a resource. (ID3D10Resource.GetEvictionPriority)
     * @remarks
     * This method is a wrapper for <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiresource-getevictionpriority">GetEvictionPriority</a> and is provided in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource Interface</a> interface for convenience.
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10resource-getevictionpriority
     */
    GetEvictionPriority() {
        result := ComCall(9, this, UInt32)
        return result
    }

    Query(iid) {
        if (ID3D10Resource.IID.Equals(iid)) {
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
