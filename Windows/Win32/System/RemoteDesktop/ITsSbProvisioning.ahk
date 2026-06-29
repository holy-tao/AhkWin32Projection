#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ITsSbProvisioningPluginNotifySink.ahk" { ITsSbProvisioningPluginNotifySink }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITsSbPlugin.ahk" { ITsSbPlugin }
#Import ".\VM_PATCH_INFO.ahk" { VM_PATCH_INFO }

/**
 * Exposes methods that create and maintain virtual machines.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbprovisioning
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbProvisioning extends ITsSbPlugin {
    /**
     * The interface identifier for ITsSbProvisioning
     * @type {Guid}
     */
    static IID := Guid("{2f6f0dbb-9e4f-462b-9c3f-fccc3dcb6232}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbProvisioning interfaces
    */
    struct Vtbl extends ITsSbPlugin.Vtbl {
        CreateVirtualMachines : IntPtr
        PatchVirtualMachines  : IntPtr
        DeleteVirtualMachines : IntPtr
        CancelJob             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbProvisioning.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a virtual machine asynchronously.
     * @param {BSTR} JobXmlString Defines the job.
     * @param {BSTR} JobGuid A <b>GUID</b> that identifies the job.
     * @param {ITsSbProvisioningPluginNotifySink} pSink The <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbprovisioningpluginnotifysink">ITsSbProvisioningPluginNotifySink</a> object that notifies the RD Connection Broker about the job.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioning-createvirtualmachines
     */
    CreateVirtualMachines(JobXmlString, JobGuid, pSink) {
        JobXmlString := JobXmlString is String ? BSTR.Alloc(JobXmlString).Value : JobXmlString
        JobGuid := JobGuid is String ? BSTR.Alloc(JobGuid).Value : JobGuid

        result := ComCall(5, this, BSTR, JobXmlString, BSTR, JobGuid, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * Patches a virtual machine asynchronously.
     * @param {BSTR} JobXmlString Defines the job.
     * @param {BSTR} JobGuid A <b>GUID</b> that identifies the job.
     * @param {ITsSbProvisioningPluginNotifySink} pSink The <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbprovisioningpluginnotifysink">ITsSbProvisioningPluginNotifySink</a> object that notifies the RD Connection Broker about the job.
     * @param {Pointer<VM_PATCH_INFO>} pVMPatchInfo Patch information.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioning-patchvirtualmachines
     */
    PatchVirtualMachines(JobXmlString, JobGuid, pSink, pVMPatchInfo) {
        JobXmlString := JobXmlString is String ? BSTR.Alloc(JobXmlString).Value : JobXmlString
        JobGuid := JobGuid is String ? BSTR.Alloc(JobGuid).Value : JobGuid

        result := ComCall(6, this, BSTR, JobXmlString, BSTR, JobGuid, "ptr", pSink, VM_PATCH_INFO.Ptr, pVMPatchInfo, "HRESULT")
        return result
    }

    /**
     * Deletes a virtual machine asynchronously.
     * @param {BSTR} JobXmlString Defines the job.
     * @param {BSTR} JobGuid A <b>GUID</b> that identifies the job.
     * @param {ITsSbProvisioningPluginNotifySink} pSink The <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbprovisioningpluginnotifysink">ITsSbProvisioningPluginNotifySink</a> object that notifies the RD Connection Broker about the job.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioning-deletevirtualmachines
     */
    DeleteVirtualMachines(JobXmlString, JobGuid, pSink) {
        JobXmlString := JobXmlString is String ? BSTR.Alloc(JobXmlString).Value : JobXmlString
        JobGuid := JobGuid is String ? BSTR.Alloc(JobGuid).Value : JobGuid

        result := ComCall(7, this, BSTR, JobXmlString, BSTR, JobGuid, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * Cancels a provisioning job.
     * @param {BSTR} JobGuid A <b>GUID</b> that identifies the job.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioning-canceljob
     */
    CancelJob(JobGuid) {
        JobGuid := JobGuid is String ? BSTR.Alloc(JobGuid).Value : JobGuid

        result := ComCall(8, this, BSTR, JobGuid, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbProvisioning.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateVirtualMachines := CallbackCreate(GetMethod(implObj, "CreateVirtualMachines"), flags, 4)
        this.vtbl.PatchVirtualMachines := CallbackCreate(GetMethod(implObj, "PatchVirtualMachines"), flags, 5)
        this.vtbl.DeleteVirtualMachines := CallbackCreate(GetMethod(implObj, "DeleteVirtualMachines"), flags, 4)
        this.vtbl.CancelJob := CallbackCreate(GetMethod(implObj, "CancelJob"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateVirtualMachines)
        CallbackFree(this.vtbl.PatchVirtualMachines)
        CallbackFree(this.vtbl.DeleteVirtualMachines)
        CallbackFree(this.vtbl.CancelJob)
    }
}
