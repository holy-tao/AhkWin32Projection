#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITsSbOrchestrationNotifySink.ahk" { ITsSbOrchestrationNotifySink }
#Import ".\ITsSbClientConnection.ahk" { ITsSbClientConnection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITsSbPlugin.ahk" { ITsSbPlugin }

/**
 * Exposes methods that Remote Desktop Connection Broker (RD Connection Broker) uses to ensure that the target is ready before a client is redirected to it.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssborchestration
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbOrchestration extends ITsSbPlugin {
    /**
     * The interface identifier for ITsSbOrchestration
     * @type {Guid}
     */
    static IID := Guid("{64fc1172-9eb7-11dc-8b00-3aba56d89593}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbOrchestration interfaces
    */
    struct Vtbl extends ITsSbPlugin.Vtbl {
        PrepareTargetForConnect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbOrchestration.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Prepares the target for a client connection.
     * @remarks
     * This method is particularly useful for plug-ins that redirect users to virtual desktops. Remote Desktop Connection Broker (RD Connection Broker) 
     * calls this method after placement has successfully completed. Orchestration can 
     * include waking a virtual machine and determining its IP address. Your implementation of this method should ensure that the target is ready to accept a client connection.
     * @param {ITsSbClientConnection} pConnection A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbclientconnection">ITsSbClientConnection</a> client connection object.
     * @param {ITsSbOrchestrationNotifySink} pOrchestrationNotifySink A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssborchestrationnotifysink">ITsSbOrchestrationNotifySink</a> orchestration notify sink object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssborchestration-preparetargetforconnect
     */
    PrepareTargetForConnect(pConnection, pOrchestrationNotifySink) {
        result := ComCall(5, this, "ptr", pConnection, "ptr", pOrchestrationNotifySink, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbOrchestration.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PrepareTargetForConnect := CallbackCreate(GetMethod(implObj, "PrepareTargetForConnect"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PrepareTargetForConnect)
    }
}
