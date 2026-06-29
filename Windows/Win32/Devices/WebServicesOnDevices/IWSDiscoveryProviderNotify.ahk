#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWSDiscoveredService.ahk" { IWSDiscoveredService }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Is implemented by the client program to receive callback notifications from IWSDiscoveryProvider.
 * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nn-wsddisco-iwsdiscoveryprovidernotify
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDiscoveryProviderNotify extends IUnknown {
    /**
     * The interface identifier for IWSDiscoveryProviderNotify
     * @type {Guid}
     */
    static IID := Guid("{73ee3ced-b6e6-4329-a546-3e8ad46563d2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDiscoveryProviderNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Add            : IntPtr
        Remove         : IntPtr
        SearchFailed   : IntPtr
        SearchComplete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDiscoveryProviderNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides information on either a newly announced discovery host (from a Hello message), or a match to a user initiated query.
     * @remarks
     * <b>Add</b> will be called once for each successful match to an outstanding query, and once per announcement of a new discovery host.
     * 
     * <div class="alert"><b>Note</b>  Multiple simultaneous calls may be made to <b>Add</b> by the provider, so it is essential that shared data be synchronized when implementing this callback routine.</div>
     * <div> </div>
     * @param {IWSDiscoveredService} pService A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveredservice">IWSDiscoveredService</a> interface that represents a remote discovery host.
     * @returns {HRESULT} The return value is not meaningful. An implementer should return S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-add
     */
    Add(pService) {
        result := ComCall(3, this, "ptr", pService, "HRESULT")
        return result
    }

    /**
     * Provides information on a recently departed discovery host (from a Bye message).
     * @remarks
     * <b>Remove</b> will be called once per announcement of a departing discovery host.
     * 
     * <div class="alert"><b>Note</b>  Multiple simultaneous calls may be made to <b>Remove</b> by the provider, so it is essential that shared data be synchronized when implementing this callback routine.</div>
     * <div> </div>
     * @param {IWSDiscoveredService} pService A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveredservice">IWSDiscoveredService</a> interface that represents a remote discovery host.
     * @returns {HRESULT} The return value is not meaningful. An implementer should return S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-remove
     */
    Remove(pService) {
        result := ComCall(4, this, "ptr", pService, "HRESULT")
        return result
    }

    /**
     * Is called to indicate a user initiated search has failed.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-searchcomplete">SearchComplete</a> is called if any responses were successfully received.
     * 
     * <b>SearchFailed</b> is called if a user initiated query does not result in a response. In this case, the value of the <i>hr</i> parameter will be S_FALSE.  <b>SearchFailed</b> can optionally be called if errors occur in the attempted transmission of the query, since query transmission is not necessarily synchronous. <i>pszTag</i> will match the user supplied tag from the query, and should be used to identify which query failed. 
     * 
     * The interval between initiating the search with <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-searchbytype">SearchByType</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-searchbyid">SearchById</a>  and receiving a <b>SearchFailed</b> notification is a maximum of 10 seconds, based on MATCH_TIMEOUT from <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery</a> and amended by the <a href="https://specs.xmlsoap.org/ws/2005/05/devprof/devicesprofile.pdf">DPWS Appendix I</a>. The interval between initiating the search with <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-searchbyaddress">SearchByAddress</a> and receipt of a <b>SearchFailed</b> notification is typically 21 seconds, but can be a maximum of 150 seconds.
     * 
     * <div class="alert"><b>Note</b>  Multiple simultaneous calls may be made to <b>SearchFailed</b> by the provider, so it is essential that shared data be synchronized in this callback.</div>
     * <div> </div>
     * @param {HRESULT} hr Cause of the search failure which initiated this callback.  A value of <b>S_FALSE</b> indicates the search completed without issuing any Add callbacks.
     * @param {PWSTR} pszTag Optional identifier tag for this search.  May be <b>NULL</b>.
     * @returns {HRESULT} The return value is not meaningful.  An implementer should return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-searchfailed
     */
    SearchFailed(hr, pszTag) {
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(5, this, "int", hr, "ptr", pszTag, "HRESULT")
        return result
    }

    /**
     * Called to indicate a user initiated search has successfully completed and no more matches for the search will be accepted.
     * @remarks
     * If no responses are received for a given search, then <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-searchfailed">IWSDiscoveryProviderNotify::SearchFailed</a> will be called to indicate this.
     * 
     * 
     * The interval between initiating the search with <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-searchbytype">SearchByType</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-searchbyid">SearchById</a> and receiving a <b>SearchComplete</b> notification is a maximum of 10 seconds, based on MATCH_TIMEOUT from <a href="https://specs.xmlsoap.org/ws/2005/04/discovery/ws-discovery.pdf">WS-Discovery</a> and amended by the <a href="https://specs.xmlsoap.org/ws/2005/05/devprof/devicesprofile.pdf">DPWS Appendix I</a>. The interval between initiating the search with <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoveryprovider-searchbyaddress">SearchByAddress</a> and receiving a <b>SearchComplete</b> notification is a maximum of 150 seconds.
     * @param {PWSTR} pszTag Search tag passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveryprovider">IWSDiscoveryProvider</a> search method.
     * @returns {HRESULT} The return value is not meaningful. An implementer should return S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-searchcomplete
     */
    SearchComplete(pszTag) {
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(6, this, "ptr", pszTag, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWSDiscoveryProviderNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.SearchFailed := CallbackCreate(GetMethod(implObj, "SearchFailed"), flags, 3)
        this.vtbl.SearchComplete := CallbackCreate(GetMethod(implObj, "SearchComplete"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.SearchFailed)
        CallbackFree(this.vtbl.SearchComplete)
    }
}
