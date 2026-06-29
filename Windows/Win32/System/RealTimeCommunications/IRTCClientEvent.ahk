#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRTCClient.ahk" { IRTCClient }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RTC_CLIENT_EVENT_TYPE.ahk" { RTC_CLIENT_EVENT_TYPE }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCClientEvent extends IDispatch {
    /**
     * The interface identifier for IRTCClientEvent
     * @type {Guid}
     */
    static IID := Guid("{2b493b7a-3cba-4170-9c8b-76a9dacdd644}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCClientEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_EventType : IntPtr
        get_Client    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCClientEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {RTC_CLIENT_EVENT_TYPE} 
     */
    EventType {
        get => this.get_EventType()
    }

    /**
     * @type {IRTCClient} 
     */
    Client {
        get => this.get_Client()
    }

    /**
     * 
     * @returns {RTC_CLIENT_EVENT_TYPE} 
     */
    get_EventType() {
        result := ComCall(7, this, "int*", &penEventType := 0, "HRESULT")
        return penEventType
    }

    /**
     * 
     * @returns {IRTCClient} 
     */
    get_Client() {
        result := ComCall(8, this, "ptr*", &ppClient := 0, "HRESULT")
        return IRTCClient(ppClient)
    }

    Query(iid) {
        if (IRTCClientEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_EventType := CallbackCreate(GetMethod(implObj, "get_EventType"), flags, 2)
        this.vtbl.get_Client := CallbackCreate(GetMethod(implObj, "get_Client"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_EventType)
        CallbackFree(this.vtbl.get_Client)
    }
}
