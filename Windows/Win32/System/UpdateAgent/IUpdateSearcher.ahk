#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISearchJob.ahk
#Include .\ISearchResult.ahk
#Include .\IUpdateHistoryEntryCollection.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Searches for updates on a server. (IUpdateSearcher)
 * @remarks
 * You can create an instance of this interface by using the UpdateSearcher coclass. Use the Microsoft.Update.Searcher program identifier to create the object.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdatesearcher
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
     * Gets and sets a Boolean value that indicates whether future calls to the BeginSearch and Search methods result in an automatic upgrade to Windows Update Agent (WUA). (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-get_canautomaticallyupgradeservice
     */
    get_CanAutomaticallyUpgradeService() {
        result := ComCall(7, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a Boolean value that indicates whether future calls to the BeginSearch and Search methods result in an automatic upgrade to Windows Update Agent (WUA). (Put)
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-put_canautomaticallyupgradeservice
     */
    put_CanAutomaticallyUpgradeService(value) {
        result := ComCall(8, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Identifies the current client application. (Get)
     * @remarks
     * Returns the Unknown value if the client application has not set the property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-get_clientapplicationid
     */
    get_ClientApplicationID() {
        retval := BSTR()
        result := ComCall(9, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Identifies the current client application. (Put)
     * @remarks
     * Returns the Unknown value if the client application has not set the property.
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
     * Gets and sets a Boolean value that indicates whether the search results include updates that are superseded by other updates in the search results. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-get_includepotentiallysupersededupdates
     */
    get_IncludePotentiallySupersededUpdates() {
        result := ComCall(11, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a Boolean value that indicates whether the search results include updates that are superseded by other updates in the search results. (Put)
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-put_includepotentiallysupersededupdates
     */
    put_IncludePotentiallySupersededUpdates(value) {
        result := ComCall(12, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Gets and sets a ServerSelection value that indicates the server to search for updates. (Get)
     * @remarks
     * The site that is not a Windows Update site that is specified by the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-get_serviceid">ServiceID</a> property is searched only if the value of the <b>ServerSelection</b> property is  ssOthers.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-get_serverselection
     */
    get_ServerSelection() {
        result := ComCall(13, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a ServerSelection value that indicates the server to search for updates. (Put)
     * @remarks
     * The site that is not a Windows Update site that is specified by the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-get_serviceid">ServiceID</a> property is searched only if the value of the <b>ServerSelection</b> property is  ssOthers.
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-put_serverselection
     */
    put_ServerSelection(value) {
        result := ComCall(14, this, "int", value, "HRESULT")
        return result
    }

    /**
     * Begins execution of an asynchronous search for updates. The search uses the search options that are currently configured.
     * @remarks
     * For a complete description of search criteria syntax, see <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-search">Search</a>.
     * 
     *   As an alternative to implementing the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-isearchcompletedcallback">ISearchCompletedCallback</a> interface, you can use a script to   implement a callback routine of any identifier with DISPID 0 on an automation object. The type of the <i>onCompleted</i> parameter is <b>IUnknown*</b>.
     * 
     * When you use any asynchronous WUA API in your app, you might need to implement a time-out mechanism. For more info about how to perform asynchronous WUA operations, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/guidelines-for-asynchronous-wua-operations">Guidelines for Asynchronous WUA Operations</a>.
     * @param {BSTR} criteria A string that specifies the search criteria.
     * @param {IUnknown} onCompleted An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-isearchcompletedcallback">ISearchCompletedCallback</a> interface that is called when an asynchronous search operation is complete.
     * @param {VARIANT} state The caller-specific  state that is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-isearchjob-get_asyncstate">AsyncState</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-isearchjob">ISearchJob</a> interface.
     * @returns {ISearchJob} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-isearchjob">ISearchJob</a> interface that represents the current operation that might be pending. 
     * 
     * The caller passes the returned value to the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-endsearch">EndSearch</a> method to complete a search operation.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-beginsearch
     */
    BeginSearch(criteria, onCompleted, state) {
        criteria := criteria is String ? BSTR.Alloc(criteria).Value : criteria

        result := ComCall(15, this, "ptr", criteria, "ptr", onCompleted, "ptr", state, "ptr*", &retval := 0, "HRESULT")
        return ISearchJob(retval)
    }

    /**
     * Completes an asynchronous search for updates.
     * @remarks
     * When you use any asynchronous WUA API in your app, you might need to implement a time-out mechanism. For more info about how to perform asynchronous WUA operations, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/guidelines-for-asynchronous-wua-operations">Guidelines for Asynchronous WUA Operations</a>.
     * @param {ISearchJob} searchJob The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-isearchjob">ISearchJob</a> interface that the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-beginsearch">BeginSearch</a> method returns.
     * @returns {ISearchResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-isearchresult">ISearchResult</a> interface that contains the following:
     * 
     * <ul>
     * <li>The result of an operation</li>
     * <li>A collection of updates that match the search criteria</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-endsearch
     */
    EndSearch(searchJob) {
        result := ComCall(16, this, "ptr", searchJob, "ptr*", &retval := 0, "HRESULT")
        return ISearchResult(retval)
    }

    /**
     * Converts a string into a string that can be used as a literal value in a search criteria string.
     * @param {BSTR} unescaped A string to be escaped.
     * @returns {BSTR} The resulting escaped string.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-escapestring
     */
    EscapeString(unescaped) {
        unescaped := unescaped is String ? BSTR.Alloc(unescaped).Value : unescaped

        retval := BSTR()
        result := ComCall(17, this, "ptr", unescaped, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Synchronously queries the computer for the history of the update events.
     * @remarks
     * This method returns <b>WU_E_INVALIDINDEX</b> if  the <i>startIndex</i> parameter is less than 0 (zero) or if the <i>Count</i> parameter is less than or equal to 0 (zero).
     * @param {Integer} startIndex The index of the first event to retrieve.
     * @param {Integer} count The number of events to retrieve.
     * @returns {IUpdateHistoryEntryCollection} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentrycollection">IUpdateHistoryEntryCollection</a> interface that contains matching event records on the computer in descending chronological order.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-queryhistory
     */
    QueryHistory(startIndex, count) {
        result := ComCall(18, this, "int", startIndex, "int", count, "ptr*", &retval := 0, "HRESULT")
        return IUpdateHistoryEntryCollection(retval)
    }

    /**
     * Performs a synchronous search for updates. The search uses the search options that are currently configured.
     * @remarks
     * The string that is used for the <i>criteria</i> parameter must match the custom search language for the <b>Search</b> method.  The string consists of criteria that are evaluated to determine the updates to return.
     * 
     * Each criterion specifies an update property name and value. With some restrictions, multiple criteria can be connected with the <b>AND</b> and <b>OR</b> operators. The <b>=</b> (equal) and  <b>!=</b> (not-equal) operators are both supported. When you use Windows Update Agent (WUA), the <b>!=</b> (not-equal) operator can be used only with the type criterion.
     * 
     * The search criteria syntax is based on the WHERE clause of an SQL query expression. Most of the supported criteria map directly to update properties. These update properties resemble the elements in a virtual XML document that contains the entire server catalog. For example, if you specify a search criteria string of "AutoSelectOnWebSites = 1", the search returns all the updates that have a AutoSelectOnWebSites property with a value of <b>VARIANT_TRUE</b>.
     * 
     * A single criterion consists of "<i>Name</i> = <i>Value</i>" or "<i>Name</i> != <i>Value</i>", where "<i>Name</i>" is one of the supported criterion names, and "<i>Value</i>" is a string or an integer. The <b>AND</b> and <b>OR</b> operators can be used to connect multiple criteria. However, <b>OR</b> can be used only  at the top level of the search criteria. Therefore, "(x=1 and y=1) or (z=1)" is valid, but "(x=1) and (y=1 or z=1)" is not valid.
     * 
     * The supported value types are integers and strings. An integer must be specified in base 10, and negative numbers are prefixed with a minus sign (<b>-</b>). A string must be escaped and enclosed in single quotation marks ('). All string comparisons are case-insensitive unless specified.
     * 
     * The following table identifies all the public support criteria in the order of evaluation precedence. More criteria may be added to this list in the future.
     * 
     * <table>
     * <tr>
     * <th>Criterion</th>
     * <th>Type</th>
     * <th>Allowed operators</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>Type</td>
     * <td><b>string</b></td>
     * <td><b>=</b>, <b>!=</b></td>
     * <td>
     * Finds updates of a specific type, such as   "'Driver'" and "'Software'".
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>DeploymentAction</td>
     * <td><b>string</b></td>
     * <td><b>=</b></td>
     * <td>
     * Finds updates that are deployed for a specific action, such as an installation or uninstallation that  the administrator of a server specifies.
     * 
     * "DeploymentAction='Installation'" finds updates that are deployed for installation on a destination computer. "DeploymentAction='Uninstallation'" depends on the other query criteria.
     * 
     * "DeploymentAction='Uninstallation'" finds updates that are deployed for uninstallation on a destination computer. "DeploymentAction='Uninstallation'" depends on the other query criteria.
     * 
     * If this criterion is not explicitly specified, each group of criteria that is joined to an <b>AND</b> operator implies "DeploymentAction='Installation'".
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>IsAssigned</td>
     * <td><b>int(bool)</b></td>
     * <td><b>=</b></td>
     * <td>
     * Finds updates that are intended for deployment by Automatic Updates.
     * 
     * "IsAssigned=1" finds updates that are intended for deployment by Automatic Updates, which depends on the other query criteria. At most, one assigned Windows-based driver update is returned for each local device on a destination computer.
     * 
     * "IsAssigned=0" finds updates that are not intended to be  deployed by Automatic Updates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>BrowseOnly</td>
     * <td><b>int(bool)</b></td>
     * <td><b>=</b></td>
     * <td>
     * "BrowseOnly=1" finds updates that are considered optional.
     * 
     * "BrowseOnly=0" finds updates that are not considered optional.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>AutoSelectOnWebSites</td>
     * <td><b>int(bool)</b></td>
     * <td><b>=</b></td>
     * <td>
     * Finds updates where the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_autoselectonwebsites">AutoSelectOnWebSites</a> property has the specified value.
     * 
     * "AutoSelectOnWebSites=1" finds updates that are flagged to be automatically selected by Windows Update.
     * 
     * "AutoSelectOnWebSites=0" finds updates that are not flagged for Automatic Updates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>UpdateID</td>
     * <td><b>string(UUID)</b></td>
     * <td><b>=</b>, <b>!=</b></td>
     * <td>
     * Finds updates for which the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateidentity-get_updateid">UpdateIdentity.UpdateID</a> property matches the specified value. Can be used with the <b>!=</b> operator to find all the updates that do not have an <b>UpdateIdentity.UpdateID</b> of the specified value.
     * 
     * For example, "UpdateID='12345678-9abc-def0-1234-56789abcdef0'" finds updates for <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateidentity-get_updateid">UpdateIdentity.UpdateID</a> that equal 12345678-9abc-def0-1234-56789abcdef0.
     * 
     * For example, "UpdateID!='12345678-9abc-def0-1234-56789abcdef0'" finds updates for  <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateidentity-get_updateid">UpdateIdentity.UpdateID</a> that are not equal to 12345678-9abc-def0-1234-56789abcdef0.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  A RevisionNumber clause can be combined with an UpdateID clause that contains an <b>=</b> (equal)  operator. However, the RevisionNumber clause cannot  be combined with an UpdateID clause that contains the <b>!=</b> (not-equal) operator.</div>
     * <div> </div>
     * 
     * 
     *   
     * For example, "UpdateID='12345678-9abc-def0-1234-56789abcdef0' and RevisionNumber=100" can be used to find the update for <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateidentity-get_updateid">UpdateIdentity.UpdateID</a> that equals 12345678-9abc-def0-1234-56789abcdef0 and whose <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateidentity-get_revisionnumber">UpdateIdentity.RevisionNumber</a> equals 100.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>RevisionNumber</td>
     * <td><b>int</b></td>
     * <td><b>=</b></td>
     * <td>
     * Finds updates for which the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateidentity-get_revisionnumber">UpdateIdentity.RevisionNumber</a> property matches the specified value.
     * 
     * For example, "RevisionNumber=2" finds updates where <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateidentity-get_revisionnumber">UpdateIdentity.RevisionNumber</a> equals 2.
     * 
     * This criterion must be combined with the UpdateID property.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>CategoryIDs</td>
     * <td><b>string(uuid)</b></td>
     * <td><b>contains</b></td>
     * <td>
     * Finds updates that belong to a specified category.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>IsInstalled</td>
     * <td><b>int(bool)</b></td>
     * <td><b>=</b></td>
     * <td>
     * Finds updates that are <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_isinstalled">installed</a> on the destination computer.
     * 
     * "IsInstalled=1" finds updates that are installed on the destination computer.
     * 
     * "IsInstalled=0" finds updates that are not installed on the destination computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>IsHidden</td>
     * <td><b>int(bool)</b></td>
     * <td><b>=</b></td>
     * <td>
     * Finds updates that are marked as <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_ishidden">hidden</a> on the destination computer.
     * 
     * "IsHidden=1" finds updates that are marked as hidden on a destination computer. When you use this clause, you can set the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-get_includepotentiallysupersededupdates">UpdateSearcher.IncludePotentiallySupersededUpdates</a> property to <b>VARIANT_TRUE</b> so that a search returns the hidden updates. The hidden updates might be superseded by other updates in the same results.
     * 
     * "IsHidden=0" finds updates that are not marked as hidden. If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-get_includepotentiallysupersededupdates">UpdateSearcher.IncludePotentiallySupersededUpdates</a> property is set to <b>VARIANT_FALSE</b>, it is better to include that clause in the search filter string so that the updates that are superseded by hidden updates are included in the search results. <b>VARIANT_FALSE</b>  is the default value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>IsPresent</td>
     * <td><b>int(bool)</b></td>
     * <td><b>=</b></td>
     * <td>
     * When set to 1, finds updates that are present on a computer.
     * 
     * "IsPresent=1" finds updates that are present on a destination  computer. If the update is valid for one or more products, the update is considered present if it is installed for one or more of the products.
     * 
     * "IsPresent=0" finds updates that are not installed for any product on a destination computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>RebootRequired</td>
     * <td><b>int(bool)</b></td>
     * <td><b>=</b></td>
     * <td>
     * Finds updates that require a computer to be restarted to complete an installation or uninstallation.
     * 
     * "RebootRequired=1" finds updates that require a computer to be restarted to complete an installation or uninstallation.
     * 
     * "RebootRequired=0" finds updates that do not require a computer to be restarted  to complete an installation or uninstallation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The default search criteria for a search are as follows:
     * 
     * 
     * ``` syntax
     * ( IsInstalled = 0 and IsHidden = 0 )
     * ```
     * 
     * To find all the hidden updates (by using the  <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-get_includepotentiallysupersededupdates">UpdateSearcher.IncludePotentiallySupersededUpdates</a> property set to <b>VARIANT_TRUE</b>), use the following criterion:
     * 
     * 
     * ``` syntax
     *  ( IsHidden = 1 )
     * ```
     * @param {BSTR} criteria A string that specifies the search criteria.
     * @returns {ISearchResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-isearchresult">ISearchResult</a> interface that contains the following:
     * 
     * <ul>
     * <li>The result of an operation</li>
     * <li>A collection of updates that match the search criteria</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-search
     */
    Search(criteria) {
        criteria := criteria is String ? BSTR.Alloc(criteria).Value : criteria

        result := ComCall(19, this, "ptr", criteria, "ptr*", &retval := 0, "HRESULT")
        return ISearchResult(retval)
    }

    /**
     * Gets and sets a Boolean value that indicates whether the UpdateSearcher goes online to search for updates. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-get_online
     */
    get_Online() {
        result := ComCall(20, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a Boolean value that indicates whether the UpdateSearcher goes online to search for updates. (Put)
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-put_online
     */
    put_Online(value) {
        result := ComCall(21, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Returns the number of update events on the computer.
     * @returns {Integer} The number of update events on the computer.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-gettotalhistorycount
     */
    GetTotalHistoryCount() {
        result := ComCall(22, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a site to search when the site to search is not a Windows Update site. (Get)
     * @remarks
     * The site that is not a Windows Update site that is specified by the value of the <b>ServiceID</b> property is searched only if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-get_serverselection">ServerSelection</a> property is  ssOthers.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher-get_serviceid
     */
    get_ServiceID() {
        retval := BSTR()
        result := ComCall(23, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a site to search when the site to search is not a Windows Update site. (Put)
     * @remarks
     * The site that is not a Windows Update site that is specified by the value of the <b>ServiceID</b> property is searched only if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-get_serverselection">ServerSelection</a> property is  ssOthers.
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
