#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\SCRIPT_DEBUGGER_OPTIONS.ahk" { SCRIPT_DEBUGGER_OPTIONS }
#Import ".\IRemoteDebugApplicationThread.ahk" { IRemoteDebugApplicationThread }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IRemoteDebugApplication110 extends IUnknown {
    /**
     * The interface identifier for IRemoteDebugApplication110
     * @type {Guid}
     */
    static IID := Guid("{d5fe005b-2836-485e-b1f9-89d91aa24fd4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRemoteDebugApplication110 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDebuggerOptions        : IntPtr
        GetCurrentDebuggerOptions : IntPtr
        GetMainThread             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRemoteDebugApplication110.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {SCRIPT_DEBUGGER_OPTIONS} mask 
     * @param {SCRIPT_DEBUGGER_OPTIONS} value 
     * @returns {HRESULT} 
     */
    SetDebuggerOptions(mask, value) {
        result := ComCall(3, this, SCRIPT_DEBUGGER_OPTIONS, mask, SCRIPT_DEBUGGER_OPTIONS, value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SCRIPT_DEBUGGER_OPTIONS} 
     */
    GetCurrentDebuggerOptions() {
        result := ComCall(4, this, "int*", &pCurrentOptions := 0, "HRESULT")
        return pCurrentOptions
    }

    /**
     * 
     * @returns {IRemoteDebugApplicationThread} 
     */
    GetMainThread() {
        result := ComCall(5, this, "ptr*", &ppThread := 0, "HRESULT")
        return IRemoteDebugApplicationThread(ppThread)
    }

    Query(iid) {
        if (IRemoteDebugApplication110.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDebuggerOptions := CallbackCreate(GetMethod(implObj, "SetDebuggerOptions"), flags, 3)
        this.vtbl.GetCurrentDebuggerOptions := CallbackCreate(GetMethod(implObj, "GetCurrentDebuggerOptions"), flags, 2)
        this.vtbl.GetMainThread := CallbackCreate(GetMethod(implObj, "GetMainThread"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDebuggerOptions)
        CallbackFree(this.vtbl.GetCurrentDebuggerOptions)
        CallbackFree(this.vtbl.GetMainThread)
    }
}
