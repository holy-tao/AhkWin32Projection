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
     * 
     * @param {IWSDiscoveredService} pService 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-add
     */
    Add(pService) {
        result := ComCall(3, this, "ptr", pService, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWSDiscoveredService} pService 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-remove
     */
    Remove(pService) {
        result := ComCall(4, this, "ptr", pService, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @param {PWSTR} pszTag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-searchfailed
     */
    SearchFailed(hr, pszTag) {
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(5, this, "int", hr, "ptr", pszTag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszTag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoveryprovidernotify-searchcomplete
     */
    SearchComplete(pszTag) {
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(6, this, "ptr", pszTag, "HRESULT")
        return result
    }
}
