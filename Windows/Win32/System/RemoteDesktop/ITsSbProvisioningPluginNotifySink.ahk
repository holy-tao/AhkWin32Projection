#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\VM_NOTIFY_ENTRY.ahk" { VM_NOTIFY_ENTRY }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\VM_HOST_NOTIFY_STATUS.ahk" { VM_HOST_NOTIFY_STATUS }
#Import ".\VM_NOTIFY_INFO.ahk" { VM_NOTIFY_INFO }
#Import ".\VM_NOTIFY_STATUS.ahk" { VM_NOTIFY_STATUS }

/**
 * Exposes methods that notify Remote Desktop Connection Broker (RD Connection Broker) about the provisioning of virtual machines.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbprovisioningpluginnotifysink
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbProvisioningPluginNotifySink extends IUnknown {
    /**
     * The interface identifier for ITsSbProvisioningPluginNotifySink
     * @type {Guid}
     */
    static IID := Guid("{aca87a8e-818b-4581-a032-49c3dfb9c701}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbProvisioningPluginNotifySink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnJobCreated                      : IntPtr
        OnVirtualMachineStatusChanged     : IntPtr
        OnJobCompleted                    : IntPtr
        OnJobCancelled                    : IntPtr
        LockVirtualMachine                : IntPtr
        OnVirtualMachineHostStatusChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbProvisioningPluginNotifySink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that a provisioning job is created.
     * @param {Pointer<VM_NOTIFY_INFO>} pVmNotifyInfo Notification info.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioningpluginnotifysink-onjobcreated
     */
    OnJobCreated(pVmNotifyInfo) {
        result := ComCall(3, this, VM_NOTIFY_INFO.Ptr, pVmNotifyInfo, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that the status of a virtual machine is changed.
     * @param {Pointer<VM_NOTIFY_ENTRY>} pVmNotifyEntry Notification entry.
     * @param {VM_NOTIFY_STATUS} VmNotifyStatus Notification status.
     * @param {HRESULT} ErrorCode A standard <b>HRESULT</b> error code describing the reason for the status change.
     * @param {BSTR} ErrorDescr A text description of the reason for the change.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioningpluginnotifysink-onvirtualmachinestatuschanged
     */
    OnVirtualMachineStatusChanged(pVmNotifyEntry, VmNotifyStatus, ErrorCode, ErrorDescr) {
        ErrorDescr := ErrorDescr is String ? BSTR.Alloc(ErrorDescr).Value : ErrorDescr

        result := ComCall(4, this, VM_NOTIFY_ENTRY.Ptr, pVmNotifyEntry, VM_NOTIFY_STATUS, VmNotifyStatus, "int", ErrorCode, BSTR, ErrorDescr, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that the job is complete.
     * @param {HRESULT} ResultCode The <b>HRESULT</b> returned by the job.
     * @param {BSTR} ResultDescription A text description of the <i>ResultCode</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioningpluginnotifysink-onjobcompleted
     */
    OnJobCompleted(ResultCode, ResultDescription) {
        ResultDescription := ResultDescription is String ? BSTR.Alloc(ResultDescription).Value : ResultDescription

        result := ComCall(5, this, "int", ResultCode, BSTR, ResultDescription, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that the job is cancelled.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioningpluginnotifysink-onjobcancelled
     */
    OnJobCancelled() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that the virtual machine is locked.
     * @param {Pointer<VM_NOTIFY_ENTRY>} pVmNotifyEntry Notification entry.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioningpluginnotifysink-lockvirtualmachine
     */
    LockVirtualMachine(pVmNotifyEntry) {
        result := ComCall(7, this, VM_NOTIFY_ENTRY.Ptr, pVmNotifyEntry, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that the status of the host of a virtual machine is changed.
     * @param {BSTR} VmHost The name of the host.
     * @param {VM_HOST_NOTIFY_STATUS} VmHostNotifyStatus The new status of the host.
     * @param {HRESULT} ErrorCode A standard <b>HRESULT</b> error code describing the reason for the status change.
     * @param {BSTR} ErrorDescr A text description of the reason for the change.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioningpluginnotifysink-onvirtualmachinehoststatuschanged
     */
    OnVirtualMachineHostStatusChanged(VmHost, VmHostNotifyStatus, ErrorCode, ErrorDescr) {
        VmHost := VmHost is String ? BSTR.Alloc(VmHost).Value : VmHost
        ErrorDescr := ErrorDescr is String ? BSTR.Alloc(ErrorDescr).Value : ErrorDescr

        result := ComCall(8, this, BSTR, VmHost, VM_HOST_NOTIFY_STATUS, VmHostNotifyStatus, "int", ErrorCode, BSTR, ErrorDescr, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbProvisioningPluginNotifySink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnJobCreated := CallbackCreate(GetMethod(implObj, "OnJobCreated"), flags, 2)
        this.vtbl.OnVirtualMachineStatusChanged := CallbackCreate(GetMethod(implObj, "OnVirtualMachineStatusChanged"), flags, 5)
        this.vtbl.OnJobCompleted := CallbackCreate(GetMethod(implObj, "OnJobCompleted"), flags, 3)
        this.vtbl.OnJobCancelled := CallbackCreate(GetMethod(implObj, "OnJobCancelled"), flags, 1)
        this.vtbl.LockVirtualMachine := CallbackCreate(GetMethod(implObj, "LockVirtualMachine"), flags, 2)
        this.vtbl.OnVirtualMachineHostStatusChanged := CallbackCreate(GetMethod(implObj, "OnVirtualMachineHostStatusChanged"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnJobCreated)
        CallbackFree(this.vtbl.OnVirtualMachineStatusChanged)
        CallbackFree(this.vtbl.OnJobCompleted)
        CallbackFree(this.vtbl.OnJobCancelled)
        CallbackFree(this.vtbl.LockVirtualMachine)
        CallbackFree(this.vtbl.OnVirtualMachineHostStatusChanged)
    }
}
