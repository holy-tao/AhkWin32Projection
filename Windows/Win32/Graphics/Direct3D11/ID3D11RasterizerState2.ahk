#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_RASTERIZER_DESC2.ahk" { D3D11_RASTERIZER_DESC2 }
#Import ".\ID3D11RasterizerState1.ahk" { ID3D11RasterizerState1 }

/**
 * The rasterizer-state interface holds a description for rasterizer state that you can bind to the rasterizer stage. This rasterizer-state interface supports forced sample count and conservative rasterization mode.
 * @remarks
 * To create a rasterizer-state object, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createrasterizerstate2">ID3D11Device3::CreateRasterizerState2</a>. To bind the rasterizer-state object to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-rasterizer-stage">rasterizer stage</a>, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-rssetstate">ID3D11DeviceContext::RSSetState</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11rasterizerstate2
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11RasterizerState2 extends ID3D11RasterizerState1 {
    /**
     * The interface identifier for ID3D11RasterizerState2
     * @type {Guid}
     */
    static IID := Guid("{6fbd02fb-209f-46c4-b059-2ed15586a6ac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11RasterizerState2 interfaces
    */
    struct Vtbl extends ID3D11RasterizerState1.Vtbl {
        GetDesc2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11RasterizerState2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the description for rasterizer state that you used to create the rasterizer-state object. (ID3D11RasterizerState2.GetDesc2)
     * @remarks
     * You use the description for rasterizer state in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createrasterizerstate2">ID3D11Device3::CreateRasterizerState2</a> method to create the rasterizer-state object.
     * @param {Pointer<D3D11_RASTERIZER_DESC2>} pDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_rasterizer_desc2">D3D11_RASTERIZER_DESC2</a> structure that receives a description of the rasterizer state. This rasterizer state can specify forced sample count and conservative rasterization mode.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11rasterizerstate2-getdesc2
     */
    GetDesc2(pDesc) {
        ComCall(9, this, D3D11_RASTERIZER_DESC2.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D11RasterizerState2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc2 := CallbackCreate(GetMethod(implObj, "GetDesc2"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc2)
    }
}
