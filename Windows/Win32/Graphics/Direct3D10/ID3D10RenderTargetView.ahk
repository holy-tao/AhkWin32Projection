#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10View.ahk" { ID3D10View }
#Import ".\D3D10_RENDER_TARGET_VIEW_DESC.ahk" { D3D10_RENDER_TARGET_VIEW_DESC }

/**
 * A render-target-view interface identifies the render-target subresources that can be accessed during rendering. (ID3D10RenderTargetView)
 * @remarks
 * To create a render-target view, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createrendertargetview">ID3D10Device::CreateRenderTargetView</a>. To bind a render-target view to the pipeline, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-omsetrendertargets">ID3D10Device::OMSetRenderTargets</a>.
 * 
 * A rendertarget is a resource that can be written by the output-merger stage at the end of a render pass. Each render-target should also have a corresponding depth-stencil view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/nn-d3d10-id3d10rendertargetview
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10RenderTargetView extends ID3D10View {
    /**
     * The interface identifier for ID3D10RenderTargetView
     * @type {Guid}
     */
    static IID := Guid("{9b7e4c08-342c-4106-a19f-4f2704f689f0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10RenderTargetView interfaces
    */
    struct Vtbl extends ID3D10View.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10RenderTargetView.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the properties of a render target view. (ID3D10RenderTargetView.GetDesc)
     * @param {Pointer<D3D10_RENDER_TARGET_VIEW_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_render_target_view_desc">D3D10_RENDER_TARGET_VIEW_DESC</a>*</b>
     * 
     * Pointer to the description of a render target view (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_render_target_view_desc">D3D10_RENDER_TARGET_VIEW_DESC</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10rendertargetview-getdesc
     */
    GetDesc(pDesc) {
        ComCall(8, this, D3D10_RENDER_TARGET_VIEW_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D10RenderTargetView.IID.Equals(iid)) {
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
