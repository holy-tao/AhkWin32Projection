#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptAuthorProcedure extends IUnknown {
    /**
     * The interface identifier for IActiveScriptAuthorProcedure
     * @type {Guid}
     */
    static IID := Guid("{7e2d4b70-bd9a-11d0-9336-00a0c90dcaa9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptAuthorProcedure interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ParseProcedureText : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptAuthorProcedure.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszCode 
     * @param {PWSTR} pszFormalParams 
     * @param {PWSTR} pszProcedureName 
     * @param {PWSTR} pszItemName 
     * @param {PWSTR} pszDelimiter 
     * @param {Integer} dwCookie 
     * @param {Integer} dwFlags 
     * @param {IDispatch} pdispFor 
     * @returns {HRESULT} 
     */
    ParseProcedureText(pszCode, pszFormalParams, pszProcedureName, pszItemName, pszDelimiter, dwCookie, dwFlags, pdispFor) {
        pszCode := pszCode is String ? StrPtr(pszCode) : pszCode
        pszFormalParams := pszFormalParams is String ? StrPtr(pszFormalParams) : pszFormalParams
        pszProcedureName := pszProcedureName is String ? StrPtr(pszProcedureName) : pszProcedureName
        pszItemName := pszItemName is String ? StrPtr(pszItemName) : pszItemName
        pszDelimiter := pszDelimiter is String ? StrPtr(pszDelimiter) : pszDelimiter

        result := ComCall(3, this, "ptr", pszCode, "ptr", pszFormalParams, "ptr", pszProcedureName, "ptr", pszItemName, "ptr", pszDelimiter, "uint", dwCookie, "uint", dwFlags, "ptr", pdispFor, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveScriptAuthorProcedure.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ParseProcedureText := CallbackCreate(GetMethod(implObj, "ParseProcedureText"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ParseProcedureText)
    }
}
