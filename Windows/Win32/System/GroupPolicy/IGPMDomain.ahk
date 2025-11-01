#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_DomainController(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Domain(pVal) {
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IGPMGPO>} ppNewGPO 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain-creategpo
     */
    CreateGPO(ppNewGPO) {
        result := ComCall(9, this, "ptr*", ppNewGPO, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrGuid 
     * @param {Pointer<IGPMGPO>} ppGPO 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain-getgpo
     */
    GetGPO(bstrGuid, ppGPO) {
        bstrGuid := bstrGuid is String ? BSTR.Alloc(bstrGuid).Value : bstrGuid

        result := ComCall(10, this, "ptr", bstrGuid, "ptr*", ppGPO, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGPMSearchCriteria} pIGPMSearchCriteria 
     * @param {Pointer<IGPMGPOCollection>} ppIGPMGPOCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain-searchgpos
     */
    SearchGPOs(pIGPMSearchCriteria, ppIGPMGPOCollection) {
        result := ComCall(11, this, "ptr", pIGPMSearchCriteria, "ptr*", ppIGPMGPOCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGPMBackup} pIGPMBackup 
     * @param {Integer} lDCFlags 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @param {Pointer<IGPMResult>} ppIGPMResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain-restoregpo
     */
    RestoreGPO(pIGPMBackup, lDCFlags, pvarGPMProgress, pvarGPMCancel, ppIGPMResult) {
        result := ComCall(12, this, "ptr", pIGPMBackup, "int", lDCFlags, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", ppIGPMResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPath 
     * @param {Pointer<IGPMSOM>} ppSOM 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain-getsom
     */
    GetSOM(bstrPath, ppSOM) {
        bstrPath := bstrPath is String ? BSTR.Alloc(bstrPath).Value : bstrPath

        result := ComCall(13, this, "ptr", bstrPath, "ptr*", ppSOM, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGPMSearchCriteria} pIGPMSearchCriteria 
     * @param {Pointer<IGPMSOMCollection>} ppIGPMSOMCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain-searchsoms
     */
    SearchSOMs(pIGPMSearchCriteria, ppIGPMSOMCollection) {
        result := ComCall(14, this, "ptr", pIGPMSearchCriteria, "ptr*", ppIGPMSOMCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPath 
     * @param {Pointer<IGPMWMIFilter>} ppWMIFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain-getwmifilter
     */
    GetWMIFilter(bstrPath, ppWMIFilter) {
        bstrPath := bstrPath is String ? BSTR.Alloc(bstrPath).Value : bstrPath

        result := ComCall(15, this, "ptr", bstrPath, "ptr*", ppWMIFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGPMSearchCriteria} pIGPMSearchCriteria 
     * @param {Pointer<IGPMWMIFilterCollection>} ppIGPMWMIFilterCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmdomain-searchwmifilters
     */
    SearchWMIFilters(pIGPMSearchCriteria, ppIGPMWMIFilterCollection) {
        result := ComCall(16, this, "ptr", pIGPMSearchCriteria, "ptr*", ppIGPMWMIFilterCollection, "HRESULT")
        return result
    }
}
