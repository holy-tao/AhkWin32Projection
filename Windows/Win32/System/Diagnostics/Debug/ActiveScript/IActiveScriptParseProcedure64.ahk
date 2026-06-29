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
export default struct IActiveScriptParseProcedure64 extends IUnknown {
    /**
     * The interface identifier for IActiveScriptParseProcedure64
     * @type {Guid}
     */
    static IID := Guid("{c64713b6-e029-4cc5-9200-438b72890b6a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptParseProcedure64 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ParseProcedureText : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptParseProcedure64.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pstrCode 
     * @param {PWSTR} pstrFormalParams 
     * @param {PWSTR} pstrProcedureName 
     * @param {PWSTR} pstrItemName 
     * @param {IUnknown} punkContext 
     * @param {PWSTR} pstrDelimiter 
     * @param {Integer} dwSourceContextCookie 
     * @param {Integer} ulStartingLineNumber 
     * @param {Integer} dwFlags 
     * @returns {IDispatch} 
     */
    ParseProcedureText(pstrCode, pstrFormalParams, pstrProcedureName, pstrItemName, punkContext, pstrDelimiter, dwSourceContextCookie, ulStartingLineNumber, dwFlags) {
        pstrCode := pstrCode is String ? StrPtr(pstrCode) : pstrCode
        pstrFormalParams := pstrFormalParams is String ? StrPtr(pstrFormalParams) : pstrFormalParams
        pstrProcedureName := pstrProcedureName is String ? StrPtr(pstrProcedureName) : pstrProcedureName
        pstrItemName := pstrItemName is String ? StrPtr(pstrItemName) : pstrItemName
        pstrDelimiter := pstrDelimiter is String ? StrPtr(pstrDelimiter) : pstrDelimiter

        result := ComCall(3, this, "ptr", pstrCode, "ptr", pstrFormalParams, "ptr", pstrProcedureName, "ptr", pstrItemName, "ptr", punkContext, "ptr", pstrDelimiter, "uint", dwSourceContextCookie, "uint", ulStartingLineNumber, "uint", dwFlags, "ptr*", &ppdisp := 0, "HRESULT")
        return IDispatch(ppdisp)
    }

    Query(iid) {
        if (IActiveScriptParseProcedure64.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ParseProcedureText := CallbackCreate(GetMethod(implObj, "ParseProcedureText"), flags, 11)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ParseProcedureText)
    }
}
