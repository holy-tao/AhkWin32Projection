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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIndexerVersionStr", "GetIndexerVersion", "GetParameter", "SetParameter", "get_ProxyName", "get_BypassList", "SetProxy", "GetCatalog", "get_UserAgent", "put_UserAgent", "get_UseProxy", "get_LocalBypass", "get_PortNumber"]

    /**
     * 
     * @param {Pointer<PWSTR>} ppszVersionString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-getindexerversionstr
     */
    GetIndexerVersionStr(ppszVersionString) {
        result := ComCall(3, this, "ptr", ppszVersionString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMajor 
     * @param {Pointer<Integer>} pdwMinor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-getindexerversion
     */
    GetIndexerVersion(pdwMajor, pdwMinor) {
        pdwMajorMarshal := pdwMajor is VarRef ? "uint*" : "ptr"
        pdwMinorMarshal := pdwMinor is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwMajorMarshal, pdwMajor, pdwMinorMarshal, pdwMinor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<Pointer<PROPVARIANT>>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-getparameter
     */
    GetParameter(pszName, ppValue) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-setparameter
     */
    SetParameter(pszName, pValue) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(6, this, "ptr", pszName, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszProxyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-get_proxyname
     */
    get_ProxyName(ppszProxyName) {
        result := ComCall(7, this, "ptr", ppszProxyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszBypassList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-get_bypasslist
     */
    get_BypassList(ppszBypassList) {
        result := ComCall(8, this, "ptr", ppszBypassList, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-setproxy
     */
    SetProxy(sUseProxy, fLocalByPassProxy, dwPortNumber, pszProxyName, pszByPassList) {
        pszProxyName := pszProxyName is String ? StrPtr(pszProxyName) : pszProxyName
        pszByPassList := pszByPassList is String ? StrPtr(pszByPassList) : pszByPassList

        result := ComCall(9, this, "int", sUseProxy, "int", fLocalByPassProxy, "uint", dwPortNumber, "ptr", pszProxyName, "ptr", pszByPassList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszCatalog 
     * @param {Pointer<ISearchCatalogManager>} ppCatalogManager 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-getcatalog
     */
    GetCatalog(pszCatalog, ppCatalogManager) {
        pszCatalog := pszCatalog is String ? StrPtr(pszCatalog) : pszCatalog

        result := ComCall(10, this, "ptr", pszCatalog, "ptr*", ppCatalogManager, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszUserAgent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-get_useragent
     */
    get_UserAgent(ppszUserAgent) {
        result := ComCall(11, this, "ptr", ppszUserAgent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszUserAgent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-put_useragent
     */
    put_UserAgent(pszUserAgent) {
        pszUserAgent := pszUserAgent is String ? StrPtr(pszUserAgent) : pszUserAgent

        result := ComCall(12, this, "ptr", pszUserAgent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pUseProxy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-get_useproxy
     */
    get_UseProxy(pUseProxy) {
        pUseProxyMarshal := pUseProxy is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pUseProxyMarshal, pUseProxy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfLocalBypass 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-get_localbypass
     */
    get_LocalBypass(pfLocalBypass) {
        result := ComCall(14, this, "ptr", pfLocalBypass, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwPortNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-get_portnumber
     */
    get_PortNumber(pdwPortNumber) {
        pdwPortNumberMarshal := pdwPortNumber is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, pdwPortNumberMarshal, pdwPortNumber, "HRESULT")
        return result
    }
}
