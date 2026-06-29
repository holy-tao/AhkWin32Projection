#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11DeviceChild.ahk" { ID3D11DeviceChild }
#Import ".\D3D11_DEPTH_STENCIL_DESC.ahk" { D3D11_DEPTH_STENCIL_DESC }

/**
 * The depth-stencil-state interface holds a description for depth-stencil state that you can bind to the output-merger stage.
 * @remarks
 * To create a depth-stencil-state object, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createdepthstencilstate">ID3D11Device::CreateDepthStencilState</a>. To bind the depth-stencil-state object to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">output-merger stage</a>, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetdepthstencilstate">ID3D11DeviceContext::OMSetDepthStencilState</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11depthstencilstate
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11DepthStencilState extends ID3D11DeviceChild {
    /**
     * The interface identifier for ID3D11DepthStencilState
     * @type {Guid}
     */
    static IID := Guid("{03823efb-8d8f-4e1c-9aa2-f64bb2cbfdf1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11DepthStencilState interfaces
    */
    struct Vtbl extends ID3D11DeviceChild.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11DepthStencilState.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the description for depth-stencil state that you used to create the depth-stencil-state object.
     * @remarks
     * You use the description for depth-stencil state in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createdepthstencilstate">ID3D11Device::CreateDepthStencilState</a> method to create the depth-stencil-state object.
     * @param {Pointer<D3D11_DEPTH_STENCIL_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_desc">D3D11_DEPTH_STENCIL_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_desc">D3D11_DEPTH_STENCIL_DESC</a> structure that receives a description of the depth-stencil state.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11depthstencilstate-getdesc
     */
    GetDesc(pDesc) {
        ComCall(7, this, D3D11_DEPTH_STENCIL_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D11DepthStencilState.IID.Equals(iid)) {
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
