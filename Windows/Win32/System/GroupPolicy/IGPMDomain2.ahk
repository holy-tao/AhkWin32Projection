#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IGPMStarterGPO.ahk
#Include .\IGPMGPO.ahk
#Include .\IGPMStarterGPOCollection.ahk
#Include .\IGPMResult.ahk
#Include .\IGPMDomain.ahk

/**
 * Represents a given domain and supports methods that allow you to query scope of management (SOM) objects, create, restore and query Starter GPOs, and create and query WMI filters when you are using the Group Policy Management Console (GPMC) interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmdomain2
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMDomain2 extends IGPMDomain{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMDomain2
     * @type {Guid}
     */
    static IID => Guid("{7ca6bb8b-f1eb-490a-938d-3c4e51c768e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateStarterGPO", "CreateGPOFromStarterGPO", "GetStarterGPO", "SearchStarterGPOs", "LoadStarterGPO", "RestoreStarterGPO"]

    /**
     * Creates and retrieves a GPMStarterGPO object.
     * @returns {IGPMStarterGPO} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstartergpo">GPMStarterGPO</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmdomain2-createstartergpo
     */
    CreateStarterGPO() {
        result := ComCall(17, this, "ptr*", &ppnewTemplate := 0, "HRESULT")
        return IGPMStarterGPO(ppnewTemplate)
    }

    /**
     * Creates and retrieves a GPMGPO object from a GPMStarterGPO object.
     * @param {IGPMStarterGPO} pGPOTemplate A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstartergpo">GPMStarterGPO</a> object from which the new Group Policy object (GPO) will be created.
     * @returns {IGPMGPO} Address of a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpo">GPMGPO</a> object that represents the new GPO.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmdomain2-creategpofromstartergpo
     */
    CreateGPOFromStarterGPO(pGPOTemplate) {
        result := ComCall(18, this, "ptr", pGPOTemplate, "ptr*", &ppnewGPO := 0, "HRESULT")
        return IGPMGPO(ppnewGPO)
    }

    /**
     * Retrieves a GPMStarterGPO object that has a specified Group Policy object ID.
     * @param {BSTR} bstrGuid Required. GUID that represents the ID of the GPO to access. Use a null-terminated string.
     * @returns {IGPMStarterGPO} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstartergpo">IGPMStarterGPO</a> interface for the specified Starter GPO ID.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmdomain2-getstartergpo
     */
    GetStarterGPO(bstrGuid) {
        bstrGuid := bstrGuid is String ? BSTR.Alloc(bstrGuid).Value : bstrGuid

        result := ComCall(19, this, "ptr", bstrGuid, "ptr*", &ppTemplate := 0, "HRESULT")
        return IGPMStarterGPO(ppTemplate)
    }

    /**
     * Executes a search for GPMStarterGPO objects.
     * @param {IGPMSearchCriteria} pIGPMSearchCriteria Pointer to the criteria to apply to the search.
     * @returns {IGPMStarterGPOCollection} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstartergpocollection">IGPMStarterGPOCollection</a> interface that represents the GPOs found by the search.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmdomain2-searchstartergpos
     */
    SearchStarterGPOs(pIGPMSearchCriteria) {
        result := ComCall(20, this, "ptr", pIGPMSearchCriteria, "ptr*", &ppIGPMTemplateCollection := 0, "HRESULT")
        return IGPMStarterGPOCollection(ppIGPMTemplateCollection)
    }

    /**
     * Opens a Starter Group Policy object (GPO) cabinet (CAB) file and imports it into the domain.
     * @param {BSTR} bstrLoadFile Required. Name of the CAB file to load. Use a null-terminated string.
     * @param {VARIANT_BOOL} bOverwrite Determines whether to overwrite any existing versions of the Starter GPO.  Loading a Starter GPO from a CAB retains the ID of the original Starter GPO used to create the CAB, therefore it is possible to have a version of the Starter GPO already existing in the domain when the <b>LoadStarterGPO</b> method is called.
     * @param {Pointer<VARIANT>} pvarGPMProgress Specifies a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasyncprogress">IGPMAsyncProgress</a> interface that allows the client to receive status notifications about the progress of the copy operation. This parameter must be <b>NULL</b> if the client does not receive asynchronous notifications.
     * @param {Pointer<VARIANT>} pvarGPMCancel Receives a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface that the client can use to cancel the copy operation. This parameter is not returned if <i>pvarGPMProgress</i> is <b>NULL</b>.
     * @returns {IGPMResult} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface that represents the result of the load operation. That interface contains pointers to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpo">IGPMStarterGPO</a> interface and to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmdomain2-loadstartergpo
     */
    LoadStarterGPO(bstrLoadFile, bOverwrite, pvarGPMProgress, pvarGPMCancel) {
        bstrLoadFile := bstrLoadFile is String ? BSTR.Alloc(bstrLoadFile).Value : bstrLoadFile

        result := ComCall(21, this, "ptr", bstrLoadFile, "short", bOverwrite, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * Restores the Starter Group Policy object (GPO) from a GPMStarterGPOBackup object.
     * @param {IGPMStarterGPOBackup} pIGPMTmplBackup Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstartergpobackup">GPMStarterGPOBackup</a> object to restore.
     * @param {Pointer<VARIANT>} pvarGPMProgress Specifies a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasyncprogress">IGPMAsyncProgress</a> interface that allows the client to receive status notifications about the progress of the restore operation. The caller must create this interface and then pass the interface pointer in this parameter to receive asynchronous notifications. This parameter must be <b>NULL</b> if the client should not receive asynchronous notifications. The method runs asynchronously if  this parameter is not <b>NULL</b>, and the method runs synchronously if <b>NULL</b>.
     * @param {Pointer<VARIANT>} pvarGPMCancel Receives a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface that the client can use to cancel the restore operation. This parameter is not returned if <i>pvarGPMProgress</i> is <b>NULL</b>.
     * @returns {IGPMResult} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface that represents the result of the restore operation. That interface contains pointers to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstartergpo">IGPMstarterGPO</a> interface and to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmdomain2-restorestartergpo
     */
    RestoreStarterGPO(pIGPMTmplBackup, pvarGPMProgress, pvarGPMCancel) {
        result := ComCall(22, this, "ptr", pIGPMTmplBackup, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }
}
