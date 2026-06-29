#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IGPMSearchCriteria.ahk" { IGPMSearchCriteria }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGPMSOM.ahk" { IGPMSOM }
#Import ".\IGPMSOMCollection.ahk" { IGPMSOMCollection }

/**
 * The IGPMSitesContainer interface provides the methods required to access the scope of management (SOM) objects that represent sites in a forest.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmsitescontainer
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMSitesContainer extends IDispatch {
    /**
     * The interface identifier for IGPMSitesContainer
     * @type {Guid}
     */
    static IID := Guid("{4725a899-2782-4d27-a6bb-d499246ffd72}")

    /**
     * The class identifier for GPMSitesContainer
     * @type {Guid}
     */
    static CLSID := Guid("{229f5c42-852c-4b30-945f-c522be9bd386}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMSitesContainer interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_DomainController : IntPtr
        get_Domain           : IntPtr
        get_Forest           : IntPtr
        GetSite              : IntPtr
        SearchSites          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMSitesContainer.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        pVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Domain() {
        pVal := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Forest() {
        pVal := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Returns the scope of management (SOM) object that corresponds to the site.
     * @param {BSTR} bstrSiteName Required. The site of interest; for example, Default-first-site-name. Use null-terminated string.
     * @returns {IGPMSOM} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsom">IGPMSOM</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsitescontainer-getsite
     */
    GetSite(bstrSiteName) {
        bstrSiteName := bstrSiteName is String ? BSTR.Alloc(bstrSiteName).Value : bstrSiteName

        result := ComCall(10, this, BSTR, bstrSiteName, "ptr*", &ppSOM := 0, "HRESULT")
        return IGPMSOM(ppSOM)
    }

    /**
     * Retrieves a collection of scope of management (SOM) objects based on the specified search criteria. This method returns only site objects.
     * @param {IGPMSearchCriteria} pIGPMSearchCriteria Pointer to criteria to supply to the search. Valid criteria for the search include the following.
     * @returns {IGPMSOMCollection} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsomcollection">IGPMSOMCollection</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsitescontainer-searchsites
     */
    SearchSites(pIGPMSearchCriteria) {
        result := ComCall(11, this, "ptr", pIGPMSearchCriteria, "ptr*", &ppIGPMSOMCollection := 0, "HRESULT")
        return IGPMSOMCollection(ppIGPMSOMCollection)
    }

    Query(iid) {
        if (IGPMSitesContainer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DomainController := CallbackCreate(GetMethod(implObj, "get_DomainController"), flags, 2)
        this.vtbl.get_Domain := CallbackCreate(GetMethod(implObj, "get_Domain"), flags, 2)
        this.vtbl.get_Forest := CallbackCreate(GetMethod(implObj, "get_Forest"), flags, 2)
        this.vtbl.GetSite := CallbackCreate(GetMethod(implObj, "GetSite"), flags, 3)
        this.vtbl.SearchSites := CallbackCreate(GetMethod(implObj, "SearchSites"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DomainController)
        CallbackFree(this.vtbl.get_Domain)
        CallbackFree(this.vtbl.get_Forest)
        CallbackFree(this.vtbl.GetSite)
        CallbackFree(this.vtbl.SearchSites)
    }
}
