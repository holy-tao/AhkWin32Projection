#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that Remote Desktop Connection Broker (RD Connection Broker) uses to notify plug-ins of state changes that occur in the RD Connection Broker itself.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbservicenotification
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbServiceNotification extends IUnknown {
    /**
     * The interface identifier for ITsSbServiceNotification
     * @type {Guid}
     */
    static IID := Guid("{86cb68ae-86e0-4f57-8a64-bb7406bc5550}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbServiceNotification interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        NotifyServiceFailure : IntPtr
        NotifyServiceSuccess : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbServiceNotification.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies registered plug-ins that the Remote Desktop Connection Broker (RD Connection Broker) service has stopped.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbservicenotification-notifyservicefailure
     */
    NotifyServiceFailure() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Notifies registered plug-ins that the Remote Desktop Connection Broker (RD Connection Broker) service has started.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbservicenotification-notifyservicesuccess
     */
    NotifyServiceSuccess() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbServiceNotification.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NotifyServiceFailure := CallbackCreate(GetMethod(implObj, "NotifyServiceFailure"), flags, 1)
        this.vtbl.NotifyServiceSuccess := CallbackCreate(GetMethod(implObj, "NotifyServiceSuccess"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NotifyServiceFailure)
        CallbackFree(this.vtbl.NotifyServiceSuccess)
    }
}
