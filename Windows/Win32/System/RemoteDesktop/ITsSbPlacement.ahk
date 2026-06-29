#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITsSbClientConnection.ahk" { ITsSbClientConnection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITsSbPlugin.ahk" { ITsSbPlugin }
#Import ".\ITsSbPlacementNotifySink.ahk" { ITsSbPlacementNotifySink }

/**
 * Exposes methods that prepare the environment (the computer that hosts the virtual machine).
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbplacement
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbPlacement extends ITsSbPlugin {
    /**
     * The interface identifier for ITsSbPlacement
     * @type {Guid}
     */
    static IID := Guid("{daadee5f-6d32-480e-9e36-ddab2329f06d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbPlacement interfaces
    */
    struct Vtbl extends ITsSbPlugin.Vtbl {
        QueryEnvironmentForTarget : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbPlacement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether the specified environment is ready to host the target that was returned by load balancing.
     * @remarks
     * Your plug-in should use the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbplacementnotifysink">ITsSbPlacementNotifySink</a> object to report the state of the environment to Remote Desktop Connection Broker (RD Connection Broker).
     * 
     * After RD Connection Broker receives a load-balancing result, it calls <b>QueryEnvironmentForTarget</b> 
     * to determine whether the environment is present and ready.
     * @param {ITsSbClientConnection} pConnection A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbclientconnection">ITsSbClientConnection</a> client connection object.
     * @param {ITsSbPlacementNotifySink} pPlacementSink A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbplacementnotifysink">ITsSbPlacementNotifySink</a> placement sink object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbplacement-queryenvironmentfortarget
     */
    QueryEnvironmentForTarget(pConnection, pPlacementSink) {
        result := ComCall(5, this, "ptr", pConnection, "ptr", pPlacementSink, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbPlacement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryEnvironmentForTarget := CallbackCreate(GetMethod(implObj, "QueryEnvironmentForTarget"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryEnvironmentForTarget)
    }
}
