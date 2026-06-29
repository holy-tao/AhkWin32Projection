#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11DeviceChild.ahk" { ID3D11DeviceChild }
#Import ".\D3D11_BLEND_DESC.ahk" { D3D11_BLEND_DESC }

/**
 * The blend-state interface holds a description for blending state that you can bind to the output-merger stage.
 * @remarks
 * Blending applies a simple function to combine output values from a pixel shader with data in a render target. You have control over how the pixels are blended by using a predefined set of blending operations and preblending operations.
 * 
 * To create a blend-state object, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createblendstate">ID3D11Device::CreateBlendState</a>. To bind the blend-state object to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">output-merger stage</a>, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetblendstate">ID3D11DeviceContext::OMSetBlendState</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11blendstate
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11BlendState extends ID3D11DeviceChild {
    /**
     * The interface identifier for ID3D11BlendState
     * @type {Guid}
     */
    static IID := Guid("{75b68faa-347d-4159-8f45-a0640f01cd9a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11BlendState interfaces
    */
    struct Vtbl extends ID3D11DeviceChild.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11BlendState.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the description for blending state that you used to create the blend-state object. (ID3D11BlendState.GetDesc)
     * @remarks
     * You use the description for blending state in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createblendstate">ID3D11Device::CreateBlendState</a> method to create the blend-state object.
     * @param {Pointer<D3D11_BLEND_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_blend_desc">D3D11_BLEND_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_blend_desc">D3D11_BLEND_DESC</a> structure that receives a description of the blend state.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11blendstate-getdesc
     */
    GetDesc(pDesc) {
        ComCall(7, this, D3D11_BLEND_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D11BlendState.IID.Equals(iid)) {
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
