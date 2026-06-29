#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_RENDER_TARGET_VIEW_DESC.ahk" { D3D11_RENDER_TARGET_VIEW_DESC }
#Import ".\ID3D11View.ahk" { ID3D11View }

/**
 * A render-target-view interface identifies the render-target subresources that can be accessed during rendering. (ID3D11RenderTargetView)
 * @remarks
 * To create a render-target view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createrendertargetview">ID3D11Device::CreateRenderTargetView</a>. To bind a render-target view to the pipeline, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetrendertargets">ID3D11DeviceContext::OMSetRenderTargets</a>.
 * 
 * A rendertarget is a resource that can be written by the output-merger stage at the end of a render pass. Each render-target should also have a corresponding depth-stencil view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11rendertargetview
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11RenderTargetView extends ID3D11View {
    /**
     * The interface identifier for ID3D11RenderTargetView
     * @type {Guid}
     */
    static IID := Guid("{dfdba067-0b8d-4865-875b-d7b4516cc164}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11RenderTargetView interfaces
    */
    struct Vtbl extends ID3D11View.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11RenderTargetView.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the properties of a render target view. (ID3D11RenderTargetView.GetDesc)
     * @param {Pointer<D3D11_RENDER_TARGET_VIEW_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_render_target_view_desc">D3D11_RENDER_TARGET_VIEW_DESC</a>*</b>
     * 
     * Pointer to the description of a render target view (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_render_target_view_desc">D3D11_RENDER_TARGET_VIEW_DESC</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11rendertargetview-getdesc
     */
    GetDesc(pDesc) {
        ComCall(8, this, D3D11_RENDER_TARGET_VIEW_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D11RenderTargetView.IID.Equals(iid)) {
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
