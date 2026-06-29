#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\SCRIPTTRACEINFO.ahk" { SCRIPTTRACEINFO }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptSiteTraceInfo extends IUnknown {
    /**
     * The interface identifier for IActiveScriptSiteTraceInfo
     * @type {Guid}
     */
    static IID := Guid("{4b7272ae-1955-4bfe-98b0-780621888569}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptSiteTraceInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SendScriptTraceInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptSiteTraceInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {SCRIPTTRACEINFO} stiEventType 
     * @param {Guid} guidContextID 
     * @param {Integer} dwScriptContextCookie 
     * @param {Integer} lScriptStatementStart 
     * @param {Integer} lScriptStatementEnd 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    SendScriptTraceInfo(stiEventType, guidContextID, dwScriptContextCookie, lScriptStatementStart, lScriptStatementEnd, dwReserved) {
        result := ComCall(3, this, SCRIPTTRACEINFO, stiEventType, Guid, guidContextID, "uint", dwScriptContextCookie, "int", lScriptStatementStart, "int", lScriptStatementEnd, "uint", dwReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveScriptSiteTraceInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SendScriptTraceInfo := CallbackCreate(GetMethod(implObj, "SendScriptTraceInfo"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SendScriptTraceInfo)
    }
}
