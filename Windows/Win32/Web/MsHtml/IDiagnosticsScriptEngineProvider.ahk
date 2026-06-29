#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDiagnosticsScriptEngineSite.ahk" { IDiagnosticsScriptEngineSite }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDiagnosticsScriptEngine.ahk" { IDiagnosticsScriptEngine }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDiagnosticsScriptEngineProvider extends IUnknown {
    /**
     * The interface identifier for IDiagnosticsScriptEngineProvider
     * @type {Guid}
     */
    static IID := Guid("{3051085a-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDiagnosticsScriptEngineProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateDiagnosticsScriptEngine : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDiagnosticsScriptEngineProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDiagnosticsScriptEngineSite} pScriptSite 
     * @param {BOOL} fDebuggingEnabled 
     * @param {Integer} ulProcessId 
     * @returns {IDiagnosticsScriptEngine} 
     */
    CreateDiagnosticsScriptEngine(pScriptSite, fDebuggingEnabled, ulProcessId) {
        result := ComCall(3, this, "ptr", pScriptSite, BOOL, fDebuggingEnabled, "uint", ulProcessId, "ptr*", &ppEngine := 0, "HRESULT")
        return IDiagnosticsScriptEngine(ppEngine)
    }

    Query(iid) {
        if (IDiagnosticsScriptEngineProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDiagnosticsScriptEngine := CallbackCreate(GetMethod(implObj, "CreateDiagnosticsScriptEngine"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDiagnosticsScriptEngine)
    }
}
