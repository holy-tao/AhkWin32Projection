#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMSitesContainer interface provides the methods required to access the scope of management (SOM) objects that represent sites in a forest.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmsitescontainer
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMSitesContainer extends IDispatch{
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
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_DomainController(pVal) {
        result := ComCall(7, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Domain(pVal) {
        result := ComCall(8, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Forest(pVal) {
        result := ComCall(9, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSiteName 
     * @param {Pointer<IGPMSOM>} ppSOM 
     * @returns {HRESULT} 
     */
    GetSite(bstrSiteName, ppSOM) {
        bstrSiteName := bstrSiteName is String ? BSTR.Alloc(bstrSiteName).Value : bstrSiteName

        result := ComCall(10, this, "ptr", bstrSiteName, "ptr", ppSOM, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IGPMSearchCriteria>} pIGPMSearchCriteria 
     * @param {Pointer<IGPMSOMCollection>} ppIGPMSOMCollection 
     * @returns {HRESULT} 
     */
    SearchSites(pIGPMSearchCriteria, ppIGPMSOMCollection) {
        result := ComCall(11, this, "ptr", pIGPMSearchCriteria, "ptr", ppIGPMSOMCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
