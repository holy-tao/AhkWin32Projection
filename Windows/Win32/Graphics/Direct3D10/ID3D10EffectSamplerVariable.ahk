#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D10_SAMPLER_DESC.ahk" { D3D10_SAMPLER_DESC }
#Import ".\ID3D10SamplerState.ahk" { ID3D10SamplerState }
#Import ".\ID3D10EffectVariable.ahk" { ID3D10EffectVariable }

/**
 * A sampler interface accesses sampler state.
 * @remarks
 * An <b>ID3D10EffectSamplerVariable Interface</b> is created when an effect is read into memory.
 * 
 * Effect variables are saved in memory in the backing store; when a technique is applied, the values in the backing store are copied to the device. You
 *  can use either of these methods to return state. For examples, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects-set-state">Two Ways to Get the State in an Effect Variable</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nn-d3d10effect-id3d10effectsamplervariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10EffectSamplerVariable extends ID3D10EffectVariable {
    /**
     * The interface identifier for ID3D10EffectSamplerVariable
     * @type {Guid}
     */
    static IID := Guid("{6530d5c7-07e9-4271-a418-e7ce4bd1e480}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10EffectSamplerVariable interfaces
    */
    struct Vtbl extends ID3D10EffectVariable.Vtbl {
        GetSampler      : IntPtr
        GetBackingStore : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10EffectSamplerVariable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get a pointer to a sampler interface.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into an array of sampler interfaces. If there is only one sampler interface, use 0.
     * @returns {ID3D10SamplerState} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10samplerstate">ID3D10SamplerState</a>**</b>
     * 
     * The address of a pointer to a sampler interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10samplerstate">ID3D10SamplerState Interface</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectsamplervariable-getsampler
     */
    GetSampler(Index) {
        result := ComCall(25, this, "uint", Index, "ptr*", &ppSampler := 0, "HRESULT")
        return ID3D10SamplerState(ppSampler)
    }

    /**
     * Get a pointer to a variable that contains sampler state.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index into an array of sampler descriptions. If there is only one sampler variable in the effect, use 0.
     * @returns {D3D10_SAMPLER_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_sampler_desc">D3D10_SAMPLER_DESC</a>*</b>
     * 
     * A pointer to a sampler description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_sampler_desc">D3D10_SAMPLER_DESC</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectsamplervariable-getbackingstore
     */
    GetBackingStore(Index) {
        pSamplerDesc := D3D10_SAMPLER_DESC()
        result := ComCall(26, this, "uint", Index, D3D10_SAMPLER_DESC.Ptr, pSamplerDesc, "HRESULT")
        return pSamplerDesc
    }

    Query(iid) {
        if (ID3D10EffectSamplerVariable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSampler := CallbackCreate(GetMethod(implObj, "GetSampler"), flags, 3)
        this.vtbl.GetBackingStore := CallbackCreate(GetMethod(implObj, "GetBackingStore"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSampler)
        CallbackFree(this.vtbl.GetBackingStore)
    }
}
