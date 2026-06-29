#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IApplicationDebugger.ahk" { IApplicationDebugger }
#Import ".\IRemoteDebugApplicationThread.ahk" { IRemoteDebugApplicationThread }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IRemoteDebugApplicationEvents extends IUnknown {
    /**
     * The interface identifier for IRemoteDebugApplicationEvents
     * @type {Guid}
     */
    static IID := Guid("{51973c33-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRemoteDebugApplicationEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnConnectDebugger    : IntPtr
        OnDisconnectDebugger : IntPtr
        OnSetName            : IntPtr
        OnDebugOutput        : IntPtr
        OnClose              : IntPtr
        OnEnterBreakPoint    : IntPtr
        OnLeaveBreakPoint    : IntPtr
        OnCreateThread       : IntPtr
        OnDestroyThread      : IntPtr
        OnBreakFlagChange    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRemoteDebugApplicationEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IApplicationDebugger} pad 
     * @returns {HRESULT} 
     */
    OnConnectDebugger(pad) {
        result := ComCall(3, this, "ptr", pad, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnDisconnectDebugger() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pstrName 
     * @returns {HRESULT} 
     */
    OnSetName(pstrName) {
        pstrName := pstrName is String ? StrPtr(pstrName) : pstrName

        result := ComCall(5, this, "ptr", pstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} _pstr 
     * @returns {HRESULT} 
     */
    OnDebugOutput(_pstr) {
        _pstr := _pstr is String ? StrPtr(_pstr) : _pstr

        result := ComCall(6, this, "ptr", _pstr, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnClose() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRemoteDebugApplicationThread} prdat 
     * @returns {HRESULT} 
     */
    OnEnterBreakPoint(prdat) {
        result := ComCall(8, this, "ptr", prdat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRemoteDebugApplicationThread} prdat 
     * @returns {HRESULT} 
     */
    OnLeaveBreakPoint(prdat) {
        result := ComCall(9, this, "ptr", prdat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRemoteDebugApplicationThread} prdat 
     * @returns {HRESULT} 
     */
    OnCreateThread(prdat) {
        result := ComCall(10, this, "ptr", prdat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRemoteDebugApplicationThread} prdat 
     * @returns {HRESULT} 
     */
    OnDestroyThread(prdat) {
        result := ComCall(11, this, "ptr", prdat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} abf 
     * @param {IRemoteDebugApplicationThread} prdatSteppingThread 
     * @returns {HRESULT} 
     */
    OnBreakFlagChange(abf, prdatSteppingThread) {
        result := ComCall(12, this, "uint", abf, "ptr", prdatSteppingThread, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRemoteDebugApplicationEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnConnectDebugger := CallbackCreate(GetMethod(implObj, "OnConnectDebugger"), flags, 2)
        this.vtbl.OnDisconnectDebugger := CallbackCreate(GetMethod(implObj, "OnDisconnectDebugger"), flags, 1)
        this.vtbl.OnSetName := CallbackCreate(GetMethod(implObj, "OnSetName"), flags, 2)
        this.vtbl.OnDebugOutput := CallbackCreate(GetMethod(implObj, "OnDebugOutput"), flags, 2)
        this.vtbl.OnClose := CallbackCreate(GetMethod(implObj, "OnClose"), flags, 1)
        this.vtbl.OnEnterBreakPoint := CallbackCreate(GetMethod(implObj, "OnEnterBreakPoint"), flags, 2)
        this.vtbl.OnLeaveBreakPoint := CallbackCreate(GetMethod(implObj, "OnLeaveBreakPoint"), flags, 2)
        this.vtbl.OnCreateThread := CallbackCreate(GetMethod(implObj, "OnCreateThread"), flags, 2)
        this.vtbl.OnDestroyThread := CallbackCreate(GetMethod(implObj, "OnDestroyThread"), flags, 2)
        this.vtbl.OnBreakFlagChange := CallbackCreate(GetMethod(implObj, "OnBreakFlagChange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnConnectDebugger)
        CallbackFree(this.vtbl.OnDisconnectDebugger)
        CallbackFree(this.vtbl.OnSetName)
        CallbackFree(this.vtbl.OnDebugOutput)
        CallbackFree(this.vtbl.OnClose)
        CallbackFree(this.vtbl.OnEnterBreakPoint)
        CallbackFree(this.vtbl.OnLeaveBreakPoint)
        CallbackFree(this.vtbl.OnCreateThread)
        CallbackFree(this.vtbl.OnDestroyThread)
        CallbackFree(this.vtbl.OnBreakFlagChange)
    }
}
