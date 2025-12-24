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
     * Retrieves the version of the current indexer as a single string.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives the version of the current indexer.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchmanager-getindexerversionstr
     */
    GetIndexerVersionStr() {
        result := ComCall(3, this, "ptr*", &ppszVersionString := 0, "HRESULT")
        return ppszVersionString
    }

    /**
     * Retrieves the version of the current indexer in two chunks:\_the major version signifier and the minor version signifier.
     * @param {Pointer<Integer>} pdwMajor Type: <b>DWORD*</b>
     * 
     * Receives the major version signifier (the number to the left of the dot).
     * @param {Pointer<Integer>} pdwMinor Type: <b>DWORD*</b>
     * 
     * Receives the minor version signifier (the number to the right of the dot).
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchmanager-getindexerversion
     */
    GetIndexerVersion(pdwMajor, pdwMinor) {
        pdwMajorMarshal := pdwMajor is VarRef ? "uint*" : "ptr"
        pdwMinorMarshal := pdwMinor is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwMajorMarshal, pdwMajor, pdwMinorMarshal, pdwMinor, "HRESULT")
        return result
    }

    /**
     * Not supported.This method returns E_INVALIDARG when called.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * There are currently no valid parameters in this version of search (WDS 3.0).
     * @returns {Pointer<PROPVARIANT>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>**</b>
     * 
     * Returns a value in an undefined state as there are no properties currently defined to retrieve values from.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchmanager-getparameter
     */
    GetParameter(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, "ptr*", &ppValue := 0, "HRESULT")
        return ppValue
    }

    /**
     * Not supported.This method returns E_INVALIDARG when called.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * There are currently no valid parameters to pass or retrieve.
     * @param {Pointer<PROPVARIANT>} pValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * As there are no valid parameters currently configured, there are no valid parameters to pass to this method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method returns E_InvalidArg as an error code when called.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchmanager-setparameter
     */
    SetParameter(pszName, pValue) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(6, this, "ptr", pszName, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Retrieves the proxy name to be used by the protocol handler.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to a Unicode string that contains the proxy name.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchmanager-get_proxyname
     */
    get_ProxyName() {
        result := ComCall(7, this, "ptr*", &ppszProxyName := 0, "HRESULT")
        return ppszProxyName
    }

    /**
     * Gets a proxy bypass list from the indexer. This list is used to determine which items or URLs are local and do not need to go through the proxy server. This list is set by calling ISearchManager::SetProxy.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to the proxy bypass list that is stored in the indexer.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchmanager-get_bypasslist
     */
    get_BypassList() {
        result := ComCall(8, this, "ptr*", &ppszBypassList := 0, "HRESULT")
        return ppszBypassList
    }

    /**
     * Stores information in the indexer that determines how the indexer will work and communicate with a proxy server.
     * @param {Integer} sUseProxy Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-proxy_access">PROXY_ACCESS</a></b>
     * 
     * Sets whether and how to use a proxy, using one of the values enumerated in <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-proxy_access">PROXY_ACCESS</a>.
     * @param {BOOL} fLocalByPassProxy Type: <b>BOOL</b>
     * 
     * Sets whether the proxy server should be bypassed for local items and URLs.
     * @param {Integer} dwPortNumber Type: <b>DWORD</b>
     * 
     * Sets the port number that the index will use to talk to the proxy server.
     * @param {PWSTR} pszProxyName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated Unicode string containing the name of the proxy server to use.
     * @param {PWSTR} pszByPassList Type: <b>LPCWSTR</b>
     * 
     * A null-terminated Unicode string containing a comma-delimited list of items that are considered local by the indexer and are not to be accessed through a proxy server.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchmanager-setproxy
     */
    SetProxy(sUseProxy, fLocalByPassProxy, dwPortNumber, pszProxyName, pszByPassList) {
        pszProxyName := pszProxyName is String ? StrPtr(pszProxyName) : pszProxyName
        pszByPassList := pszByPassList is String ? StrPtr(pszByPassList) : pszByPassList

        result := ComCall(9, this, "int", sUseProxy, "int", fLocalByPassProxy, "uint", dwPortNumber, "ptr", pszProxyName, "ptr", pszByPassList, "HRESULT")
        return result
    }

    /**
     * Retrieves a catalog by name and creates a new ISearchCatalogManager object for that catalog.
     * @param {PWSTR} pszCatalog Type: <b>LPCWSTR</b>
     * 
     * The name of the catalog to be retrieved.
     * @returns {ISearchCatalogManager} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchcatalogmanager">ISearchCatalogManager</a>**</b>
     * 
     * Receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchcatalogmanager">ISearchCatalogManager</a> object that is named in <i>pszCatalog</i>.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchmanager-getcatalog
     */
    GetCatalog(pszCatalog) {
        pszCatalog := pszCatalog is String ? StrPtr(pszCatalog) : pszCatalog

        result := ComCall(10, this, "ptr", pszCatalog, "ptr*", &ppCatalogManager := 0, "HRESULT")
        return ISearchCatalogManager(ppCatalogManager)
    }

    /**
     * Retrieves the user agent string.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives the address of a pointer to the user agent string.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchmanager-get_useragent
     */
    get_UserAgent() {
        result := ComCall(11, this, "ptr*", &ppszUserAgent := 0, "HRESULT")
        return ppszUserAgent
    }

    /**
     * Sets the user agent string that a user agent passes to website and services to identify itself.
     * @param {PWSTR} pszUserAgent Type: <b>LPCWSTR</b>
     * 
     * The user agent string identifying the user agent.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchmanager-put_useragent
     */
    put_UserAgent(pszUserAgent) {
        pszUserAgent := pszUserAgent is String ? StrPtr(pszUserAgent) : pszUserAgent

        result := ComCall(12, this, "ptr", pszUserAgent, "HRESULT")
        return result
    }

    /**
     * Retrieves the proxy server to be used.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-proxy_access">PROXY_ACCESS</a>*</b>
     * 
     * Receives a pointer to the proxy server to be used.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchmanager-get_useproxy
     */
    get_UseProxy() {
        result := ComCall(13, this, "int*", &pUseProxy := 0, "HRESULT")
        return pUseProxy
    }

    /**
     * Retrieves a value that determines whether the proxy server should be bypassed to find the item or URL.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives a pointer to a <b>BOOL</b> value that indicates whether to bypass the proxy server to find an item or URL. <b>TRUE</b> to bypass the proxy (for local items); otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchmanager-get_localbypass
     */
    get_LocalBypass() {
        result := ComCall(14, this, "int*", &pfLocalBypass := 0, "HRESULT")
        return pfLocalBypass
    }

    /**
     * Retrieves the port number used to communicate with the proxy server. This port number is stored in the indexer and is set by the ISearchManager::SetProxy method.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the port number.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchmanager-get_portnumber
     */
    get_PortNumber() {
        result := ComCall(15, this, "uint*", &pdwPortNumber := 0, "HRESULT")
        return pdwPortNumber
    }
}
