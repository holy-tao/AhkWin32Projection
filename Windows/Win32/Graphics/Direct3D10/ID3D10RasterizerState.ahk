#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10DeviceChild.ahk" { ID3D10DeviceChild }
#Import ".\D3D10_RASTERIZER_DESC.ahk" { D3D10_RASTERIZER_DESC }

/**
 * A rasterizer-state interface accesses rasterizer state for the rasterizer stage.
 * @remarks
 * A rasterizer-state object is created with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createrasterizerstate">ID3D10Device::CreateRasterizerState</a> and bound to the pipeline with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-rssetstate">ID3D10Device::RSSetState</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/nn-d3d10-id3d10rasterizerstate
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10RasterizerState extends ID3D10DeviceChild {
    /**
     * The interface identifier for ID3D10RasterizerState
     * @type {Guid}
     */
    static IID := Guid("{a2a07292-89af-4345-be2e-c53d9fbb6e9f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10RasterizerState interfaces
    */
    struct Vtbl extends ID3D10DeviceChild.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10RasterizerState.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the properties of a rasterizer-state object.
     * @param {Pointer<D3D10_RASTERIZER_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_rasterizer_desc">D3D10_RASTERIZER_DESC</a>*</b>
     * 
     * Pointer to a rasterizer-state description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_rasterizer_desc">D3D10_RASTERIZER_DESC</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10rasterizerstate-getdesc
     */
    GetDesc(pDesc) {
        ComCall(7, this, D3D10_RASTERIZER_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D10RasterizerState.IID.Equals(iid)) {
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
