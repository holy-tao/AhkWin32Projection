#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITsSbPlugin.ahk

/**
 * Exposes methods that create and maintain virtual machines.
 * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nn-sbtsv-itssbprovisioning
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbProvisioning extends ITsSbPlugin{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbProvisioning
     * @type {Guid}
     */
    static IID => Guid("{2f6f0dbb-9e4f-462b-9c3f-fccc3dcb6232}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVirtualMachines", "PatchVirtualMachines", "DeleteVirtualMachines", "CancelJob"]

    /**
     * Creates a virtual machine asynchronously.
     * @param {BSTR} JobXmlString Defines the job.
     * @param {BSTR} JobGuid A <b>GUID</b> that identifies the job.
     * @param {ITsSbProvisioningPluginNotifySink} pSink The <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbprovisioningpluginnotifysink">ITsSbProvisioningPluginNotifySink</a> object that notifies the RD Connection Broker about the job.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbprovisioning-createvirtualmachines
     */
    CreateVirtualMachines(JobXmlString, JobGuid, pSink) {
        if(JobXmlString is String) {
            pin := BSTR.Alloc(JobXmlString)
            JobXmlString := pin.Value
        }
        if(JobGuid is String) {
            pin := BSTR.Alloc(JobGuid)
            JobGuid := pin.Value
        }

        result := ComCall(5, this, "ptr", JobXmlString, "ptr", JobGuid, "ptr", pSink, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Patches a virtual machine asynchronously.
     * @param {BSTR} JobXmlString Defines the job.
     * @param {BSTR} JobGuid A <b>GUID</b> that identifies the job.
     * @param {ITsSbProvisioningPluginNotifySink} pSink The <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbprovisioningpluginnotifysink">ITsSbProvisioningPluginNotifySink</a> object that notifies the RD Connection Broker about the job.
     * @param {Pointer<VM_PATCH_INFO>} pVMPatchInfo Patch information.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbprovisioning-patchvirtualmachines
     */
    PatchVirtualMachines(JobXmlString, JobGuid, pSink, pVMPatchInfo) {
        if(JobXmlString is String) {
            pin := BSTR.Alloc(JobXmlString)
            JobXmlString := pin.Value
        }
        if(JobGuid is String) {
            pin := BSTR.Alloc(JobGuid)
            JobGuid := pin.Value
        }

        result := ComCall(6, this, "ptr", JobXmlString, "ptr", JobGuid, "ptr", pSink, "ptr", pVMPatchInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deletes a virtual machine asynchronously.
     * @param {BSTR} JobXmlString Defines the job.
     * @param {BSTR} JobGuid A <b>GUID</b> that identifies the job.
     * @param {ITsSbProvisioningPluginNotifySink} pSink The <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbprovisioningpluginnotifysink">ITsSbProvisioningPluginNotifySink</a> object that notifies the RD Connection Broker about the job.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbprovisioning-deletevirtualmachines
     */
    DeleteVirtualMachines(JobXmlString, JobGuid, pSink) {
        if(JobXmlString is String) {
            pin := BSTR.Alloc(JobXmlString)
            JobXmlString := pin.Value
        }
        if(JobGuid is String) {
            pin := BSTR.Alloc(JobGuid)
            JobGuid := pin.Value
        }

        result := ComCall(7, this, "ptr", JobXmlString, "ptr", JobGuid, "ptr", pSink, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Cancels a provisioning job.
     * @param {BSTR} JobGuid A <b>GUID</b> that identifies the job.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbprovisioning-canceljob
     */
    CancelJob(JobGuid) {
        if(JobGuid is String) {
            pin := BSTR.Alloc(JobGuid)
            JobGuid := pin.Value
        }

        result := ComCall(8, this, "ptr", JobGuid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
