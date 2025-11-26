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
     * 
     * @returns {IGPMGPO} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain-creategpo
     */
    CreateGPO() {
        result := ComCall(9, this, "ptr*", &ppNewGPO := 0, "HRESULT")
        return IGPMGPO(ppNewGPO)
    }

    /**
     * 
     * @param {BSTR} bstrGuid 
     * @returns {IGPMGPO} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain-getgpo
     */
    GetGPO(bstrGuid) {
        bstrGuid := bstrGuid is String ? BSTR.Alloc(bstrGuid).Value : bstrGuid

        result := ComCall(10, this, "ptr", bstrGuid, "ptr*", &ppGPO := 0, "HRESULT")
        return IGPMGPO(ppGPO)
    }

    /**
     * 
     * @param {IGPMSearchCriteria} pIGPMSearchCriteria 
     * @returns {IGPMGPOCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain-searchgpos
     */
    SearchGPOs(pIGPMSearchCriteria) {
        result := ComCall(11, this, "ptr", pIGPMSearchCriteria, "ptr*", &ppIGPMGPOCollection := 0, "HRESULT")
        return IGPMGPOCollection(ppIGPMGPOCollection)
    }

    /**
     * 
     * @param {IGPMBackup} pIGPMBackup 
     * @param {Integer} lDCFlags 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @returns {IGPMResult} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain-restoregpo
     */
    RestoreGPO(pIGPMBackup, lDCFlags, pvarGPMProgress, pvarGPMCancel) {
        result := ComCall(12, this, "ptr", pIGPMBackup, "int", lDCFlags, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * 
     * @param {BSTR} bstrPath 
     * @returns {IGPMSOM} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain-getsom
     */
    GetSOM(bstrPath) {
        bstrPath := bstrPath is String ? BSTR.Alloc(bstrPath).Value : bstrPath

        result := ComCall(13, this, "ptr", bstrPath, "ptr*", &ppSOM := 0, "HRESULT")
        return IGPMSOM(ppSOM)
    }

    /**
     * 
     * @param {IGPMSearchCriteria} pIGPMSearchCriteria 
     * @returns {IGPMSOMCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain-searchsoms
     */
    SearchSOMs(pIGPMSearchCriteria) {
        result := ComCall(14, this, "ptr", pIGPMSearchCriteria, "ptr*", &ppIGPMSOMCollection := 0, "HRESULT")
        return IGPMSOMCollection(ppIGPMSOMCollection)
    }

    /**
     * 
     * @param {BSTR} bstrPath 
     * @returns {IGPMWMIFilter} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain-getwmifilter
     */
    GetWMIFilter(bstrPath) {
        bstrPath := bstrPath is String ? BSTR.Alloc(bstrPath).Value : bstrPath

        result := ComCall(15, this, "ptr", bstrPath, "ptr*", &ppWMIFilter := 0, "HRESULT")
        return IGPMWMIFilter(ppWMIFilter)
    }

    /**
     * 
     * @param {IGPMSearchCriteria} pIGPMSearchCriteria 
     * @returns {IGPMWMIFilterCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain-searchwmifilters
     */
    SearchWMIFilters(pIGPMSearchCriteria) {
        result := ComCall(16, this, "ptr", pIGPMSearchCriteria, "ptr*", &ppIGPMWMIFilterCollection := 0, "HRESULT")
        return IGPMWMIFilterCollection(ppIGPMWMIFilterCollection)
    }
}
