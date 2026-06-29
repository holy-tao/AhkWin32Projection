#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\RTC_WATCHER_STATE.ahk" { RTC_WATCHER_STATE }
#Import ".\IRTCPresenceContact.ahk" { IRTCPresenceContact }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCWatcher extends IRTCPresenceContact {
    /**
     * The interface identifier for IRTCWatcher
     * @type {Guid}
     */
    static IID := Guid("{c7cedad8-346b-4d1b-ac02-a2088df9be4f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCWatcher interfaces
    */
    struct Vtbl extends IRTCPresenceContact.Vtbl {
        get_State : IntPtr
        put_State : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCWatcher.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {RTC_WATCHER_STATE} 
     */
    State {
        get => this.get_State()
        set => this.put_State(value)
    }

    /**
     * 
     * @returns {RTC_WATCHER_STATE} 
     */
    get_State() {
        result := ComCall(11, this, "int*", &penState := 0, "HRESULT")
        return penState
    }

    /**
     * 
     * @param {RTC_WATCHER_STATE} enState 
     * @returns {HRESULT} 
     */
    put_State(enState) {
        result := ComCall(12, this, RTC_WATCHER_STATE, enState, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRTCWatcher.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.put_State := CallbackCreate(GetMethod(implObj, "put_State"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.put_State)
    }
}
