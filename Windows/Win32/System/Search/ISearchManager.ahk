#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISearchCatalogManager.ahk
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
     * @type {PWSTR} 
     */
    ProxyName {
        get => this.get_ProxyName()
    }

    /**
     * @type {PWSTR} 
     */
    BypassList {
        get => this.get_BypassList()
    }

    /**
     * @type {PWSTR} 
     */
    UserAgent {
        get => this.get_UserAgent()
        set => this.put_UserAgent(value)
    }

    /**
     * @type {Integer} 
     */
    UseProxy {
        get => this.get_UseProxy()
    }

    /**
     * @type {BOOL} 
     */
    LocalBypass {
        get => this.get_LocalBypass()
    }

    /**
     * @type {Integer} 
     */
    PortNumber {
        get => this.get_PortNumber()
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-getindexerversionstr
     */
    GetIndexerVersionStr() {
        result := ComCall(3, this, "ptr*", &ppszVersionString := 0, "HRESULT")
        return ppszVersionString
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
     * @returns {Pointer<PROPVARIANT>} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-getparameter
     */
    GetParameter(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, "ptr*", &ppValue := 0, "HRESULT")
        return ppValue
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
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-get_proxyname
     */
    get_ProxyName() {
        result := ComCall(7, this, "ptr*", &ppszProxyName := 0, "HRESULT")
        return ppszProxyName
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-get_bypasslist
     */
    get_BypassList() {
        result := ComCall(8, this, "ptr*", &ppszBypassList := 0, "HRESULT")
        return ppszBypassList
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
     * @returns {ISearchCatalogManager} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-getcatalog
     */
    GetCatalog(pszCatalog) {
        pszCatalog := pszCatalog is String ? StrPtr(pszCatalog) : pszCatalog

        result := ComCall(10, this, "ptr", pszCatalog, "ptr*", &ppCatalogManager := 0, "HRESULT")
        return ISearchCatalogManager(ppCatalogManager)
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-get_useragent
     */
    get_UserAgent() {
        result := ComCall(11, this, "ptr*", &ppszUserAgent := 0, "HRESULT")
        return ppszUserAgent
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-get_useproxy
     */
    get_UseProxy() {
        result := ComCall(13, this, "int*", &pUseProxy := 0, "HRESULT")
        return pUseProxy
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-get_localbypass
     */
    get_LocalBypass() {
        result := ComCall(14, this, "int*", &pfLocalBypass := 0, "HRESULT")
        return pfLocalBypass
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-get_portnumber
     */
    get_PortNumber() {
        result := ComCall(15, this, "uint*", &pdwPortNumber := 0, "HRESULT")
        return pdwPortNumber
    }
}
