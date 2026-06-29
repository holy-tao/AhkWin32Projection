#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct INetCfgSysPrep extends IUnknown {
    /**
     * The interface identifier for INetCfgSysPrep
     * @type {Guid}
     */
    static IID := Guid("{c0e8ae98-306e-11d1-aacf-00805fc1270e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetCfgSysPrep interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        HrSetupSetFirstDword        : IntPtr
        HrSetupSetFirstString       : IntPtr
        HrSetupSetFirstStringAsBool : IntPtr
        HrSetupSetFirstMultiSzField : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetCfgSysPrep.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwszSection 
     * @param {PWSTR} pwszKey 
     * @param {Integer} dwValue 
     * @returns {HRESULT} 
     */
    HrSetupSetFirstDword(pwszSection, pwszKey, dwValue) {
        pwszSection := pwszSection is String ? StrPtr(pwszSection) : pwszSection
        pwszKey := pwszKey is String ? StrPtr(pwszKey) : pwszKey

        result := ComCall(3, this, "ptr", pwszSection, "ptr", pwszKey, "uint", dwValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszSection 
     * @param {PWSTR} pwszKey 
     * @param {PWSTR} pwszValue 
     * @returns {HRESULT} 
     */
    HrSetupSetFirstString(pwszSection, pwszKey, pwszValue) {
        pwszSection := pwszSection is String ? StrPtr(pwszSection) : pwszSection
        pwszKey := pwszKey is String ? StrPtr(pwszKey) : pwszKey
        pwszValue := pwszValue is String ? StrPtr(pwszValue) : pwszValue

        result := ComCall(4, this, "ptr", pwszSection, "ptr", pwszKey, "ptr", pwszValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszSection 
     * @param {PWSTR} pwszKey 
     * @param {BOOL} fValue 
     * @returns {HRESULT} 
     */
    HrSetupSetFirstStringAsBool(pwszSection, pwszKey, fValue) {
        pwszSection := pwszSection is String ? StrPtr(pwszSection) : pwszSection
        pwszKey := pwszKey is String ? StrPtr(pwszKey) : pwszKey

        result := ComCall(5, this, "ptr", pwszSection, "ptr", pwszKey, BOOL, fValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszSection 
     * @param {PWSTR} pwszKey 
     * @param {PWSTR} pmszValue 
     * @returns {HRESULT} 
     */
    HrSetupSetFirstMultiSzField(pwszSection, pwszKey, pmszValue) {
        pwszSection := pwszSection is String ? StrPtr(pwszSection) : pwszSection
        pwszKey := pwszKey is String ? StrPtr(pwszKey) : pwszKey
        pmszValue := pmszValue is String ? StrPtr(pmszValue) : pmszValue

        result := ComCall(6, this, "ptr", pwszSection, "ptr", pwszKey, "ptr", pmszValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetCfgSysPrep.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HrSetupSetFirstDword := CallbackCreate(GetMethod(implObj, "HrSetupSetFirstDword"), flags, 4)
        this.vtbl.HrSetupSetFirstString := CallbackCreate(GetMethod(implObj, "HrSetupSetFirstString"), flags, 4)
        this.vtbl.HrSetupSetFirstStringAsBool := CallbackCreate(GetMethod(implObj, "HrSetupSetFirstStringAsBool"), flags, 4)
        this.vtbl.HrSetupSetFirstMultiSzField := CallbackCreate(GetMethod(implObj, "HrSetupSetFirstMultiSzField"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HrSetupSetFirstDword)
        CallbackFree(this.vtbl.HrSetupSetFirstString)
        CallbackFree(this.vtbl.HrSetupSetFirstStringAsBool)
        CallbackFree(this.vtbl.HrSetupSetFirstMultiSzField)
    }
}
