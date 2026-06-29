#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWdsTransportNamespace.ahk" { IWdsTransportNamespace }

/**
 * Represents a base interface to the derived interfaces:\_IWdsTransportNamespaceScheduledCastManualStart and IWdsTransportNamespaceScheduledCastAutoStart.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportnamespacescheduledcast
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportNamespaceScheduledCast extends IWdsTransportNamespace {
    /**
     * The interface identifier for IWdsTransportNamespaceScheduledCast
     * @type {Guid}
     */
    static IID := Guid("{3840cecf-d76c-416e-a4cc-31c741d2874b}")

    /**
     * The class identifier for WdsTransportNamespaceScheduledCast
     * @type {Guid}
     */
    static CLSID := Guid("{badc1897-7025-44eb-9108-fb61c4055792}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportNamespaceScheduledCast interfaces
    */
    struct Vtbl extends IWdsTransportNamespace.Vtbl {
        StartTransmission : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportNamespaceScheduledCast.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Starts a transmission on a namespace.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespacescheduledcast-starttransmission
     */
    StartTransmission() {
        result := ComCall(28, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWdsTransportNamespaceScheduledCast.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartTransmission := CallbackCreate(GetMethod(implObj, "StartTransmission"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartTransmission)
    }
}
