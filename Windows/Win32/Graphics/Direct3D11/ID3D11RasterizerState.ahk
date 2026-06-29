#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11DeviceChild.ahk" { ID3D11DeviceChild }
#Import ".\D3D11_RASTERIZER_DESC.ahk" { D3D11_RASTERIZER_DESC }

/**
 * The rasterizer-state interface holds a description for rasterizer state that you can bind to the rasterizer stage.
 * @remarks
 * To create a rasterizer-state object, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createrasterizerstate">ID3D11Device::CreateRasterizerState</a>. To bind the rasterizer-state object to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-rasterizer-stage">rasterizer stage</a>, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-rssetstate">ID3D11DeviceContext::RSSetState</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11rasterizerstate
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11RasterizerState extends ID3D11DeviceChild {
    /**
     * The interface identifier for ID3D11RasterizerState
     * @type {Guid}
     */
    static IID := Guid("{9bb4ab81-ab1a-4d8f-b506-fc04200b6ee7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11RasterizerState interfaces
    */
    struct Vtbl extends ID3D11DeviceChild.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11RasterizerState.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the description for rasterizer state that you used to create the rasterizer-state object. (ID3D11RasterizerState.GetDesc)
     * @remarks
     * You use the description for rasterizer state in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createrasterizerstate">ID3D11Device::CreateRasterizerState</a> method to create the rasterizer-state object.
     * @param {Pointer<D3D11_RASTERIZER_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_rasterizer_desc">D3D11_RASTERIZER_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_rasterizer_desc">D3D11_RASTERIZER_DESC</a> structure that receives a description of the rasterizer state.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11rasterizerstate-getdesc
     */
    GetDesc(pDesc) {
        ComCall(7, this, D3D11_RASTERIZER_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D11RasterizerState.IID.Equals(iid)) {
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
