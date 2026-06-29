#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRTCWatcher.ahk" { IRTCWatcher }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCWatcherEvent extends IDispatch {
    /**
     * The interface identifier for IRTCWatcherEvent
     * @type {Guid}
     */
    static IID := Guid("{f30d7261-587a-424f-822c-312788f43548}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCWatcherEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Watcher : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCWatcherEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRTCWatcher} 
     */
    Watcher {
        get => this.get_Watcher()
    }

    /**
     * 
     * @returns {IRTCWatcher} 
     */
    get_Watcher() {
        result := ComCall(7, this, "ptr*", &ppWatcher := 0, "HRESULT")
        return IRTCWatcher(ppWatcher)
    }

    Query(iid) {
        if (IRTCWatcherEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Watcher := CallbackCreate(GetMethod(implObj, "get_Watcher"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Watcher)
    }
}
