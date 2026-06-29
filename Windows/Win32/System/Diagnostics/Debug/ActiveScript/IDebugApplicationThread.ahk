#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugThreadCall32.ahk" { IDebugThreadCall32 }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRemoteDebugApplicationThread.ahk" { IRemoteDebugApplicationThread }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugApplicationThread extends IRemoteDebugApplicationThread {
    /**
     * The interface identifier for IDebugApplicationThread
     * @type {Guid}
     */
    static IID := Guid("{51973c38-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugApplicationThread interfaces
    */
    struct Vtbl extends IRemoteDebugApplicationThread.Vtbl {
        SynchronousCallIntoThread32 : IntPtr
        QueryIsCurrentThread        : IntPtr
        QueryIsDebuggerThread       : IntPtr
        SetDescription              : IntPtr
        SetStateString              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugApplicationThread.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDebugThreadCall32} pstcb 
     * @param {Integer} dwParam1 
     * @param {Integer} dwParam2 
     * @param {Integer} dwParam3 
     * @returns {HRESULT} 
     */
    SynchronousCallIntoThread32(pstcb, dwParam1, dwParam2, dwParam3) {
        result := ComCall(12, this, "ptr", pstcb, "uint", dwParam1, "uint", dwParam2, "uint", dwParam3, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    QueryIsCurrentThread() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    QueryIsDebuggerThread() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pstrDescription 
     * @returns {HRESULT} 
     */
    SetDescription(pstrDescription) {
        pstrDescription := pstrDescription is String ? StrPtr(pstrDescription) : pstrDescription

        result := ComCall(15, this, "ptr", pstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pstrState 
     * @returns {HRESULT} 
     */
    SetStateString(pstrState) {
        pstrState := pstrState is String ? StrPtr(pstrState) : pstrState

        result := ComCall(16, this, "ptr", pstrState, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugApplicationThread.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SynchronousCallIntoThread32 := CallbackCreate(GetMethod(implObj, "SynchronousCallIntoThread32"), flags, 5)
        this.vtbl.QueryIsCurrentThread := CallbackCreate(GetMethod(implObj, "QueryIsCurrentThread"), flags, 1)
        this.vtbl.QueryIsDebuggerThread := CallbackCreate(GetMethod(implObj, "QueryIsDebuggerThread"), flags, 1)
        this.vtbl.SetDescription := CallbackCreate(GetMethod(implObj, "SetDescription"), flags, 2)
        this.vtbl.SetStateString := CallbackCreate(GetMethod(implObj, "SetStateString"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SynchronousCallIntoThread32)
        CallbackFree(this.vtbl.QueryIsCurrentThread)
        CallbackFree(this.vtbl.QueryIsDebuggerThread)
        CallbackFree(this.vtbl.SetDescription)
        CallbackFree(this.vtbl.SetStateString)
    }
}
