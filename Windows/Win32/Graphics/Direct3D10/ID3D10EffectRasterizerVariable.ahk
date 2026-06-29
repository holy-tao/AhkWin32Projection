#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10RasterizerState.ahk" { ID3D10RasterizerState }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D10EffectVariable.ahk" { ID3D10EffectVariable }
#Import ".\D3D10_RASTERIZER_DESC.ahk" { D3D10_RASTERIZER_DESC }

/**
 * A rasterizer-variable interface accesses rasterizer state.
 * @remarks
 * An <b>ID3D10EffectRasterizerVariable Interface</b> is created when an effect is read into memory.
 * 
 * Effect variables are saved in memory in the backing store; when a technique is applied, the values in the backing store are copied to the device. You
 *  can use either of these methods to return state. For examples, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects-set-state">Two Ways to Get the State in an Effect Variable</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nn-d3d10effect-id3d10effectrasterizervariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10EffectRasterizerVariable extends ID3D10EffectVariable {
    /**
     * The interface identifier for ID3D10EffectRasterizerVariable
     * @type {Guid}
     */
    static IID := Guid("{21af9f0e-4d94-4ea9-9785-2cb76b8c0b34}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10EffectRasterizerVariable interfaces
    */
    struct Vtbl extends ID3D10EffectVariable.Vtbl {
        GetRasterizerState : IntPtr
        GetBackingStore    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10EffectRasterizerVariable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get a pointer to a rasterizer interface.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into an array of rasterizer interfaces. If there is only one rasterizer interface, use 0.
     * @returns {ID3D10RasterizerState} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rasterizerstate">ID3D10RasterizerState</a>**</b>
     * 
     * The address of a pointer to a rasterizer interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10rasterizerstate">ID3D10RasterizerState Interface</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectrasterizervariable-getrasterizerstate
     */
    GetRasterizerState(Index) {
        result := ComCall(25, this, "uint", Index, "ptr*", &ppRasterizerState := 0, "HRESULT")
        return ID3D10RasterizerState(ppRasterizerState)
    }

    /**
     * Get a pointer to a variable that contains rasterizer state.
     * @remarks
     * Effect variables are saved in memory in the backing store; when a technique is applied, the values in the backing store are copied to the device. Backing store data can used to recreate the variable when necessary.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into an array of rasterizer-state descriptions. If there is only one rasterizer variable in the effect, use 0.
     * @returns {D3D10_RASTERIZER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_rasterizer_desc">D3D10_RASTERIZER_DESC</a>*</b>
     * 
     * A pointer to a rasterizer-state description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_rasterizer_desc">D3D10_RASTERIZER_DESC</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectrasterizervariable-getbackingstore
     */
    GetBackingStore(Index) {
        pRasterizerDesc := D3D10_RASTERIZER_DESC()
        result := ComCall(26, this, "uint", Index, D3D10_RASTERIZER_DESC.Ptr, pRasterizerDesc, "HRESULT")
        return pRasterizerDesc
    }

    Query(iid) {
        if (ID3D10EffectRasterizerVariable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRasterizerState := CallbackCreate(GetMethod(implObj, "GetRasterizerState"), flags, 3)
        this.vtbl.GetBackingStore := CallbackCreate(GetMethod(implObj, "GetBackingStore"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRasterizerState)
        CallbackFree(this.vtbl.GetBackingStore)
    }
}
