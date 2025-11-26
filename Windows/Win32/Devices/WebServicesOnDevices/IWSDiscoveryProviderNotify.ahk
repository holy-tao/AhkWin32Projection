#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Is implemented by the client program to receive callback notifications from IWSDiscoveryProvider.
 * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nn-wsddisco-iwsdiscoveryprovidernotify
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDiscoveryProviderNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDiscoveryProviderNotify
     * @type {Guid}
     */
    static IID => Guid("{73ee3ced-b6e6-4329-a546-3e8ad46563d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Add", "Remove", "SearchFailed", "SearchComplete"]

    /**
     * Provides information on either a newly announced discovery host (from a Hello message), or a match to a user initiated query.
     * @param {IWSDiscoveredService} pService A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveredservice">IWSDiscoveredService</a> interface that represents a remote discovery host.
     * @returns {HRESULT} The return value is not meaningful. An implementer should return S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-add
     */
    Add(pService) {
        result := ComCall(3, this, "ptr", pService, "HRESULT")
        return result
    }

    /**
     * Provides information on a recently departed discovery host (from a Bye message).
     * @param {IWSDiscoveredService} pService A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveredservice">IWSDiscoveredService</a> interface that represents a remote discovery host.
     * @returns {HRESULT} The return value is not meaningful. An implementer should return S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-remove
     */
    Remove(pService) {
        result := ComCall(4, this, "ptr", pService, "HRESULT")
        return result
    }

    /**
     * Is called to indicate a user initiated search has failed.
     * @param {HRESULT} hr Cause of the search failure which initiated this callback.  A value of <b>S_FALSE</b> indicates the search completed without issuing any Add callbacks.
     * @param {PWSTR} pszTag Optional identifier tag for this search.  May be <b>NULL</b>.
     * @returns {HRESULT} The return value is not meaningful.  An implementer should return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-searchfailed
     */
    SearchFailed(hr, pszTag) {
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(5, this, "int", hr, "ptr", pszTag, "HRESULT")
        return result
    }

    /**
     * Called to indicate a user initiated search has successfully completed and no more matches for the search will be accepted.
     * @param {PWSTR} pszTag Search tag passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nn-wsddisco-iwsdiscoveryprovider">IWSDiscoveryProvider</a> search method.
     * @returns {HRESULT} The return value is not meaningful. An implementer should return S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-searchcomplete
     */
    SearchComplete(pszTag) {
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(6, this, "ptr", pszTag, "HRESULT")
        return result
    }
}
