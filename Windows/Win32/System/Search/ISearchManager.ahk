#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for controlling the Search service. This interface manages settings and objects that affect the search engine across catalogs.
 * @remarks
 * 
  * For a sample that demonstrates ways to specify which files to re-index and how, see the [ReindexMatchingUrls](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/ReindexMatchingUrls) sample.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchmanager
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchManager extends IUnknown{
    /**
     * The interface identifier for ISearchManager
     * @type {Guid}
     */
    static IID => Guid("{ab310581-ac80-11d1-8df3-00c04fb6ef69}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} ppszVersionString 
     * @returns {HRESULT} 
     */
    GetIndexerVersionStr(ppszVersionString) {
        result := ComCall(3, this, "ptr", ppszVersionString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMajor 
     * @param {Pointer<UInt32>} pdwMinor 
     * @returns {HRESULT} 
     */
    GetIndexerVersion(pdwMajor, pdwMinor) {
        result := ComCall(4, this, "uint*", pdwMajor, "uint*", pdwMinor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<PROPVARIANT>} ppValue 
     * @returns {HRESULT} 
     */
    GetParameter(pszName, ppValue) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     */
    SetParameter(pszName, pValue) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(6, this, "ptr", pszName, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszProxyName 
     * @returns {HRESULT} 
     */
    get_ProxyName(ppszProxyName) {
        result := ComCall(7, this, "ptr", ppszProxyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszBypassList 
     * @returns {HRESULT} 
     */
    get_BypassList(ppszBypassList) {
        result := ComCall(8, this, "ptr", ppszBypassList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} sUseProxy 
     * @param {BOOL} fLocalByPassProxy 
     * @param {Integer} dwPortNumber 
     * @param {PWSTR} pszProxyName 
     * @param {PWSTR} pszByPassList 
     * @returns {HRESULT} 
     */
    SetProxy(sUseProxy, fLocalByPassProxy, dwPortNumber, pszProxyName, pszByPassList) {
        pszProxyName := pszProxyName is String ? StrPtr(pszProxyName) : pszProxyName
        pszByPassList := pszByPassList is String ? StrPtr(pszByPassList) : pszByPassList

        result := ComCall(9, this, "int", sUseProxy, "int", fLocalByPassProxy, "uint", dwPortNumber, "ptr", pszProxyName, "ptr", pszByPassList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszCatalog 
     * @param {Pointer<ISearchCatalogManager>} ppCatalogManager 
     * @returns {HRESULT} 
     */
    GetCatalog(pszCatalog, ppCatalogManager) {
        pszCatalog := pszCatalog is String ? StrPtr(pszCatalog) : pszCatalog

        result := ComCall(10, this, "ptr", pszCatalog, "ptr", ppCatalogManager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszUserAgent 
     * @returns {HRESULT} 
     */
    get_UserAgent(ppszUserAgent) {
        result := ComCall(11, this, "ptr", ppszUserAgent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszUserAgent 
     * @returns {HRESULT} 
     */
    put_UserAgent(pszUserAgent) {
        pszUserAgent := pszUserAgent is String ? StrPtr(pszUserAgent) : pszUserAgent

        result := ComCall(12, this, "ptr", pszUserAgent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pUseProxy 
     * @returns {HRESULT} 
     */
    get_UseProxy(pUseProxy) {
        result := ComCall(13, this, "int*", pUseProxy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfLocalBypass 
     * @returns {HRESULT} 
     */
    get_LocalBypass(pfLocalBypass) {
        result := ComCall(14, this, "ptr", pfLocalBypass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwPortNumber 
     * @returns {HRESULT} 
     */
    get_PortNumber(pdwPortNumber) {
        result := ComCall(15, this, "uint*", pdwPortNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
