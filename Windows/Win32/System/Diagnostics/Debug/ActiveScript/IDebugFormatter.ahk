#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Com\TYPEDESC.ahk" { TYPEDESC }
#Import "..\..\..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugFormatter extends IUnknown {
    /**
     * The interface identifier for IDebugFormatter
     * @type {Guid}
     */
    static IID := Guid("{51973c05-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugFormatter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStringForVariant : IntPtr
        GetVariantForString : IntPtr
        GetStringForVarType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugFormatter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvar 
     * @param {Integer} nRadix 
     * @returns {BSTR} 
     */
    GetStringForVariant(pvar, nRadix) {
        pbstrValue := BSTR.Owned()
        result := ComCall(3, this, VARIANT.Ptr, pvar, "uint", nRadix, BSTR.Ptr, pbstrValue, "HRESULT")
        return pbstrValue
    }

    /**
     * 
     * @param {PWSTR} pwstrValue 
     * @returns {VARIANT} 
     */
    GetVariantForString(pwstrValue) {
        pwstrValue := pwstrValue is String ? StrPtr(pwstrValue) : pwstrValue

        pvar := VARIANT()
        result := ComCall(4, this, "ptr", pwstrValue, VARIANT.Ptr, pvar, "HRESULT")
        return pvar
    }

    /**
     * 
     * @param {VARENUM} vt 
     * @param {Pointer<TYPEDESC>} ptdescArrayType 
     * @returns {BSTR} 
     */
    GetStringForVarType(vt, ptdescArrayType) {
        pbstr := BSTR.Owned()
        result := ComCall(5, this, VARENUM, vt, TYPEDESC.Ptr, ptdescArrayType, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    Query(iid) {
        if (IDebugFormatter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStringForVariant := CallbackCreate(GetMethod(implObj, "GetStringForVariant"), flags, 4)
        this.vtbl.GetVariantForString := CallbackCreate(GetMethod(implObj, "GetVariantForString"), flags, 3)
        this.vtbl.GetStringForVarType := CallbackCreate(GetMethod(implObj, "GetStringForVarType"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStringForVariant)
        CallbackFree(this.vtbl.GetVariantForString)
        CallbackFree(this.vtbl.GetStringForVarType)
    }
}
