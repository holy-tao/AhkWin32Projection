#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IWMFrameInterpProps extends IUnknown {
    /**
     * The interface identifier for IWMFrameInterpProps
     * @type {Guid}
     */
    static IID := Guid("{4c06bb9b-626c-4614-8329-cc6a21b93fa0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMFrameInterpProps interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetFrameRateIn        : IntPtr
        SetFrameRateOut       : IntPtr
        SetFrameInterpEnabled : IntPtr
        SetComplexityLevel    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMFrameInterpProps.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} lFrameRate 
     * @param {Integer} lScale 
     * @returns {HRESULT} 
     */
    SetFrameRateIn(lFrameRate, lScale) {
        result := ComCall(3, this, "int", lFrameRate, "int", lScale, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFrameRate 
     * @param {Integer} lScale 
     * @returns {HRESULT} 
     */
    SetFrameRateOut(lFrameRate, lScale) {
        result := ComCall(4, this, "int", lFrameRate, "int", lScale, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bFIEnabled 
     * @returns {HRESULT} 
     */
    SetFrameInterpEnabled(bFIEnabled) {
        result := ComCall(5, this, BOOL, bFIEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iComplexity 
     * @returns {HRESULT} 
     */
    SetComplexityLevel(iComplexity) {
        result := ComCall(6, this, "int", iComplexity, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMFrameInterpProps.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFrameRateIn := CallbackCreate(GetMethod(implObj, "SetFrameRateIn"), flags, 3)
        this.vtbl.SetFrameRateOut := CallbackCreate(GetMethod(implObj, "SetFrameRateOut"), flags, 3)
        this.vtbl.SetFrameInterpEnabled := CallbackCreate(GetMethod(implObj, "SetFrameInterpEnabled"), flags, 2)
        this.vtbl.SetComplexityLevel := CallbackCreate(GetMethod(implObj, "SetComplexityLevel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFrameRateIn)
        CallbackFree(this.vtbl.SetFrameRateOut)
        CallbackFree(this.vtbl.SetFrameInterpEnabled)
        CallbackFree(this.vtbl.SetComplexityLevel)
    }
}
