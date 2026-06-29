#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_RENDER_TARGET_VIEW_DESC1.ahk" { D3D11_RENDER_TARGET_VIEW_DESC1 }
#Import ".\ID3D11RenderTargetView.ahk" { ID3D11RenderTargetView }

/**
 * A render-target-view interface represents the render-target subresources that can be accessed during rendering.
 * @remarks
 * To create a render-target view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createrendertargetview1">ID3D11Device3::CreateRenderTargetView1</a>. To bind a render-target view to the pipeline, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetrendertargets">ID3D11DeviceContext::OMSetRenderTargets</a>.
 * 
 * A render target is a resource that can be written by the output-merger stage at the end of a render pass. Each render target can also have a corresponding depth-stencil view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11rendertargetview1
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11RenderTargetView1 extends ID3D11RenderTargetView {
    /**
     * The interface identifier for ID3D11RenderTargetView1
     * @type {Guid}
     */
    static IID := Guid("{ffbe2e23-f011-418a-ac56-5ceed7c5b94b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11RenderTargetView1 interfaces
    */
    struct Vtbl extends ID3D11RenderTargetView.Vtbl {
        GetDesc1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11RenderTargetView1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the properties of a render-target view.
     * @param {Pointer<D3D11_RENDER_TARGET_VIEW_DESC1>} pDesc1 Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_render_target_view_desc1">D3D11_RENDER_TARGET_VIEW_DESC1</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_render_target_view_desc1">D3D11_RENDER_TARGET_VIEW_DESC1</a> structure that receives the description of the render-target view.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11rendertargetview1-getdesc1
     */
    GetDesc1(pDesc1) {
        ComCall(9, this, D3D11_RENDER_TARGET_VIEW_DESC1.Ptr, pDesc1)
    }

    Query(iid) {
        if (ID3D11RenderTargetView1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc1 := CallbackCreate(GetMethod(implObj, "GetDesc1"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc1)
    }
}
