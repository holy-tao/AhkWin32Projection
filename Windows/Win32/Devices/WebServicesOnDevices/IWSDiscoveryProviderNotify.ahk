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
     * 
     * @param {Pointer<IWSDiscoveredService>} pService 
     * @returns {HRESULT} 
     */
    Add(pService) {
        result := ComCall(3, this, "ptr", pService, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWSDiscoveredService>} pService 
     * @returns {HRESULT} 
     */
    Remove(pService) {
        result := ComCall(4, this, "ptr", pService, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @param {PWSTR} pszTag 
     * @returns {HRESULT} 
     */
    SearchFailed(hr, pszTag) {
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(5, this, "int", hr, "ptr", pszTag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszTag 
     * @returns {HRESULT} 
     */
    SearchComplete(pszTag) {
        pszTag := pszTag is String ? StrPtr(pszTag) : pszTag

        result := ComCall(6, this, "ptr", pszTag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
