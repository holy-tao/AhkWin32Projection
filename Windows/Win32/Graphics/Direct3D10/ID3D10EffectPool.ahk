#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10Effect.ahk" { ID3D10Effect }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A pool interface represents a common memory space (or pool) for sharing variables between effects.
 * @remarks
 * To create an effect pool, call a function like <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3dx10createeffectpoolfromfile">D3DX10CreateEffectPoolFromFile</a>. Effect pools can improve performance by reducing the number of API calls required to make state changes (see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-effects-performance">Using Effect Pools</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nn-d3d10effect-id3d10effectpool
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10EffectPool extends IUnknown {
    /**
     * The interface identifier for ID3D10EffectPool
     * @type {Guid}
     */
    static IID := Guid("{9537ab04-3250-412e-8213-fcd2f8677933}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10EffectPool interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AsEffect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10EffectPool.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get the effect that created the effect pool.
     * @returns {ID3D10Effect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effect">ID3D10Effect</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effect">ID3D10Effect Interface</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectpool-aseffect
     */
    AsEffect() {
        result := ComCall(3, this, ID3D10Effect)
        return result
    }

    Query(iid) {
        if (ID3D10EffectPool.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AsEffect := CallbackCreate(GetMethod(implObj, "AsEffect"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AsEffect)
    }
}
