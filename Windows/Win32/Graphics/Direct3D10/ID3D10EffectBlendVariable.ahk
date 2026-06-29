#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D10BlendState.ahk" { ID3D10BlendState }
#Import ".\ID3D10EffectVariable.ahk" { ID3D10EffectVariable }
#Import ".\D3D10_BLEND_DESC.ahk" { D3D10_BLEND_DESC }

/**
 * The blend-variable interface accesses blend state.
 * @remarks
 * An <b>ID3D10EffectBlendVariable Interface</b> is created when an effect is read into memory.
 * 
 * Effect variables are saved in memory in the backing store; when a technique is applied, the values in the backing store are copied to the device. You
 *  can use either of these methods to return state. For examples, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects-set-state">Two Ways to Get the State in an Effect Variable</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nn-d3d10effect-id3d10effectblendvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10EffectBlendVariable extends ID3D10EffectVariable {
    /**
     * The interface identifier for ID3D10EffectBlendVariable
     * @type {Guid}
     */
    static IID := Guid("{1fcd2294-df6d-4eae-86b3-0e9160cfb07b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10EffectBlendVariable interfaces
    */
    struct Vtbl extends ID3D10EffectVariable.Vtbl {
        GetBlendState   : IntPtr
        GetBackingStore : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10EffectBlendVariable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get a pointer to a blend-state interface.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into an array of blend-state interfaces. If there is only one blend-state interface, use 0.
     * @returns {ID3D10BlendState} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10blendstate">ID3D10BlendState</a>**</b>
     * 
     * The address of a pointer to a blend-state interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10blendstate">ID3D10BlendState Interface</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectblendvariable-getblendstate
     */
    GetBlendState(Index) {
        result := ComCall(25, this, "uint", Index, "ptr*", &ppBlendState := 0, "HRESULT")
        return ID3D10BlendState(ppBlendState)
    }

    /**
     * Get a pointer to a blend-state variable.
     * @remarks
     * Effect variables are saved in memory in the backing store; when a technique is applied, the values in the backing store are copied to the device. Backing store data can used to recreate the variable when necessary.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into an array of blend-state descriptions. If there is only one blend-state variable in the effect, use 0.
     * @param {Pointer<D3D10_BLEND_DESC>} pBlendDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_blend_desc">D3D10_BLEND_DESC</a>*</b>
     * 
     * A pointer to a blend-state description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_blend_desc">D3D10_BLEND_DESC</a>).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectblendvariable-getbackingstore
     */
    GetBackingStore(Index, pBlendDesc) {
        result := ComCall(26, this, "uint", Index, D3D10_BLEND_DESC.Ptr, pBlendDesc, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D10EffectBlendVariable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBlendState := CallbackCreate(GetMethod(implObj, "GetBlendState"), flags, 3)
        this.vtbl.GetBackingStore := CallbackCreate(GetMethod(implObj, "GetBackingStore"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBlendState)
        CallbackFree(this.vtbl.GetBackingStore)
    }
}
