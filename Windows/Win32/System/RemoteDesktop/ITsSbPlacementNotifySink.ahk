#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITsSbBaseNotifySink.ahk" { ITsSbBaseNotifySink }
#Import ".\ITsSbEnvironment.ahk" { ITsSbEnvironment }

/**
 * Exposes methods that return information about environments to Remote Desktop Connection Broker (RD Connection Broker).
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbplacementnotifysink
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbPlacementNotifySink extends ITsSbBaseNotifySink {
    /**
     * The interface identifier for ITsSbPlacementNotifySink
     * @type {Guid}
     */
    static IID := Guid("{68a0c487-2b4f-46c2-94a1-6ce685183634}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbPlacementNotifySink interfaces
    */
    struct Vtbl extends ITsSbBaseNotifySink.Vtbl {
        OnQueryEnvironmentCompleted : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbPlacementNotifySink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that the environment specified by the ITsSbClientConnection object is already hosting the correct target.
     * @param {ITsSbEnvironment} pEnvironment A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbenvironment">ITsSbEnvironment</a> environment object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbplacementnotifysink-onqueryenvironmentcompleted
     */
    OnQueryEnvironmentCompleted(pEnvironment) {
        result := ComCall(5, this, "ptr", pEnvironment, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbPlacementNotifySink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnQueryEnvironmentCompleted := CallbackCreate(GetMethod(implObj, "OnQueryEnvironmentCompleted"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnQueryEnvironmentCompleted)
    }
}
