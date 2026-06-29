#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WbemObjectTextFormatEnum.ahk" { WbemObjectTextFormatEnum }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISWbemPropertySet.ahk" { ISWbemPropertySet }
#Import ".\ISWbemObject.ahk" { ISWbemObject }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct ISWbemObjectEx extends ISWbemObject {
    /**
     * The interface identifier for ISWbemObjectEx
     * @type {Guid}
     */
    static IID := Guid("{269ad56a-8a67-4129-bc8c-0506dcfe9880}")

    /**
     * The class identifier for SWbemObjectEx
     * @type {Guid}
     */
    static CLSID := Guid("{d6bdafb2-9435-491f-bb87-6aa0f0bc31a2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISWbemObjectEx interfaces
    */
    struct Vtbl extends ISWbemObject.Vtbl {
        Refresh_              : IntPtr
        get_SystemProperties_ : IntPtr
        GetText_              : IntPtr
        SetFromText_          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISWbemObjectEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISWbemPropertySet} 
     */
    SystemProperties_ {
        get => this.get_SystemProperties_()
    }

    /**
     * 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {HRESULT} 
     */
    Refresh_(iFlags, objWbemNamedValueSet) {
        result := ComCall(32, this, "int", iFlags, "ptr", objWbemNamedValueSet, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISWbemPropertySet} 
     */
    get_SystemProperties_() {
        result := ComCall(33, this, "ptr*", &objWbemPropertySet := 0, "HRESULT")
        return ISWbemPropertySet(objWbemPropertySet)
    }

    /**
     * 
     * @param {WbemObjectTextFormatEnum} iObjectTextFormat 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {BSTR} 
     */
    GetText_(iObjectTextFormat, iFlags, objWbemNamedValueSet) {
        bsText := BSTR.Owned()
        result := ComCall(34, this, WbemObjectTextFormatEnum, iObjectTextFormat, "int", iFlags, "ptr", objWbemNamedValueSet, BSTR.Ptr, bsText, "HRESULT")
        return bsText
    }

    /**
     * 
     * @param {BSTR} bsText 
     * @param {WbemObjectTextFormatEnum} iObjectTextFormat 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {HRESULT} 
     */
    SetFromText_(bsText, iObjectTextFormat, iFlags, objWbemNamedValueSet) {
        bsText := bsText is String ? BSTR.Alloc(bsText).Value : bsText

        result := ComCall(35, this, BSTR, bsText, WbemObjectTextFormatEnum, iObjectTextFormat, "int", iFlags, "ptr", objWbemNamedValueSet, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISWbemObjectEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Refresh_ := CallbackCreate(GetMethod(implObj, "Refresh_"), flags, 3)
        this.vtbl.get_SystemProperties_ := CallbackCreate(GetMethod(implObj, "get_SystemProperties_"), flags, 2)
        this.vtbl.GetText_ := CallbackCreate(GetMethod(implObj, "GetText_"), flags, 5)
        this.vtbl.SetFromText_ := CallbackCreate(GetMethod(implObj, "SetFromText_"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Refresh_)
        CallbackFree(this.vtbl.get_SystemProperties_)
        CallbackFree(this.vtbl.GetText_)
        CallbackFree(this.vtbl.SetFromText_)
    }
}
