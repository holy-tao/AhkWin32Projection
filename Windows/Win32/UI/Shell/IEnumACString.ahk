#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IEnumString.ahk" { IEnumString }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IEnumACString extends IEnumString {
    /**
     * The interface identifier for IEnumACString
     * @type {Guid}
     */
    static IID := Guid("{8e74c210-cf9d-4eaf-a403-7356428f0a5a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumACString interfaces
    */
    struct Vtbl extends IEnumString.Vtbl {
        NextItem       : IntPtr
        SetEnumOptions : IntPtr
        GetEnumOptions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumACString.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszUrl 
     * @param {Integer} cchMax 
     * @returns {Integer} 
     */
    NextItem(pszUrl, cchMax) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(7, this, "ptr", pszUrl, "uint", cchMax, "uint*", &pulSortIndex := 0, "HRESULT")
        return pulSortIndex
    }

    /**
     * 
     * @param {Integer} dwOptions 
     * @returns {HRESULT} 
     */
    SetEnumOptions(dwOptions) {
        result := ComCall(8, this, "uint", dwOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetEnumOptions() {
        result := ComCall(9, this, "uint*", &pdwOptions := 0, "HRESULT")
        return pdwOptions
    }

    Query(iid) {
        if (IEnumACString.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NextItem := CallbackCreate(GetMethod(implObj, "NextItem"), flags, 4)
        this.vtbl.SetEnumOptions := CallbackCreate(GetMethod(implObj, "SetEnumOptions"), flags, 2)
        this.vtbl.GetEnumOptions := CallbackCreate(GetMethod(implObj, "GetEnumOptions"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NextItem)
        CallbackFree(this.vtbl.SetEnumOptions)
        CallbackFree(this.vtbl.GetEnumOptions)
    }
}
