#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1EffectContext1.ahk" { ID2D1EffectContext1 }
#Import "..\Dxgi\Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }
#Import ".\D2D1_SIMPLE_COLOR_PROFILE.ahk" { D2D1_SIMPLE_COLOR_PROFILE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1ColorContext1.ahk" { ID2D1ColorContext1 }

/**
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1EffectContext2 extends ID2D1EffectContext1 {
    /**
     * The interface identifier for ID2D1EffectContext2
     * @type {Guid}
     */
    static IID := Guid("{577ad2a0-9fc7-4dda-8b18-dab810140052}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1EffectContext2 interfaces
    */
    struct Vtbl extends ID2D1EffectContext1.Vtbl {
        CreateColorContextFromDxgiColorSpace     : IntPtr
        CreateColorContextFromSimpleColorProfile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1EffectContext2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {DXGI_COLOR_SPACE_TYPE} colorSpace 
     * @returns {ID2D1ColorContext1} 
     */
    CreateColorContextFromDxgiColorSpace(colorSpace) {
        result := ComCall(25, this, DXGI_COLOR_SPACE_TYPE, colorSpace, "ptr*", &colorContext := 0, "HRESULT")
        return ID2D1ColorContext1(colorContext)
    }

    /**
     * 
     * @param {Pointer<D2D1_SIMPLE_COLOR_PROFILE>} simpleProfile 
     * @returns {ID2D1ColorContext1} 
     */
    CreateColorContextFromSimpleColorProfile(simpleProfile) {
        result := ComCall(26, this, D2D1_SIMPLE_COLOR_PROFILE.Ptr, simpleProfile, "ptr*", &colorContext := 0, "HRESULT")
        return ID2D1ColorContext1(colorContext)
    }

    Query(iid) {
        if (ID2D1EffectContext2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateColorContextFromDxgiColorSpace := CallbackCreate(GetMethod(implObj, "CreateColorContextFromDxgiColorSpace"), flags, 3)
        this.vtbl.CreateColorContextFromSimpleColorProfile := CallbackCreate(GetMethod(implObj, "CreateColorContextFromSimpleColorProfile"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateColorContextFromDxgiColorSpace)
        CallbackFree(this.vtbl.CreateColorContextFromSimpleColorProfile)
    }
}
