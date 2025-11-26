#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IGPMGPO.ahk
#Include .\IGPMGPOCollection.ahk
#Include .\IGPMResult.ahk
#Include .\IGPMSOM.ahk
#Include .\IGPMSOMCollection.ahk
#Include .\IGPMWMIFilter.ahk
#Include .\IGPMWMIFilterCollection.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents a given domain and supports methods that allow you to query scope of management (SOM) objects, create, restore and query GPOs, and create and query WMI filters when you are using the Group Policy Management Console (GPMC) interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmdomain
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMDomain extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMDomain
     * @type {Guid}
     */
    static IID => Guid("{6b21cc14-5a00-4f44-a738-feec8a94c7e3}")

    /**
     * The class identifier for GPMDomain
     * @type {Guid}
     */
    static CLSID => Guid("{710901be-1050-4cb1-838a-c5cff259e183}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DomainController", "get_Domain", "CreateGPO", "GetGPO", "SearchGPOs", "RestoreGPO", "GetSOM", "SearchSOMs", "GetWMIFilter", "SearchWMIFilters"]

    /**
     * @type {BSTR} 
     */
    DomainController {
        get => this.get_DomainController()
    }

    /**
     * @type {BSTR} 
     */
    Domain {
        get => this.get_Domain()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DomainController() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Domain() {
        pVal := BSTR()
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Creates and retrieves a GPMGPO object with a default display name. Typically, the caller sets the display name immediately after calling this method.
     * @returns {IGPMGPO} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpo">IGPMGPO</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmdomain-creategpo
     */
    CreateGPO() {
        result := ComCall(9, this, "ptr*", &ppNewGPO := 0, "HRESULT")
        return IGPMGPO(ppNewGPO)
    }

    /**
     * Retrieves a GPMGPO object with a specified Group Policy object (GPO) ID. The group policy object ID is represented by a GUID.
     * @param {BSTR} bstrGuid Required. GUID representing the ID of the group policy object to access. Use null-terminated string.
     * @returns {IGPMGPO} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpo">IGPMGPO</a> interface for the group policy object ID and domain specified.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmdomain-getgpo
     */
    GetGPO(bstrGuid) {
        bstrGuid := bstrGuid is String ? BSTR.Alloc(bstrGuid).Value : bstrGuid

        result := ComCall(10, this, "ptr", bstrGuid, "ptr*", &ppGPO := 0, "HRESULT")
        return IGPMGPO(ppGPO)
    }

    /**
     * Executes a search for GPMGPO objects in the domain and then returns a GPMGPOCollection object.
     * @param {IGPMSearchCriteria} pIGPMSearchCriteria <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsearchcriteria">GPMSearchCriteria</a> object to apply to the search.
     * Pointer to the criteria to apply to the search.
     * @returns {IGPMGPOCollection} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpocollection">IGPMGPOCollection</a> interface representing the GPOs found by the search.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmdomain-searchgpos
     */
    SearchGPOs(pIGPMSearchCriteria) {
        result := ComCall(11, this, "ptr", pIGPMSearchCriteria, "ptr*", &ppIGPMGPOCollection := 0, "HRESULT")
        return IGPMGPOCollection(ppIGPMGPOCollection)
    }

    /**
     * Restores a Group Policy object (GPO) from a GPMBackup object.
     * @param {IGPMBackup} pIGPMBackup Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">GPMBackup</a> object to restore.
     * @param {Integer} lDCFlags Flags to use for validation. If this parameter is set to zero, the method validates the domain controller to determine whether the restore operation can be performed. If you specify <b>GPM_DONOT_VALIDATEDC</b>, the method does not validate the DC. This parameter is ignored for GPOs that do not include software policy settings. For more information about validation, see the "Remarks" section.
     * @param {Pointer<VARIANT>} pvarGPMProgress Specifies a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasyncprogress">IGPMAsyncProgress</a> interface that allows the client to receive status notifications about the progress of the restore operation. To receive asynchronous notifications, the caller must create this interface and then pass the interface pointer in this parameter. This parameter must be <b>NULL</b> if the client should not receive asynchronous notifications. The method will run asynchronously if  this parameter is not <b>NULL</b> and will run synchronously if <b>NULL</b>.
     * @param {Pointer<VARIANT>} pvarGPMCancel Receives a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface that the client can use to cancel the restore operation. This parameter is not returned if <i>pvarGPMProgress</i> is <b>NULL</b>.
     * @returns {IGPMResult} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface that represents the result of the restore operation. That interface contains pointers to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpo">IGPMGPO</a> interface and an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmdomain-restoregpo
     */
    RestoreGPO(pIGPMBackup, lDCFlags, pvarGPMProgress, pvarGPMCancel) {
        result := ComCall(12, this, "ptr", pIGPMBackup, "int", lDCFlags, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * Retrieves the IGPMSOM interface that represents the domain or the organizational unit (OU) at the specified path.
     * @param {BSTR} bstrPath Path of the scope of management (SOM) object.  The path must be a fully qualified distinguished name. Use the following syntax for the path: (ou=<i>MyOU</i>,dc=<i>domain_name</i>,dc=<i>com</i>).
     * 
     * <b>C++:  </b>If <b>NULL</b> is specified, the method returns a pointer to the 
     * <b>IGPMSOM</b> interface for the domain.
     * 
     * <b>Scripting:  </b>If an empty string ("") is specified, the method returns a pointer to the 
     * <b>IGPMSOM</b> interface for the domain.
     * @returns {IGPMSOM} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsom">IGPMSOM</a> interface at the specified path.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmdomain-getsom
     */
    GetSOM(bstrPath) {
        bstrPath := bstrPath is String ? BSTR.Alloc(bstrPath).Value : bstrPath

        result := ComCall(13, this, "ptr", bstrPath, "ptr*", &ppSOM := 0, "HRESULT")
        return IGPMSOM(ppSOM)
    }

    /**
     * Executes a search for GPMSOM objects (domains and organizational units) in the domain and then returns a GPMSOMCollection object.
     * @param {IGPMSearchCriteria} pIGPMSearchCriteria <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsearchcriteria">GPMSearchCriteria</a> object to apply to the search.
     * @returns {IGPMSOMCollection} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsomcollection">IGPMSOMCollection</a> interface that represents the scopes of management (SOMs) found by the search.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmdomain-searchsoms
     */
    SearchSOMs(pIGPMSearchCriteria) {
        result := ComCall(14, this, "ptr", pIGPMSearchCriteria, "ptr*", &ppIGPMSOMCollection := 0, "HRESULT")
        return IGPMSOMCollection(ppIGPMSOMCollection)
    }

    /**
     * Retrieves a GPMWMIFilter object for the specified path.
     * @param {BSTR} bstrPath Path of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmwmifilter">GPMWMIFilter</a> object to retrieve, in the following format: MSFT_SomFilter.Domain="<i>&lt;domain of the WMI filter&gt;</i>", ID="<i>&lt;GUID that represents the WMI filter&gt;</i>". Consider this example: MSFT_SomFilter.Domain="example.microsoft.com", ID="{7ab06d20-5e0a-4de9-8170-13dea779a528}".
     * @returns {IGPMWMIFilter} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmwmifilter">IGPMWMIFilter</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmdomain-getwmifilter
     */
    GetWMIFilter(bstrPath) {
        bstrPath := bstrPath is String ? BSTR.Alloc(bstrPath).Value : bstrPath

        result := ComCall(15, this, "ptr", bstrPath, "ptr*", &ppWMIFilter := 0, "HRESULT")
        return IGPMWMIFilter(ppWMIFilter)
    }

    /**
     * Executes a search for GPMWMIFilter objects in the domain and then returns a GPMWMIFilterCollection object.
     * @param {IGPMSearchCriteria} pIGPMSearchCriteria This parameter should be <b>NULL</b>, or it should point to an empty <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsearchcriteria">IGPMSearchCriteria</a> interface, because no search criteria are allowed for Windows Management Instrumentation (WMI) filters.
     * @returns {IGPMWMIFilterCollection} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpocollection">IGPMWMIFilterCollection</a> interface that represents the WMI filters found by the search.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmdomain-searchwmifilters
     */
    SearchWMIFilters(pIGPMSearchCriteria) {
        result := ComCall(16, this, "ptr", pIGPMSearchCriteria, "ptr*", &ppIGPMWMIFilterCollection := 0, "HRESULT")
        return IGPMWMIFilterCollection(ppIGPMWMIFilterCollection)
    }
}
