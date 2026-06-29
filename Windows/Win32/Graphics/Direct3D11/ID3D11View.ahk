#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11DeviceChild.ahk" { ID3D11DeviceChild }
#Import ".\ID3D11Resource.ahk" { ID3D11Resource }

/**
 * A view interface specifies the parts of a resource the pipeline can access during rendering. (ID3D11View)
 * @remarks
 * A view interface is the base interface for all views. There are four types of views; a depth-stencil view, a render-target view, a shader-resource view, and an unordered-access view.
 * 
 * <ul>
 * <li>To create a render-target view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createrendertargetview">ID3D11Device::CreateRenderTargetView</a>.</li>
 * <li>To create a depth-stencil view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createdepthstencilview">ID3D11Device::CreateDepthStencilView</a>.</li>
 * <li>To create a shader-resource view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createshaderresourceview">ID3D11Device::CreateShaderResourceView</a>.</li>
 * <li>To create an unordered-access view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createunorderedaccessview">ID3D11Device::CreateUnorderedAccessView</a>.</li>
 * </ul>
 * All resources must be bound to the pipeline before they can be accessed.
 * 
 * <ul>
 * <li>To bind a render-target view or a depth-stencil view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetrendertargets">ID3D11DeviceContext::OMSetRenderTargets</a>.</li>
 * <li>To bind a shader resource, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vssetshaderresources">ID3D11DeviceContext::VSSetShaderResources</a>.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11view
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11View extends ID3D11DeviceChild {
    /**
     * The interface identifier for ID3D11View
     * @type {Guid}
     */
    static IID := Guid("{839d1216-bb2e-412b-b7f4-a9dbebe08ed1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11View interfaces
    */
    struct Vtbl extends ID3D11DeviceChild.Vtbl {
        GetResource : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11View.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the resource that is accessed through this view. (ID3D11View.GetResource)
     * @remarks
     * This function increments the reference count of the resource by one, so it is necessary to call <b>Release</b> on the returned pointer when the application is done with it. Destroying (or losing) the returned pointer before <b>Release</b> is called will result in a memory leak.
     * @param {Pointer<ID3D11Resource>} ppResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>**</b>
     * 
     * Address of a pointer to the resource that is accessed through this view. (See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>.)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11view-getresource
     */
    GetResource(ppResource) {
        ComCall(7, this, ID3D11Resource.Ptr, ppResource)
    }

    Query(iid) {
        if (ID3D11View.IID.Equals(iid)) {
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
