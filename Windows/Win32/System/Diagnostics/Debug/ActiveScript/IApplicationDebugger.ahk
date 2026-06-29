#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\BREAKREASON.ahk" { BREAKREASON }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IRemoteDebugApplicationThread.ahk" { IRemoteDebugApplicationThread }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IActiveScriptErrorDebug.ahk" { IActiveScriptErrorDebug }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IApplicationDebugger extends IUnknown {
    /**
     * The interface identifier for IApplicationDebugger
     * @type {Guid}
     */
    static IID := Guid("{51973c2a-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IApplicationDebugger interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryAlive               : IntPtr
        CreateInstanceAtDebugger : IntPtr
        onDebugOutput            : IntPtr
        onHandleBreakPoint       : IntPtr
        onClose                  : IntPtr
        onDebuggerEvent          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IApplicationDebugger.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    QueryAlive() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {IUnknown} pUnkOuter 
     * @param {Integer} dwClsContext 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    CreateInstanceAtDebugger(rclsid, pUnkOuter, dwClsContext, riid) {
        result := ComCall(4, this, Guid.Ptr, rclsid, "ptr", pUnkOuter, "uint", dwClsContext, Guid.Ptr, riid, "ptr*", &ppvObject := 0, "HRESULT")
        return IUnknown(ppvObject)
    }

    /**
     * 
     * @param {PWSTR} _pstr 
     * @returns {HRESULT} 
     */
    onDebugOutput(_pstr) {
        _pstr := _pstr is String ? StrPtr(_pstr) : _pstr

        result := ComCall(5, this, "ptr", _pstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRemoteDebugApplicationThread} prpt 
     * @param {BREAKREASON} br 
     * @param {IActiveScriptErrorDebug} pError 
     * @returns {HRESULT} 
     */
    onHandleBreakPoint(prpt, br, pError) {
        result := ComCall(6, this, "ptr", prpt, BREAKREASON, br, "ptr", pError, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    onClose() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     */
    onDebuggerEvent(riid, punk) {
        result := ComCall(8, this, Guid.Ptr, riid, "ptr", punk, "HRESULT")
        return result
    }

    Query(iid) {
        if (IApplicationDebugger.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryAlive := CallbackCreate(GetMethod(implObj, "QueryAlive"), flags, 1)
        this.vtbl.CreateInstanceAtDebugger := CallbackCreate(GetMethod(implObj, "CreateInstanceAtDebugger"), flags, 6)
        this.vtbl.onDebugOutput := CallbackCreate(GetMethod(implObj, "onDebugOutput"), flags, 2)
        this.vtbl.onHandleBreakPoint := CallbackCreate(GetMethod(implObj, "onHandleBreakPoint"), flags, 4)
        this.vtbl.onClose := CallbackCreate(GetMethod(implObj, "onClose"), flags, 1)
        this.vtbl.onDebuggerEvent := CallbackCreate(GetMethod(implObj, "onDebuggerEvent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryAlive)
        CallbackFree(this.vtbl.CreateInstanceAtDebugger)
        CallbackFree(this.vtbl.onDebugOutput)
        CallbackFree(this.vtbl.onHandleBreakPoint)
        CallbackFree(this.vtbl.onClose)
        CallbackFree(this.vtbl.onDebuggerEvent)
    }
}
