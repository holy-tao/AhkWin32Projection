#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10DepthStencilState.ahk" { ID3D10DepthStencilState }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D10_DEPTH_STENCIL_DESC.ahk" { D3D10_DEPTH_STENCIL_DESC }
#Import ".\ID3D10EffectVariable.ahk" { ID3D10EffectVariable }

/**
 * A depth-stencil-variable interface accesses depth-stencil state.
 * @remarks
 * An <b>ID3D10EffectDepthStencilVariable Interface</b> is created when an effect is read into memory.
 * 
 * Effect variables are saved in memory in the backing store; when a technique is applied, the values in the backing store are copied to the device. You
 *  can use either of these methods to return state. For examples, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects-set-state">Two Ways to Get the State in an Effect Variable</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nn-d3d10effect-id3d10effectdepthstencilvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10EffectDepthStencilVariable extends ID3D10EffectVariable {
    /**
     * The interface identifier for ID3D10EffectDepthStencilVariable
     * @type {Guid}
     */
    static IID := Guid("{af482368-330a-46a5-9a5c-01c71af24c8d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10EffectDepthStencilVariable interfaces
    */
    struct Vtbl extends ID3D10EffectVariable.Vtbl {
        GetDepthStencilState : IntPtr
        GetBackingStore      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10EffectDepthStencilVariable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get a pointer to a depth-stencil interface.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into an array of depth-stencil interfaces. If there is only one depth-stencil interface, use 0.
     * @returns {ID3D10DepthStencilState} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilstate">ID3D10DepthStencilState</a>**</b>
     * 
     * The address of a pointer to a blend-state interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10depthstencilstate">ID3D10DepthStencilState Interface</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectdepthstencilvariable-getdepthstencilstate
     */
    GetDepthStencilState(Index) {
        result := ComCall(25, this, "uint", Index, "ptr*", &ppDepthStencilState := 0, "HRESULT")
        return ID3D10DepthStencilState(ppDepthStencilState)
    }

    /**
     * Get a pointer to a variable that contains depth-stencil state.
     * @remarks
     * Effect variables are saved in memory in the backing store; when a technique is applied, the values in the backing store are copied to the device. Backing store data can used to recreate the variable when necessary.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into an array of depth-stencil-state descriptions. If there is only one depth-stencil variable in the effect, use 0.
     * @returns {D3D10_DEPTH_STENCIL_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_depth_stencil_desc">D3D10_DEPTH_STENCIL_DESC</a>*</b>
     * 
     * A pointer to a depth-stencil-state description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_depth_stencil_desc">D3D10_DEPTH_STENCIL_DESC</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectdepthstencilvariable-getbackingstore
     */
    GetBackingStore(Index) {
        pDepthStencilDesc := D3D10_DEPTH_STENCIL_DESC()
        result := ComCall(26, this, "uint", Index, D3D10_DEPTH_STENCIL_DESC.Ptr, pDepthStencilDesc, "HRESULT")
        return pDepthStencilDesc
    }

    Query(iid) {
        if (ID3D10EffectDepthStencilVariable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDepthStencilState := CallbackCreate(GetMethod(implObj, "GetDepthStencilState"), flags, 3)
        this.vtbl.GetBackingStore := CallbackCreate(GetMethod(implObj, "GetBackingStore"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDepthStencilState)
        CallbackFree(this.vtbl.GetBackingStore)
    }
}
