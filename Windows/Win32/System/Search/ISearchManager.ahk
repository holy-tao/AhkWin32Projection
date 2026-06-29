#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISearchCatalogManager.ahk" { ISearchCatalogManager }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\PROXY_ACCESS.ahk" { PROXY_ACCESS }

/**
 * Provides methods for controlling the Search service. This interface manages settings and objects that affect the search engine across catalogs.
 * @remarks
 * For a sample that demonstrates ways to specify which files to re-index and how, see the [ReindexMatchingUrls](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/ReindexMatchingUrls) sample.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-isearchmanager
 * @namespace Windows.Win32.System.Search
 */
export default struct ISearchManager extends IUnknown {
    /**
     * The interface identifier for ISearchManager
     * @type {Guid}
     */
    static IID := Guid("{ab310581-ac80-11d1-8df3-00c04fb6ef69}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIndexerVersionStr : IntPtr
        GetIndexerVersion    : IntPtr
        GetParameter         : IntPtr
        SetParameter         : IntPtr
        get_ProxyName        : IntPtr
        get_BypassList       : IntPtr
        SetProxy             : IntPtr
        GetCatalog           : IntPtr
        get_UserAgent        : IntPtr
        put_UserAgent        : IntPtr
        get_UseProxy         : IntPtr
        get_LocalBypass      : IntPtr
        get_PortNumber       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {PROXY_ACCESS} 
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
     * @remarks
     * Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-reindexmatchingurls">ReindexMatchingUrls code sample</a> to see ways to specify which files to re-index and how set it up.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives the version of the current indexer.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-getindexerversionstr
     */
    GetIndexerVersionStr() {
        result := ComCall(3, this, PWSTR.Ptr, &ppszVersionString := 0, "HRESULT")
        return ppszVersionString
    }

    /**
     * Retrieves the version of the current indexer in two chunks:\_the major version signifier and the minor version signifier.
     * @remarks
     * Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-reindexmatchingurls">ReindexMatchingUrls code sample</a> to see ways to specify which files to re-index and how set it up.
     * @param {Pointer<Integer>} pdwMajor Type: <b>DWORD*</b>
     * 
     * Receives the major version signifier (the number to the left of the dot).
     * @param {Pointer<Integer>} pdwMinor Type: <b>DWORD*</b>
     * 
     * Receives the minor version signifier (the number to the right of the dot).
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-getindexerversion
     */
    GetIndexerVersion(pdwMajor, pdwMinor) {
        pdwMajorMarshal := pdwMajor is VarRef ? "uint*" : "ptr"
        pdwMinorMarshal := pdwMinor is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwMajorMarshal, pdwMajor, pdwMinorMarshal, pdwMinor, "HRESULT")
        return result
    }

