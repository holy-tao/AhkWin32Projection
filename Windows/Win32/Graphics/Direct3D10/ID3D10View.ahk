#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10DeviceChild.ahk" { ID3D10DeviceChild }
#Import ".\ID3D10Resource.ahk" { ID3D10Resource }

/**
 * A view interface specifies the parts of a resource the pipeline can access during rendering (see view).
 * @remarks
 * A view interface is the base interface for all views. There are three types of views; a depth-stencil view, a render-target view, and a shader-resource view.
 * 
 * <ul>
 * <li>To create a render-target view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createrendertargetview">ID3D10Device::CreateRenderTargetView</a>.</li>
 * <li>To create a depth-stencil view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createdepthstencilview">ID3D10Device::CreateDepthStencilView</a>.</li>
 * <li>To create a shader-resource view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createshaderresourceview">ID3D10Device::CreateShaderResourceView</a>.</li>
 * </ul>
 * All resources must be bound to the pipeline before they can be accessed.
 * 
 * <ul>
 * <li>To bind a render-target view or a depth-stencil view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-omsetrendertargets">ID3D10Device::OMSetRenderTargets</a>.</li>
 * <li>To bind a shader-resource view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-vssetshaderresources">ID3D10Device::VSSetShaderResources</a>.</li>
 * </ul>
 * A view can also be used to access a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-access-views">typeless resource</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/nn-d3d10-id3d10view
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10View extends ID3D10DeviceChild {
    /**
     * The interface identifier for ID3D10View
     * @type {Guid}
     */
    static IID := Guid("{c902b03f-60a7-49ba-9936-2a3ab37a7e33}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10View interfaces
    */
    struct Vtbl extends ID3D10DeviceChild.Vtbl {
        GetResource : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10View.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the resource that is accessed through this view. (ID3D10View.GetResource)
     * @remarks
     * This function increments the reference count of the resource by one, so it is necessary to call Release on the returned pointer when the application is done with it. Destroying (or losing) the returned pointer before Release is called will result in a memory leak.
     * @param {Pointer<ID3D10Resource>} ppResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a>**</b>
     * 
     * Address of a pointer to the resource that is accessed through this view. (See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a>.)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10view-getresource
     */
    GetResource(ppResource) {
        ComCall(7, this, ID3D10Resource.Ptr, ppResource)
    }

    Query(iid) {
        if (ID3D10View.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetResource := CallbackCreate(GetMethod(implObj, "GetResource"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetResource)
    }
}
