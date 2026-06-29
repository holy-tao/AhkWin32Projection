#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10DeviceChild.ahk" { ID3D10DeviceChild }
#Import ".\D3D10_SAMPLER_DESC.ahk" { D3D10_SAMPLER_DESC }

/**
 * A sampler-state interface accesses sampler state for a texture.
 * @remarks
 * Create a sampler-state object by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createsamplerstate">ID3D10Device::CreateSamplerState</a>.
 * 
 * To initialize sampler state, bind the sampler-state object to the pipeline by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-vssetsamplers">ID3D10Device::VSSetSamplers</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-gssetsamplers">ID3D10Device::GSSetSamplers</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-pssetsamplers">ID3D10Device::PSSetSamplers</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/nn-d3d10-id3d10samplerstate
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10SamplerState extends ID3D10DeviceChild {
    /**
     * The interface identifier for ID3D10SamplerState
     * @type {Guid}
     */
    static IID := Guid("{9b7e4c0c-342c-4106-a19f-4f2704f689f0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10SamplerState interfaces
    */
    struct Vtbl extends ID3D10DeviceChild.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10SamplerState.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the sampler state.
     * @param {Pointer<D3D10_SAMPLER_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_sampler_desc">D3D10_SAMPLER_DESC</a>*</b>
     * 
     * A pointer to the sampler state (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_sampler_desc">D3D10_SAMPLER_DESC</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10samplerstate-getdesc
     */
    GetDesc(pDesc) {
        ComCall(7, this, D3D10_SAMPLER_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D10SamplerState.IID.Equals(iid)) {
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