    /**
     * Not supported.This method returns E_INVALIDARG when called. (ISearchManager.GetParameter)
     * @remarks
     * Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-reindexmatchingurls">ReindexMatchingUrls code sample</a> to see ways to specify which files to re-index and how set it up.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * There are currently no valid parameters in this version of search (WDS 3.0).
     * @returns {Pointer<PROPVARIANT>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>**</b>
     * 
     * Returns a value in an undefined state as there are no properties currently defined to retrieve values from.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-getparameter
     */
    GetParameter(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, "ptr*", &ppValue := 0, "HRESULT")
        return ppValue
    }

    /**
     * Not supported.This method returns E_INVALIDARG when called. (ISearchManager.SetParameter)
     * @remarks
     * Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-reindexmatchingurls">ReindexMatchingUrls code sample</a> to see ways to specify which files to re-index and how set it up.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * There are currently no valid parameters to pass or retrieve.
     * @param {Pointer<PROPVARIANT>} pValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * As there are no valid parameters currently configured, there are no valid parameters to pass to this method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method returns E_InvalidArg as an error code when called.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-setparameter
     */
    SetParameter(pszName, pValue) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(6, this, "ptr", pszName, PROPVARIANT.Ptr, pValue, "HRESULT")
        return result
    }

    /**
     * Retrieves the proxy name to be used by the protocol handler.
     * @remarks
     * Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-reindexmatchingurls">ReindexMatchingUrls code sample</a> to see ways to specify which files to re-index and how set it up.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to a Unicode string that contains the proxy name.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-get_proxyname
     */
    get_ProxyName() {
        result := ComCall(7, this, PWSTR.Ptr, &ppszProxyName := 0, "HRESULT")
        return ppszProxyName
    }

    /**
     * Gets a proxy bypass list from the indexer. This list is used to determine which items or URLs are local and do not need to go through the proxy server. This list is set by calling ISearchManager::SetProxy.
     * @remarks
     * Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-reindexmatchingurls">ReindexMatchingUrls code sample</a> to see ways to specify which files to re-index and how set it up.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to the proxy bypass list that is stored in the indexer.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-get_bypasslist
     */
    get_BypassList() {
        result := ComCall(8, this, PWSTR.Ptr, &ppszBypassList := 0, "HRESULT")
        return ppszBypassList
    }

    /**
     * Stores information in the indexer that determines how the indexer will work and communicate with a proxy server.
     * @remarks
     * Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-reindexmatchingurls">ReindexMatchingUrls code sample</a> to see ways to specify which files to re-index and how set it up.
     * @param {PROXY_ACCESS} sUseProxy Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-proxy_access">PROXY_ACCESS</a></b>
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-setproxy
     */
    SetProxy(sUseProxy, fLocalByPassProxy, dwPortNumber, pszProxyName, pszByPassList) {
        pszProxyName := pszProxyName is String ? StrPtr(pszProxyName) : pszProxyName
        pszByPassList := pszByPassList is String ? StrPtr(pszByPassList) : pszByPassList

        result := ComCall(9, this, PROXY_ACCESS, sUseProxy, BOOL, fLocalByPassProxy, "uint", dwPortNumber, "ptr", pszProxyName, "ptr", pszByPassList, "HRESULT")
        return result
    }

    /**
     * Retrieves a catalog by name and creates a new ISearchCatalogManager object for that catalog.
     * @remarks
     * Currently Microsoft Windows Desktop Search (WDS) 3.0 supports only one catalog and it is named SystemIndex.
     * 
     * Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-reindexmatchingurls">ReindexMatchingUrls code sample</a> to see ways to specify which files to re-index and how set it up.
     * @param {PWSTR} pszCatalog Type: <b>LPCWSTR</b>
     * 
     * The name of the catalog to be retrieved.
     * @returns {ISearchCatalogManager} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchcatalogmanager">ISearchCatalogManager</a>**</b>
     * 
     * Receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchcatalogmanager">ISearchCatalogManager</a> object that is named in <i>pszCatalog</i>.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-getcatalog
     */
    GetCatalog(pszCatalog) {
        pszCatalog := pszCatalog is String ? StrPtr(pszCatalog) : pszCatalog

        result := ComCall(10, this, "ptr", pszCatalog, "ptr*", &ppCatalogManager := 0, "HRESULT")
        return ISearchCatalogManager(ppCatalogManager)
    }

    /**
     * Retrieves the user agent string.
     * @remarks
     * Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-reindexmatchingurls">ReindexMatchingUrls code sample</a> to see ways to specify which files to re-index and how set it up.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives the address of a pointer to the user agent string.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-get_useragent
     */
    get_UserAgent() {
        result := ComCall(11, this, PWSTR.Ptr, &ppszUserAgent := 0, "HRESULT")
        return ppszUserAgent
    }

    /**
     * Sets the user agent string that a user agent passes to website and services to identify itself.
     * @remarks
     * A user agent is a client application that accesses the Internet. User agents include web browsers, search engine crawlers, download managers, and so on, and may be associated with a specific protocol such as File Transfer Protocol (FTP) or Hyper Text Transfer Protocol (HTTP).
     * 
     * Each user agent typically has a user agent string, such as "Mozilla/4.0", that it can pass to websites and services to identify itself.
     * 
     * Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-reindexmatchingurls">ReindexMatchingUrls code sample</a> to see ways to specify which files to re-index and how set it up.
     * @param {PWSTR} pszUserAgent Type: <b>LPCWSTR</b>
     * 
     * The user agent string identifying the user agent.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-put_useragent
     */
    put_UserAgent(pszUserAgent) {
        pszUserAgent := pszUserAgent is String ? StrPtr(pszUserAgent) : pszUserAgent

        result := ComCall(12, this, "ptr", pszUserAgent, "HRESULT")
        return result
    }

    /**
     * Retrieves the proxy server to be used.
     * @remarks
     * Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-reindexmatchingurls">ReindexMatchingUrls code sample</a> to see ways to specify which files to re-index and how set it up.
     * @returns {PROXY_ACCESS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-proxy_access">PROXY_ACCESS</a>*</b>
     * 
     * Receives a pointer to the proxy server to be used.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-get_useproxy
     */
    get_UseProxy() {
        result := ComCall(13, this, "int*", &pUseProxy := 0, "HRESULT")
        return pUseProxy
    }

    /**
     * Retrieves a value that determines whether the proxy server should be bypassed to find the item or URL.
     * @remarks
     * Proxy servers are used as a gateway between the local area network (LAN) and the Internet, primarily for security. A proxy server accepts requests for information (on other networks or the Internet) from internal systems such as servers or work stations. The proxy server then forwards the request to the Internet resource, which keeps the address of the requesting system anonymous. When the information returns from the Internet resource, the proxy server routes the information back to the requesting system. For content on the LAN, it is not necessary to go through the proxy server to access your content; this potentially saves time and extra steps.
     * 
     * The value retrieved by this method helps the indexer identify how to work with content that is on a local domain or network. For nonlocal content, going through the proxy server may be appropriate, if not necessary.
     * 
     * The setting to bypass the proxy for local domains is stored in the indexer and is set by calling the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchmanager-setproxy">ISearchManager::SetProxy</a> method.
     * 
     * Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-reindexmatchingurls">ReindexMatchingUrls code sample</a> to see ways to specify which files to re-index and how set it up.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives a pointer to a <b>BOOL</b> value that indicates whether to bypass the proxy server to find an item or URL. <b>TRUE</b> to bypass the proxy (for local items); otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-get_localbypass
     */
    get_LocalBypass() {
        result := ComCall(14, this, BOOL.Ptr, &pfLocalBypass := 0, "HRESULT")
        return pfLocalBypass
    }

    /**
     * Retrieves the port number used to communicate with the proxy server. This port number is stored in the indexer and is set by the ISearchManager::SetProxy method.
     * @remarks
     * Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-reindexmatchingurls">ReindexMatchingUrls code sample</a> to see ways to specify which files to re-index and how set it up.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the port number.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchmanager-get_portnumber
     */
    get_PortNumber() {
        result := ComCall(15, this, "uint*", &pdwPortNumber := 0, "HRESULT")
        return pdwPortNumber
    }

    Query(iid) {
        if (ISearchManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIndexerVersionStr := CallbackCreate(GetMethod(implObj, "GetIndexerVersionStr"), flags, 2)
        this.vtbl.GetIndexerVersion := CallbackCreate(GetMethod(implObj, "GetIndexerVersion"), flags, 3)
        this.vtbl.GetParameter := CallbackCreate(GetMethod(implObj, "GetParameter"), flags, 3)
        this.vtbl.SetParameter := CallbackCreate(GetMethod(implObj, "SetParameter"), flags, 3)
        this.vtbl.get_ProxyName := CallbackCreate(GetMethod(implObj, "get_ProxyName"), flags, 2)
        this.vtbl.get_BypassList := CallbackCreate(GetMethod(implObj, "get_BypassList"), flags, 2)
        this.vtbl.SetProxy := CallbackCreate(GetMethod(implObj, "SetProxy"), flags, 6)
        this.vtbl.GetCatalog := CallbackCreate(GetMethod(implObj, "GetCatalog"), flags, 3)
        this.vtbl.get_UserAgent := CallbackCreate(GetMethod(implObj, "get_UserAgent"), flags, 2)
        this.vtbl.put_UserAgent := CallbackCreate(GetMethod(implObj, "put_UserAgent"), flags, 2)
        this.vtbl.get_UseProxy := CallbackCreate(GetMethod(implObj, "get_UseProxy"), flags, 2)
        this.vtbl.get_LocalBypass := CallbackCreate(GetMethod(implObj, "get_LocalBypass"), flags, 2)
        this.vtbl.get_PortNumber := CallbackCreate(GetMethod(implObj, "get_PortNumber"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIndexerVersionStr)
        CallbackFree(this.vtbl.GetIndexerVersion)
        CallbackFree(this.vtbl.GetParameter)
        CallbackFree(this.vtbl.SetParameter)
        CallbackFree(this.vtbl.get_ProxyName)
        CallbackFree(this.vtbl.get_BypassList)
        CallbackFree(this.vtbl.SetProxy)
        CallbackFree(this.vtbl.GetCatalog)
        CallbackFree(this.vtbl.get_UserAgent)
        CallbackFree(this.vtbl.put_UserAgent)
        CallbackFree(this.vtbl.get_UseProxy)
        CallbackFree(this.vtbl.get_LocalBypass)
        CallbackFree(this.vtbl.get_PortNumber)
    }
}
