#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Diagnostics\Debug\ActiveScript\IActiveScriptError.ahk" { IActiveScriptError }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDiagnosticsScriptEngineSite extends IUnknown {
    /**
     * The interface identifier for IDiagnosticsScriptEngineSite
     * @type {Guid}
     */
    static IID := Guid("{30510858-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDiagnosticsScriptEngineSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnMessage     : IntPtr
        OnScriptError : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDiagnosticsScriptEngineSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pszData 
     * @param {Integer} ulDataCount 
     * @returns {HRESULT} 
     */
    OnMessage(pszData, ulDataCount) {
        pszDataMarshal := pszData is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pszDataMarshal, pszData, "uint", ulDataCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IActiveScriptError} pScriptError 
     * @returns {HRESULT} 
     */
    OnScriptError(pScriptError) {
        result := ComCall(4, this, "ptr", pScriptError, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDiagnosticsScriptEngineSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnMessage := CallbackCreate(GetMethod(implObj, "OnMessage"), flags, 3)
        this.vtbl.OnScriptError := CallbackCreate(GetMethod(implObj, "OnScriptError"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnMessage)
        CallbackFree(this.vtbl.OnScriptError)
    }
}
