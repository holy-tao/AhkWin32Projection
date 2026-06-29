#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IActiveScriptSiteTraceInfo.ahk" { IActiveScriptSiteTraceInfo }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptTraceInfo extends IUnknown {
    /**
     * The interface identifier for IActiveScriptTraceInfo
     * @type {Guid}
     */
    static IID := Guid("{c35456e7-bebf-4a1b-86a9-24d56be8b369}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptTraceInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StartScriptTracing : IntPtr
        StopScriptTracing  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptTraceInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IActiveScriptSiteTraceInfo} pSiteTraceInfo 
     * @param {Guid} guidContextID 
     * @returns {HRESULT} 
     */
    StartScriptTracing(pSiteTraceInfo, guidContextID) {
        result := ComCall(3, this, "ptr", pSiteTraceInfo, Guid, guidContextID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopScriptTracing() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveScriptTraceInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartScriptTracing := CallbackCreate(GetMethod(implObj, "StartScriptTracing"), flags, 3)
        this.vtbl.StopScriptTracing := CallbackCreate(GetMethod(implObj, "StopScriptTracing"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartScriptTracing)
        CallbackFree(this.vtbl.StopScriptTracing)
    }
}
