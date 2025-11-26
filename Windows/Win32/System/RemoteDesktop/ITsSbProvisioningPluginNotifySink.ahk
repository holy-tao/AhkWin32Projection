#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that notify Remote Desktop Connection Broker (RD Connection Broker) about the provisioning of virtual machines.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbprovisioningpluginnotifysink
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbProvisioningPluginNotifySink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbProvisioningPluginNotifySink
     * @type {Guid}
     */
    static IID => Guid("{aca87a8e-818b-4581-a032-49c3dfb9c701}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnJobCreated", "OnVirtualMachineStatusChanged", "OnJobCompleted", "OnJobCancelled", "LockVirtualMachine", "OnVirtualMachineHostStatusChanged"]

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that a provisioning job is created.
     * @param {Pointer<VM_NOTIFY_INFO>} pVmNotifyInfo Notification info.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbprovisioningpluginnotifysink-onjobcreated
     */
    OnJobCreated(pVmNotifyInfo) {
        result := ComCall(3, this, "ptr", pVmNotifyInfo, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that the status of a virtual machine is changed.
     * @param {Pointer<VM_NOTIFY_ENTRY>} pVmNotifyEntry Notification entry.
     * @param {Integer} VmNotifyStatus Notification status.
     * @param {HRESULT} ErrorCode A standard <b>HRESULT</b> error code describing the reason for the status change.
     * @param {BSTR} ErrorDescr A text description of the reason for the change.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbprovisioningpluginnotifysink-onvirtualmachinestatuschanged
     */
    OnVirtualMachineStatusChanged(pVmNotifyEntry, VmNotifyStatus, ErrorCode, ErrorDescr) {
        ErrorDescr := ErrorDescr is String ? BSTR.Alloc(ErrorDescr).Value : ErrorDescr

        result := ComCall(4, this, "ptr", pVmNotifyEntry, "int", VmNotifyStatus, "int", ErrorCode, "ptr", ErrorDescr, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that the job is complete.
     * @param {HRESULT} ResultCode The <b>HRESULT</b> returned by the job.
     * @param {BSTR} ResultDescription A text description of the <i>ResultCode</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbprovisioningpluginnotifysink-onjobcompleted
     */
    OnJobCompleted(ResultCode, ResultDescription) {
        ResultDescription := ResultDescription is String ? BSTR.Alloc(ResultDescription).Value : ResultDescription

        result := ComCall(5, this, "int", ResultCode, "ptr", ResultDescription, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that the job is cancelled.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbprovisioningpluginnotifysink-onjobcancelled
     */
    OnJobCancelled() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that the virtual machine is locked.
     * @param {Pointer<VM_NOTIFY_ENTRY>} pVmNotifyEntry Notification entry.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbprovisioningpluginnotifysink-lockvirtualmachine
     */
    LockVirtualMachine(pVmNotifyEntry) {
        result := ComCall(7, this, "ptr", pVmNotifyEntry, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that the status of the host of a virtual machine is changed.
     * @param {BSTR} VmHost The name of the host.
     * @param {Integer} VmHostNotifyStatus The new status of the host.
     * @param {HRESULT} ErrorCode A standard <b>HRESULT</b> error code describing the reason for the status change.
     * @param {BSTR} ErrorDescr A text description of the reason for the change.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbprovisioningpluginnotifysink-onvirtualmachinehoststatuschanged
     */
    OnVirtualMachineHostStatusChanged(VmHost, VmHostNotifyStatus, ErrorCode, ErrorDescr) {
        VmHost := VmHost is String ? BSTR.Alloc(VmHost).Value : VmHost
        ErrorDescr := ErrorDescr is String ? BSTR.Alloc(ErrorDescr).Value : ErrorDescr

        result := ComCall(8, this, "ptr", VmHost, "int", VmHostNotifyStatus, "int", ErrorCode, "ptr", ErrorDescr, "HRESULT")
        return result
    }
}
