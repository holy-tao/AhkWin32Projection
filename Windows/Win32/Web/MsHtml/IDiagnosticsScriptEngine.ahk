#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDiagnosticsScriptEngine extends IUnknown {
    /**
     * The interface identifier for IDiagnosticsScriptEngine
     * @type {Guid}
     */
    static IID := Guid("{30510859-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDiagnosticsScriptEngine interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EvaluateScript         : IntPtr
        FireScriptMessageEvent : IntPtr
        Detach                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDiagnosticsScriptEngine.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszScript 
     * @param {PWSTR} pszScriptName 
     * @returns {HRESULT} 
     */
    EvaluateScript(pszScript, pszScriptName) {
        pszScript := pszScript is String ? StrPtr(pszScript) : pszScript
        pszScriptName := pszScriptName is String ? StrPtr(pszScriptName) : pszScriptName

        result := ComCall(3, this, "ptr", pszScript, "ptr", pszScriptName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pszNames 
     * @param {Pointer<PWSTR>} pszValues 
     * @param {Integer} ulPropertyCount 
     * @returns {HRESULT} 
     */
    FireScriptMessageEvent(pszNames, pszValues, ulPropertyCount) {
        pszNamesMarshal := pszNames is VarRef ? "ptr*" : "ptr"
        pszValuesMarshal := pszValues is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pszNamesMarshal, pszNames, pszValuesMarshal, pszValues, "uint", ulPropertyCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Detach() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDiagnosticsScriptEngine.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EvaluateScript := CallbackCreate(GetMethod(implObj, "EvaluateScript"), flags, 3)
        this.vtbl.FireScriptMessageEvent := CallbackCreate(GetMethod(implObj, "FireScriptMessageEvent"), flags, 4)
        this.vtbl.Detach := CallbackCreate(GetMethod(implObj, "Detach"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EvaluateScript)
        CallbackFree(this.vtbl.FireScriptMessageEvent)
        CallbackFree(this.vtbl.Detach)
    }
}
