#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Searches for updates on a server.
 * @remarks
 * 
  * You can create an instance of this interface by using the UpdateSearcher coclass. Use the Microsoft.Update.Searcher program identifier to create the object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdatesearcher
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateSearcher extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateSearcher
     * @type {Guid}
     */
    static IID => Guid("{8f45abf1-f9ae-4b95-a933-f0f66e5056ea}")

    /**
     * The class identifier for UpdateSearcher
     * @type {Guid}
     */
    static CLSID => Guid("{b699e5e8-67ff-4177-88b0-3684a3388bfb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanAutomaticallyUpgradeService", "put_CanAutomaticallyUpgradeService", "get_ClientApplicationID", "put_ClientApplicationID", "get_IncludePotentiallySupersededUpdates", "put_IncludePotentiallySupersededUpdates", "get_ServerSelection", "put_ServerSelection", "BeginSearch", "EndSearch", "EscapeString", "QueryHistory", "Search", "get_Online", "put_Online", "GetTotalHistoryCount", "get_ServiceID", "put_ServiceID"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-get_canautomaticallyupgradeservice
     */
    get_CanAutomaticallyUpgradeService(retval) {
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-put_canautomaticallyupgradeservice
     */
    put_CanAutomaticallyUpgradeService(value) {
        result := ComCall(8, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-get_clientapplicationid
     */
    get_ClientApplicationID(retval) {
        result := ComCall(9, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-put_clientapplicationid
     */
    put_ClientApplicationID(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(10, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-get_includepotentiallysupersededupdates
     */
    get_IncludePotentiallySupersededUpdates(retval) {
        result := ComCall(11, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-put_includepotentiallysupersededupdates
     */
    put_IncludePotentiallySupersededUpdates(value) {
        result := ComCall(12, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-get_serverselection
     */
    get_ServerSelection(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-put_serverselection
     */
    put_ServerSelection(value) {
        result := ComCall(14, this, "int", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} criteria 
     * @param {IUnknown} onCompleted 
     * @param {VARIANT} state 
     * @param {Pointer<ISearchJob>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-beginsearch
     */
    BeginSearch(criteria, onCompleted, state, retval) {
        criteria := criteria is String ? BSTR.Alloc(criteria).Value : criteria

        result := ComCall(15, this, "ptr", criteria, "ptr", onCompleted, "ptr", state, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISearchJob} searchJob 
     * @param {Pointer<ISearchResult>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-endsearch
     */
    EndSearch(searchJob, retval) {
        result := ComCall(16, this, "ptr", searchJob, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} unescaped 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-escapestring
     */
    EscapeString(unescaped, retval) {
        unescaped := unescaped is String ? BSTR.Alloc(unescaped).Value : unescaped

        result := ComCall(17, this, "ptr", unescaped, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} startIndex 
     * @param {Integer} count 
     * @param {Pointer<IUpdateHistoryEntryCollection>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-queryhistory
     */
    QueryHistory(startIndex, count, retval) {
        result := ComCall(18, this, "int", startIndex, "int", count, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} criteria 
     * @param {Pointer<ISearchResult>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-search
     */
    Search(criteria, retval) {
        criteria := criteria is String ? BSTR.Alloc(criteria).Value : criteria

        result := ComCall(19, this, "ptr", criteria, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-get_online
     */
    get_Online(retval) {
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-put_online
     */
    put_Online(value) {
        result := ComCall(21, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-gettotalhistorycount
     */
    GetTotalHistoryCount(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-get_serviceid
     */
    get_ServiceID(retval) {
        result := ComCall(23, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-put_serviceid
     */
    put_ServiceID(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(24, this, "ptr", value, "HRESULT")
        return result
    }
}
