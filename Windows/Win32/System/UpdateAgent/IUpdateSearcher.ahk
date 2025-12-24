#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISearchJob.ahk
#Include .\ISearchResult.ahk
#Include .\IUpdateHistoryEntryCollection.ahk
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
     * @type {VARIANT_BOOL} 
     */
    CanAutomaticallyUpgradeService {
        get => this.get_CanAutomaticallyUpgradeService()
        set => this.put_CanAutomaticallyUpgradeService(value)
    }

    /**
     * @type {BSTR} 
     */
    ClientApplicationID {
        get => this.get_ClientApplicationID()
        set => this.put_ClientApplicationID(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IncludePotentiallySupersededUpdates {
        get => this.get_IncludePotentiallySupersededUpdates()
        set => this.put_IncludePotentiallySupersededUpdates(value)
    }

    /**
     * @type {Integer} 
     */
    ServerSelection {
        get => this.get_ServerSelection()
        set => this.put_ServerSelection(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Online {
        get => this.get_Online()
        set => this.put_Online(value)
    }

    /**
     * @type {BSTR} 
     */
    ServiceID {
        get => this.get_ServiceID()
        set => this.put_ServiceID(value)
    }

    /**
     * Gets and sets a Boolean value that indicates whether future calls to the BeginSearch and Search methods result in an automatic upgrade to Windows Update Agent (WUA).
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatesearcher-get_canautomaticallyupgradeservice
     */
    get_CanAutomaticallyUpgradeService() {
        result := ComCall(7, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a Boolean value that indicates whether future calls to the BeginSearch and Search methods result in an automatic upgrade to Windows Update Agent (WUA).
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatesearcher-put_canautomaticallyupgradeservice
     */
    put_CanAutomaticallyUpgradeService(value) {
        result := ComCall(8, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Identifies the current client application.
     * @remarks
     * 
     * Returns the Unknown value if the client application has not set the property.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatesearcher-get_clientapplicationid
     */
    get_ClientApplicationID() {
        retval := BSTR()
        result := ComCall(9, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Identifies the current client application.
     * @remarks
     * 
     * Returns the Unknown value if the client application has not set the property.
     * 
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatesearcher-put_clientapplicationid
     */
    put_ClientApplicationID(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(10, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Gets and sets a Boolean value that indicates whether the search results include updates that are superseded by other updates in the search results.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatesearcher-get_includepotentiallysupersededupdates
     */
    get_IncludePotentiallySupersededUpdates() {
        result := ComCall(11, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a Boolean value that indicates whether the search results include updates that are superseded by other updates in the search results.
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatesearcher-put_includepotentiallysupersededupdates
     */
    put_IncludePotentiallySupersededUpdates(value) {
        result := ComCall(12, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Gets and sets a ServerSelection value that indicates the server to search for updates.
     * @remarks
     * 
     *  The site that is not a Windows Update site that is specified by the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-get_serviceid">ServiceID</a> property is searched only if the value of the <b>ServerSelection</b> property is  ssOthers.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatesearcher-get_serverselection
     */
    get_ServerSelection() {
        result := ComCall(13, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a ServerSelection value that indicates the server to search for updates.
     * @remarks
     * 
     *  The site that is not a Windows Update site that is specified by the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-get_serviceid">ServiceID</a> property is searched only if the value of the <b>ServerSelection</b> property is  ssOthers.
     * 
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatesearcher-put_serverselection
     */
    put_ServerSelection(value) {
        result := ComCall(14, this, "int", value, "HRESULT")
        return result
    }

    /**
     * Begins execution of an asynchronous search for updates. The search uses the search options that are currently configured.
     * @param {BSTR} criteria A string that specifies the search criteria.
     * @param {IUnknown} onCompleted An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-isearchcompletedcallback">ISearchCompletedCallback</a> interface that is called when an asynchronous search operation is complete.
     * @param {VARIANT} state The caller-specific  state that is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-isearchjob-get_asyncstate">AsyncState</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-isearchjob">ISearchJob</a> interface.
     * @returns {ISearchJob} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-isearchjob">ISearchJob</a> interface that represents the current operation that might be pending. 
     * 
     * The caller passes the returned value to the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-endsearch">EndSearch</a> method to complete a search operation.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatesearcher-beginsearch
     */
    BeginSearch(criteria, onCompleted, state) {
        criteria := criteria is String ? BSTR.Alloc(criteria).Value : criteria

        result := ComCall(15, this, "ptr", criteria, "ptr", onCompleted, "ptr", state, "ptr*", &retval := 0, "HRESULT")
        return ISearchJob(retval)
    }

    /**
     * Completes an asynchronous search for updates.
     * @param {ISearchJob} searchJob The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-isearchjob">ISearchJob</a> interface that the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-beginsearch">BeginSearch</a> method returns.
     * @returns {ISearchResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-isearchresult">ISearchResult</a> interface that contains the following:
     * 
     * <ul>
     * <li>The result of an operation</li>
     * <li>A collection of updates that match the search criteria</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatesearcher-endsearch
     */
    EndSearch(searchJob) {
        result := ComCall(16, this, "ptr", searchJob, "ptr*", &retval := 0, "HRESULT")
        return ISearchResult(retval)
    }

    /**
     * Converts a string into a string that can be used as a literal value in a search criteria string.
     * @param {BSTR} unescaped A string to be escaped.
     * @returns {BSTR} The resulting escaped string.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatesearcher-escapestring
     */
    EscapeString(unescaped) {
        unescaped := unescaped is String ? BSTR.Alloc(unescaped).Value : unescaped

        retval := BSTR()
        result := ComCall(17, this, "ptr", unescaped, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Synchronously queries the computer for the history of the update events.
     * @param {Integer} startIndex The index of the first event to retrieve.
     * @param {Integer} count The number of events to retrieve.
     * @returns {IUpdateHistoryEntryCollection} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentrycollection">IUpdateHistoryEntryCollection</a> interface that contains matching event records on the computer in descending chronological order.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatesearcher-queryhistory
     */
    QueryHistory(startIndex, count) {
        result := ComCall(18, this, "int", startIndex, "int", count, "ptr*", &retval := 0, "HRESULT")
        return IUpdateHistoryEntryCollection(retval)
    }

    /**
     * Performs a synchronous search for updates. The search uses the search options that are currently configured.
     * @param {BSTR} criteria A string that specifies the search criteria.
     * @returns {ISearchResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-isearchresult">ISearchResult</a> interface that contains the following:
     * 
     * <ul>
     * <li>The result of an operation</li>
     * <li>A collection of updates that match the search criteria</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatesearcher-search
     */
    Search(criteria) {
        criteria := criteria is String ? BSTR.Alloc(criteria).Value : criteria

        result := ComCall(19, this, "ptr", criteria, "ptr*", &retval := 0, "HRESULT")
        return ISearchResult(retval)
    }

    /**
     * Gets and sets a Boolean value that indicates whether the UpdateSearcher goes online to search for updates.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatesearcher-get_online
     */
    get_Online() {
        result := ComCall(20, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a Boolean value that indicates whether the UpdateSearcher goes online to search for updates.
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatesearcher-put_online
     */
    put_Online(value) {
        result := ComCall(21, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Returns the number of update events on the computer.
     * @returns {Integer} The number of update events on the computer.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatesearcher-gettotalhistorycount
     */
    GetTotalHistoryCount() {
        result := ComCall(22, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a site to search when the site to search is not a Windows Update site.
     * @remarks
     * 
     * The site that is not a Windows Update site that is specified by the value of the <b>ServiceID</b> property is searched only if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-get_serverselection">ServerSelection</a> property is  ssOthers.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatesearcher-get_serviceid
     */
    get_ServiceID() {
        retval := BSTR()
        result := ComCall(23, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a site to search when the site to search is not a Windows Update site.
     * @remarks
     * 
     * The site that is not a Windows Update site that is specified by the value of the <b>ServiceID</b> property is searched only if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-get_serverselection">ServerSelection</a> property is  ssOthers.
     * 
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatesearcher-put_serviceid
     */
    put_ServiceID(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(24, this, "ptr", value, "HRESULT")
        return result
    }
}
