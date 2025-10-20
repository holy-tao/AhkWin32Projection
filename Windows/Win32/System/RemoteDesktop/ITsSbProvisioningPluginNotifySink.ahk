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
     * 
     * @param {Pointer<VM_NOTIFY_INFO>} pVmNotifyInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioningpluginnotifysink-onjobcreated
     */
    OnJobCreated(pVmNotifyInfo) {
        result := ComCall(3, this, "ptr", pVmNotifyInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VM_NOTIFY_ENTRY>} pVmNotifyEntry 
     * @param {Integer} VmNotifyStatus 
     * @param {HRESULT} ErrorCode 
     * @param {BSTR} ErrorDescr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioningpluginnotifysink-onvirtualmachinestatuschanged
     */
    OnVirtualMachineStatusChanged(pVmNotifyEntry, VmNotifyStatus, ErrorCode, ErrorDescr) {
        ErrorDescr := ErrorDescr is String ? BSTR.Alloc(ErrorDescr).Value : ErrorDescr

        result := ComCall(4, this, "ptr", pVmNotifyEntry, "int", VmNotifyStatus, "int", ErrorCode, "ptr", ErrorDescr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} ResultCode 
     * @param {BSTR} ResultDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioningpluginnotifysink-onjobcompleted
     */
    OnJobCompleted(ResultCode, ResultDescription) {
        ResultDescription := ResultDescription is String ? BSTR.Alloc(ResultDescription).Value : ResultDescription

        result := ComCall(5, this, "int", ResultCode, "ptr", ResultDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioningpluginnotifysink-onjobcancelled
     */
    OnJobCancelled() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VM_NOTIFY_ENTRY>} pVmNotifyEntry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioningpluginnotifysink-lockvirtualmachine
     */
    LockVirtualMachine(pVmNotifyEntry) {
        result := ComCall(7, this, "ptr", pVmNotifyEntry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} VmHost 
     * @param {Integer} VmHostNotifyStatus 
     * @param {HRESULT} ErrorCode 
     * @param {BSTR} ErrorDescr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioningpluginnotifysink-onvirtualmachinehoststatuschanged
     */
    OnVirtualMachineHostStatusChanged(VmHost, VmHostNotifyStatus, ErrorCode, ErrorDescr) {
        VmHost := VmHost is String ? BSTR.Alloc(VmHost).Value : VmHost
        ErrorDescr := ErrorDescr is String ? BSTR.Alloc(ErrorDescr).Value : ErrorDescr

        result := ComCall(8, this, "ptr", VmHost, "int", VmHostNotifyStatus, "int", ErrorCode, "ptr", ErrorDescr, "HRESULT")
        return result
    }
}
