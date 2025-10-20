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
     * 
     * @param {BSTR} JobXmlString 
     * @param {BSTR} JobGuid 
     * @param {Pointer<ITsSbProvisioningPluginNotifySink>} pSink 
     * @returns {HRESULT} 
     */
    CreateVirtualMachines(JobXmlString, JobGuid, pSink) {
        JobXmlString := JobXmlString is String ? BSTR.Alloc(JobXmlString).Value : JobXmlString
        JobGuid := JobGuid is String ? BSTR.Alloc(JobGuid).Value : JobGuid

        result := ComCall(5, this, "ptr", JobXmlString, "ptr", JobGuid, "ptr", pSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} JobXmlString 
     * @param {BSTR} JobGuid 
     * @param {Pointer<ITsSbProvisioningPluginNotifySink>} pSink 
     * @param {Pointer<VM_PATCH_INFO>} pVMPatchInfo 
     * @returns {HRESULT} 
     */
    PatchVirtualMachines(JobXmlString, JobGuid, pSink, pVMPatchInfo) {
        JobXmlString := JobXmlString is String ? BSTR.Alloc(JobXmlString).Value : JobXmlString
        JobGuid := JobGuid is String ? BSTR.Alloc(JobGuid).Value : JobGuid

        result := ComCall(6, this, "ptr", JobXmlString, "ptr", JobGuid, "ptr", pSink, "ptr", pVMPatchInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} JobXmlString 
     * @param {BSTR} JobGuid 
     * @param {Pointer<ITsSbProvisioningPluginNotifySink>} pSink 
     * @returns {HRESULT} 
     */
    DeleteVirtualMachines(JobXmlString, JobGuid, pSink) {
        JobXmlString := JobXmlString is String ? BSTR.Alloc(JobXmlString).Value : JobXmlString
        JobGuid := JobGuid is String ? BSTR.Alloc(JobGuid).Value : JobGuid

        result := ComCall(7, this, "ptr", JobXmlString, "ptr", JobGuid, "ptr", pSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} JobGuid 
     * @returns {HRESULT} 
     */
    CancelJob(JobGuid) {
        JobGuid := JobGuid is String ? BSTR.Alloc(JobGuid).Value : JobGuid

        result := ComCall(8, this, "ptr", JobGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
