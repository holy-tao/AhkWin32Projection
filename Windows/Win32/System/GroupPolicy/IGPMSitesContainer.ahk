#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IGPMSOM.ahk
#Include .\IGPMSOMCollection.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMSitesContainer interface provides the methods required to access the scope of management (SOM) objects that represent sites in a forest.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmsitescontainer
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMSitesContainer extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMSitesContainer
     * @type {Guid}
     */
    static IID => Guid("{4725a899-2782-4d27-a6bb-d499246ffd72}")

    /**
     * The class identifier for GPMSitesContainer
     * @type {Guid}
     */
    static CLSID => Guid("{229f5c42-852c-4b30-945f-c522be9bd386}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DomainController", "get_Domain", "get_Forest", "GetSite", "SearchSites"]

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
     * @type {BSTR} 
     */
    Forest {
        get => this.get_Forest()
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
     * 
     * @returns {BSTR} 
     */
    get_Forest() {
        pVal := BSTR()
        result := ComCall(9, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Returns the scope of management (SOM) object that corresponds to the site.
     * @param {BSTR} bstrSiteName Required. The site of interest; for example, Default-first-site-name. Use null-terminated string.
     * @returns {IGPMSOM} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsom">IGPMSOM</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmsitescontainer-getsite
     */
    GetSite(bstrSiteName) {
        bstrSiteName := bstrSiteName is String ? BSTR.Alloc(bstrSiteName).Value : bstrSiteName

        result := ComCall(10, this, "ptr", bstrSiteName, "ptr*", &ppSOM := 0, "HRESULT")
        return IGPMSOM(ppSOM)
    }

    /**
     * Retrieves a collection of scope of management (SOM) objects based on the specified search criteria. This method returns only site objects.
     * @param {IGPMSearchCriteria} pIGPMSearchCriteria Pointer to criteria to supply to the search. Valid criteria for the search include the following.
     * @returns {IGPMSOMCollection} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsomcollection">IGPMSOMCollection</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmsitescontainer-searchsites
     */
    SearchSites(pIGPMSearchCriteria) {
        result := ComCall(11, this, "ptr", pIGPMSearchCriteria, "ptr*", &ppIGPMSOMCollection := 0, "HRESULT")
        return IGPMSOMCollection(ppIGPMSOMCollection)
    }
}
