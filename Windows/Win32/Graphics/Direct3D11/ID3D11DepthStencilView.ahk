#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_DEPTH_STENCIL_VIEW_DESC.ahk" { D3D11_DEPTH_STENCIL_VIEW_DESC }
#Import ".\ID3D11View.ahk" { ID3D11View }

/**
 * A depth-stencil-view interface accesses a texture resource during depth-stencil testing. (ID3D11DepthStencilView)
 * @remarks
 * To create a depth-stencil view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createdepthstencilview">ID3D11Device::CreateDepthStencilView</a>.
 * 
 * To bind a depth-stencil view to the pipeline, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetrendertargets">ID3D11DeviceContext::OMSetRenderTargets</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11depthstencilview
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11DepthStencilView extends ID3D11View {
    /**
     * The interface identifier for ID3D11DepthStencilView
     * @type {Guid}
     */
    static IID := Guid("{9fdac92a-1876-48c3-afad-25b94f84a9b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11DepthStencilView interfaces
    */
    struct Vtbl extends ID3D11View.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11DepthStencilView.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the depth-stencil view. (ID3D11DepthStencilView.GetDesc)
     * @param {Pointer<D3D11_DEPTH_STENCIL_VIEW_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_view_desc">D3D11_DEPTH_STENCIL_VIEW_DESC</a>*</b>
     * 
     * Pointer to a depth-stencil-view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_view_desc">D3D11_DEPTH_STENCIL_VIEW_DESC</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11depthstencilview-getdesc
     */
    GetDesc(pDesc) {
        ComCall(8, this, D3D11_DEPTH_STENCIL_VIEW_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D11DepthStencilView.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc)
    }
}
