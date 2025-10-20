#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITsSbPlugin.ahk

/**
 * Exposes methods that create and maintain virtual machines.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbprovisioning
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
     * 
     * @param {BSTR} JobXmlString 
     * @param {BSTR} JobGuid 
     * @param {ITsSbProvisioningPluginNotifySink} pSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioning-createvirtualmachines
     */
    CreateVirtualMachines(JobXmlString, JobGuid, pSink) {
        JobXmlString := JobXmlString is String ? BSTR.Alloc(JobXmlString).Value : JobXmlString
        JobGuid := JobGuid is String ? BSTR.Alloc(JobGuid).Value : JobGuid

        result := ComCall(5, this, "ptr", JobXmlString, "ptr", JobGuid, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} JobXmlString 
     * @param {BSTR} JobGuid 
     * @param {ITsSbProvisioningPluginNotifySink} pSink 
     * @param {Pointer<VM_PATCH_INFO>} pVMPatchInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioning-patchvirtualmachines
     */
    PatchVirtualMachines(JobXmlString, JobGuid, pSink, pVMPatchInfo) {
        JobXmlString := JobXmlString is String ? BSTR.Alloc(JobXmlString).Value : JobXmlString
        JobGuid := JobGuid is String ? BSTR.Alloc(JobGuid).Value : JobGuid

        result := ComCall(6, this, "ptr", JobXmlString, "ptr", JobGuid, "ptr", pSink, "ptr", pVMPatchInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} JobXmlString 
     * @param {BSTR} JobGuid 
     * @param {ITsSbProvisioningPluginNotifySink} pSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioning-deletevirtualmachines
     */
    DeleteVirtualMachines(JobXmlString, JobGuid, pSink) {
        JobXmlString := JobXmlString is String ? BSTR.Alloc(JobXmlString).Value : JobXmlString
        JobGuid := JobGuid is String ? BSTR.Alloc(JobGuid).Value : JobGuid

        result := ComCall(7, this, "ptr", JobXmlString, "ptr", JobGuid, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} JobGuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbprovisioning-canceljob
     */
    CancelJob(JobGuid) {
        JobGuid := JobGuid is String ? BSTR.Alloc(JobGuid).Value : JobGuid

        result := ComCall(8, this, "ptr", JobGuid, "HRESULT")
        return result
    }
}
