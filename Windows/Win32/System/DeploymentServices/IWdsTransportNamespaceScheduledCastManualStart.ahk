#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWdsTransportNamespaceScheduledCast.ahk" { IWdsTransportNamespaceScheduledCast }

/**
 * An administrator must start transmission on an object of an IWdsTransportNamespaceScheduledCastManualStart interface. Applications can continue to join sessions of the namespace until the administrator starts transmission.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportnamespacescheduledcastmanualstart
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportNamespaceScheduledCastManualStart extends IWdsTransportNamespaceScheduledCast {
    /**
     * The interface identifier for IWdsTransportNamespaceScheduledCastManualStart
     * @type {Guid}
     */
    static IID := Guid("{013e6e4c-e6a7-4fb5-b7ff-d9f5da805c31}")

    /**
     * The class identifier for WdsTransportNamespaceScheduledCastManualStart
     * @type {Guid}
     */
    static CLSID := Guid("{d3e1a2aa-caac-460e-b98a-47f9f318a1fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportNamespaceScheduledCastManualStart interfaces
    */
    struct Vtbl extends IWdsTransportNamespaceScheduledCast.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportNamespaceScheduledCastManualStart.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IWdsTransportNamespaceScheduledCastManualStart.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
