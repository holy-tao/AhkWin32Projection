#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that reports completion to and gets wait time from the Remote Desktop Connection Broker (RD Connection Broker).
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbgenericnotifysink
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbGenericNotifySink extends IUnknown {
    /**
     * The interface identifier for ITsSbGenericNotifySink
     * @type {Guid}
     */
    static IID := Guid("{4c4c8c4f-300b-46ad-9164-8468a7e7568c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbGenericNotifySink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnCompleted    : IntPtr
        GetWaitTimeout : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbGenericNotifySink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reports completion to Remote Desktop Connection Broker (RD Connection Broker).
     * @param {HRESULT} _Status The status to report.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbgenericnotifysink-oncompleted
     */
    OnCompleted(_Status) {
        result := ComCall(3, this, "int", _Status, "HRESULT")
        return result
    }

    /**
     * Retrieves the wait timeout.
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbgenericnotifysink-getwaittimeout
     */
    GetWaitTimeout() {
        pftTimeout := FILETIME()
        result := ComCall(4, this, FILETIME.Ptr, pftTimeout, "HRESULT")
        return pftTimeout
    }

    Query(iid) {
        if (ITsSbGenericNotifySink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnCompleted := CallbackCreate(GetMethod(implObj, "OnCompleted"), flags, 2)
        this.vtbl.GetWaitTimeout := CallbackCreate(GetMethod(implObj, "GetWaitTimeout"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnCompleted)
        CallbackFree(this.vtbl.GetWaitTimeout)
    }
}
