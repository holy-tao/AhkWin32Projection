#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10DeviceChild.ahk" { ID3D10DeviceChild }
#Import ".\D3D10_BLEND_DESC.ahk" { D3D10_BLEND_DESC }

/**
 * This blend-state interface accesses blending state for a Direct3D 10.0 device for the output-merger stage.
 * @remarks
 * Blending combines two pixel values. You have control over how the pixels are blended by using a predefined set of blending operations, as well as preblending operations. The <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">Blending Block Diagram</a> shows conceptually how blending works.
 * 
 * To create a blend-state interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createblendstate">ID3D10Device::CreateBlendState</a>. To initialize the blend state, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-omsetblendstate">ID3D10Device::OMSetBlendState</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/nn-d3d10-id3d10blendstate
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10BlendState extends ID3D10DeviceChild {
    /**
     * The interface identifier for ID3D10BlendState
     * @type {Guid}
     */
    static IID := Guid("{edad8d19-8a35-4d6d-8566-2ea276cde161}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10BlendState interfaces
    */
    struct Vtbl extends ID3D10DeviceChild.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10BlendState.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the blend state. (ID3D10BlendState.GetDesc)
     * @param {Pointer<D3D10_BLEND_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_blend_desc">D3D10_BLEND_DESC</a>*</b>
     * 
     * A pointer to the blend state (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_blend_desc">D3D10_BLEND_DESC</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10blendstate-getdesc
     */
    GetDesc(pDesc) {
        ComCall(7, this, D3D10_BLEND_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D10BlendState.IID.Equals(iid)) {
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
