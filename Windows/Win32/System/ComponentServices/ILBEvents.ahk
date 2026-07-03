#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ILBEvents extends IUnknown {
    /**
     * The interface identifier for ILBEvents
     * @type {Guid}
     */
    static IID := Guid("{683130b4-2e50-11d2-98a5-00c04f8ee1c4}")

    /**
     * The class identifier for LBEvents
     * @type {Guid}
     */
    static CLSID := Guid("{ecabb0c1-7f19-11d2-978e-0000f8757e2a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILBEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        TargetUp      : IntPtr
        TargetDown    : IntPtr
        EngineDefined : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILBEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrServerName 
     * @param {BSTR} bstrClsidEng 
     * @returns {HRESULT} 
     */
    TargetUp(bstrServerName, bstrClsidEng) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName
        bstrClsidEng := bstrClsidEng is String ? BSTR.Alloc(bstrClsidEng).Value : bstrClsidEng

        result := ComCall(3, this, BSTR, bstrServerName, BSTR, bstrClsidEng, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrServerName 
     * @param {BSTR} bstrClsidEng 
     * @returns {HRESULT} 
     */
    TargetDown(bstrServerName, bstrClsidEng) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName
        bstrClsidEng := bstrClsidEng is String ? BSTR.Alloc(bstrClsidEng).Value : bstrClsidEng

        result := ComCall(4, this, BSTR, bstrServerName, BSTR, bstrClsidEng, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropName 
     * @param {Pointer<VARIANT>} varPropValue 
     * @param {BSTR} bstrClsidEng 
     * @returns {HRESULT} 
     */
    EngineDefined(bstrPropName, varPropValue, bstrClsidEng) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName
        bstrClsidEng := bstrClsidEng is String ? BSTR.Alloc(bstrClsidEng).Value : bstrClsidEng

        result := ComCall(5, this, BSTR, bstrPropName, VARIANT.Ptr, varPropValue, BSTR, bstrClsidEng, "HRESULT")
        return result
    }

    Query(iid) {
        if (ILBEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.TargetUp := CallbackCreate(GetMethod(implObj, "TargetUp"), flags, 3)
        this.vtbl.TargetDown := CallbackCreate(GetMethod(implObj, "TargetDown"), flags, 3)
        this.vtbl.EngineDefined := CallbackCreate(GetMethod(implObj, "EngineDefined"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.TargetUp)
        CallbackFree(this.vtbl.TargetDown)
        CallbackFree(this.vtbl.EngineDefined)
    }
}
