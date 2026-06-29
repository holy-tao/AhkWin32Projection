#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAnalogRadioTuningSpace.ahk" { IAnalogRadioTuningSpace }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * This topic applies to Windows XP Media Center Edition 2004 and later.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IAnalogRadioTuningSpace2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ianalogradiotuningspace2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IAnalogRadioTuningSpace2 extends IAnalogRadioTuningSpace {
    /**
     * The interface identifier for IAnalogRadioTuningSpace2
     * @type {Guid}
     */
    static IID := Guid("{39dd45da-2da8-46ba-8a8a-87e2b73d983a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAnalogRadioTuningSpace2 interfaces
    */
    struct Vtbl extends IAnalogRadioTuningSpace.Vtbl {
        get_CountryCode : IntPtr
        put_CountryCode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAnalogRadioTuningSpace2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    CountryCode {
        get => this.get_CountryCode()
        set => this.put_CountryCode(value)
    }

    /**
     * This topic applies to Windows XP Media Center Edition 2004 and later.
     * @returns {Integer} Pointer to a variable that receives the country/region code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogradiotuningspace2-get_countrycode
     */
    get_CountryCode() {
        result := ComCall(32, this, "int*", &CountryCodeVal := 0, "HRESULT")
        return CountryCodeVal
    }

    /**
     * This topic applies to Windows XP Media Center Edition 2004 and later.
     * @param {Integer} NewCountryCodeVal The country/region code.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved by using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogradiotuningspace2-put_countrycode
     */
    put_CountryCode(NewCountryCodeVal) {
        result := ComCall(33, this, "int", NewCountryCodeVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAnalogRadioTuningSpace2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CountryCode := CallbackCreate(GetMethod(implObj, "get_CountryCode"), flags, 2)
        this.vtbl.put_CountryCode := CallbackCreate(GetMethod(implObj, "put_CountryCode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CountryCode)
        CallbackFree(this.vtbl.put_CountryCode)
    }
}
