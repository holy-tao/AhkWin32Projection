#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10DeviceChild.ahk" { ID3D10DeviceChild }
#Import ".\D3D10_DEPTH_STENCIL_DESC.ahk" { D3D10_DEPTH_STENCIL_DESC }

/**
 * A depth-stencil-state interface accesses depth-stencil state which sets up the depth-stencil test for the output-merger stage.
 * @remarks
 * Create a depth-stencil state object by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createdepthstencilstate">ID3D10Device::CreateDepthStencilState</a>.
 * 
 * To initialize depth-stencil state, bind the depth-stencil-state object to the pipeline by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-omsetdepthstencilstate">ID3D10Device::OMSetDepthStencilState</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/nn-d3d10-id3d10depthstencilstate
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10DepthStencilState extends ID3D10DeviceChild {
    /**
     * The interface identifier for ID3D10DepthStencilState
     * @type {Guid}
     */
    static IID := Guid("{2b4b1cc8-a4ad-41f8-8322-ca86fc3ec675}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10DepthStencilState interfaces
    */
    struct Vtbl extends ID3D10DeviceChild.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10DepthStencilState.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the depth-stencil state.
     * @param {Pointer<D3D10_DEPTH_STENCIL_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_depth_stencil_desc">D3D10_DEPTH_STENCIL_DESC</a>*</b>
     * 
     * A pointer to the depth-stencil state (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_depth_stencil_desc">D3D10_DEPTH_STENCIL_DESC</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10depthstencilstate-getdesc
     */
    GetDesc(pDesc) {
        ComCall(7, this, D3D10_DEPTH_STENCIL_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D10DepthStencilState.IID.Equals(iid)) {
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
