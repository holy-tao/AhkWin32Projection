#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11DeviceChild.ahk" { ID3D11DeviceChild }
#Import ".\D3D11_SAMPLER_DESC.ahk" { D3D11_SAMPLER_DESC }

/**
 * The sampler-state interface holds a description for sampler state that you can bind to any shader stage of the pipeline for reference by texture sample operations.
 * @remarks
 * To create a sampler-state object, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createsamplerstate">ID3D11Device::CreateSamplerState</a>.
 * 
 * To bind a sampler-state object to any <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-graphics-pipeline">pipeline</a> shader stage, call the following methods:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-vssetsamplers">ID3D11DeviceContext::VSSetSamplers</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-hssetsamplers">ID3D11DeviceContext::HSSetSamplers</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dssetsamplers">ID3D11DeviceContext::DSSetSamplers</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-gssetsamplers">ID3D11DeviceContext::GSSetSamplers</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-pssetsamplers">ID3D11DeviceContext::PSSetSamplers</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-cssetsamplers">ID3D11DeviceContext::CSSetSamplers</a>
 * </li>
 * </ul>
 * You can bind the same sampler-state object to multiple shader stages simultaneously.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11samplerstate
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11SamplerState extends ID3D11DeviceChild {
    /**
     * The interface identifier for ID3D11SamplerState
     * @type {Guid}
     */
    static IID := Guid("{da6fea51-564c-4487-9810-f0d0f9b4e3a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11SamplerState interfaces
    */
    struct Vtbl extends ID3D11DeviceChild.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11SamplerState.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the description for sampler state that you used to create the sampler-state object.
     * @remarks
     * You use the description for sampler state in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createsamplerstate">ID3D11Device::CreateSamplerState</a> method to create the sampler-state object.
     * @param {Pointer<D3D11_SAMPLER_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_sampler_desc">D3D11_SAMPLER_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_sampler_desc">D3D11_SAMPLER_DESC</a> structure that receives a description of the sampler state.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11samplerstate-getdesc
     */
    GetDesc(pDesc) {
        ComCall(7, this, D3D11_SAMPLER_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D11SamplerState.IID.Equals(iid)) {
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
