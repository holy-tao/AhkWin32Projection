#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITsSbTarget.ahk" { ITsSbTarget }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITsSbBaseNotifySink.ahk" { ITsSbBaseNotifySink }

/**
 * Exposes methods that return an ITsSbTarget object to Remote Desktop Connection Broker (RD Connection Broker) after the target is successfully prepared for a connection.
 * @remarks
 * Plug-ins should use this interface to return an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a> object to RD Connection Broker after the plug-in has successfully prepared ("orchestrated") the target.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssborchestrationnotifysink
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbOrchestrationNotifySink extends ITsSbBaseNotifySink {
    /**
     * The interface identifier for ITsSbOrchestrationNotifySink
     * @type {Guid}
     */
    static IID := Guid("{36c37d61-926b-442f-bca5-118c6d50dcf2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbOrchestrationNotifySink interfaces
    */
    struct Vtbl extends ITsSbBaseNotifySink.Vtbl {
        OnReadyToConnect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbOrchestrationNotifySink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns an ITsSbTarget object to Remote Desktop Connection Broker (RD Connection Broker) after the target is successfully prepared for a connection.
     * @remarks
     * The target object referenced by the <i>pTarget</i> parameter should contain the external IP address of the target object. Without this information, the request will fail.
     * @param {ITsSbTarget} pTarget A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a> target object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssborchestrationnotifysink-onreadytoconnect
     */
    OnReadyToConnect(pTarget) {
        result := ComCall(5, this, "ptr", pTarget, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbOrchestrationNotifySink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnReadyToConnect := CallbackCreate(GetMethod(implObj, "OnReadyToConnect"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnReadyToConnect)
    }
}
