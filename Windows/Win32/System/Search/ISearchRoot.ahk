#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\AUTH_TYPE.ahk" { AUTH_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods for manipulating a search root. Changes to property members are applied to any URL that falls under the search root. A URL falls under a search root if it matches the search root URL or is a hierarchical child of that URL.
 * @remarks
 * For a sample that demonstrates how to define command line options for Crawl Scope Manager (CSM) indexing operations, see the [CrawlScopeCommandLine](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/CrawlScopeCommandLine) sample.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-isearchroot
 * @namespace Windows.Win32.System.Search
 */
export default struct ISearchRoot extends IUnknown {
    /**
     * The interface identifier for ISearchRoot
     * @type {Guid}
     */
    static IID := Guid("{04c18ccf-1f57-4cbd-88cc-3900f5195ce3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchRoot interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        put_Schedule              : IntPtr
        get_Schedule              : IntPtr
        put_RootURL               : IntPtr
        get_RootURL               : IntPtr
        put_IsHierarchical        : IntPtr
        get_IsHierarchical        : IntPtr
        put_ProvidesNotifications : IntPtr
        get_ProvidesNotifications : IntPtr
        put_UseNotificationsOnly  : IntPtr
        get_UseNotificationsOnly  : IntPtr
        put_EnumerationDepth      : IntPtr
        get_EnumerationDepth      : IntPtr
        put_HostDepth             : IntPtr
        get_HostDepth             : IntPtr
        put_FollowDirectories     : IntPtr
        get_FollowDirectories     : IntPtr
        put_AuthenticationType    : IntPtr
        get_AuthenticationType    : IntPtr
        put_User                  : IntPtr
        get_User                  : IntPtr
        put_Password              : IntPtr
        get_Password              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchRoot.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {PWSTR} 
     */
    Schedule {
        get => this.get_Schedule()
        set => this.put_Schedule(value)
    }

    /**
     * @type {PWSTR} 
     */
    RootURL {
        get => this.get_RootURL()
        set => this.put_RootURL(value)
    }

    /**
     * @type {BOOL} 
     */
    IsHierarchical {
        get => this.get_IsHierarchical()
        set => this.put_IsHierarchical(value)
    }

    /**
     * @type {BOOL} 
     */
    ProvidesNotifications {
        get => this.get_ProvidesNotifications()
        set => this.put_ProvidesNotifications(value)
    }

    /**
     * @type {BOOL} 
     */
    UseNotificationsOnly {
        get => this.get_UseNotificationsOnly()
        set => this.put_UseNotificationsOnly(value)
    }

    /**
     * @type {Integer} 
     */
    EnumerationDepth {
        get => this.get_EnumerationDepth()
        set => this.put_EnumerationDepth(value)
    }

    /**
     * @type {Integer} 
     */
    HostDepth {
        get => this.get_HostDepth()
        set => this.put_HostDepth(value)
    }

    /**
     * @type {BOOL} 
     */
    FollowDirectories {
        get => this.get_FollowDirectories()
        set => this.put_FollowDirectories(value)
    }

    /**
     * @type {AUTH_TYPE} 
     */
    AuthenticationType {
        get => this.get_AuthenticationType()
        set => this.put_AuthenticationType(value)
    }

    /**
     * @type {PWSTR} 
     */
    User {
        get => this.get_User()
        set => this.put_User(value)
    }

    /**
     * @type {PWSTR} 
     */
    Password {
        get => this.get_Password()
        set => this.put_Password(value)
    }

    /**
     * Not implemented. (ISearchRoot.put_Schedule)
     * @param {PWSTR} pszTaskArg Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated, Unicode buffer that contains the name of the task to be inserted.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_schedule
     */
    put_Schedule(pszTaskArg) {
        pszTaskArg := pszTaskArg is String ? StrPtr(pszTaskArg) : pszTaskArg

        result := ComCall(3, this, "ptr", pszTaskArg, "HRESULT")
        return result
    }

    /**
     * Not implemented. (ISearchRoot.get_Schedule)
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line 
     * options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Returns the address of a pointer to a null-terminated, Unicode buffer that contains the name of the task.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_schedule
     */
    get_Schedule() {
        result := ComCall(4, this, PWSTR.Ptr, &ppszTaskArg := 0, "HRESULT")
        return ppszTaskArg
    }

    /**
     * Sets the URL of the current search root.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line 
     * options for Crawl Scope Manager (CSM) indexing operations.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated, Unicode buffer that contains the URL of this search root.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_rooturl
     */
    put_RootURL(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(5, this, "ptr", pszURL, "HRESULT")
        return result
    }

    /**
     * Gets the URL of the starting point for this search root.
     * @remarks
     * Use <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to free the memory from the returned string.
     * 
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line 
     * options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * A null-terminated, Unicode buffer that contains the URL.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_rooturl
     */
    get_RootURL() {
        result := ComCall(6, this, PWSTR.Ptr, &ppszURL := 0, "HRESULT")
        return ppszURL
    }

    /**
     * Sets a value that indicates whether the search is rooted on a hierarchical tree structure.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line 
     * options for Crawl Scope Manager (CSM) indexing operations.
     * @param {BOOL} fIsHierarchical Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> for hierarchical tree structures, <b>FALSE</b> for non-hierarchical systems such as websites.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_ishierarchical
     */
    put_IsHierarchical(fIsHierarchical) {
        result := ComCall(7, this, BOOL, fIsHierarchical, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether the search is rooted on a hierarchical tree structure.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line 
     * options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * On return, points to <b>TRUE</b> for hierarchical tree structures, and <b>FALSE</b> for other structures such as websites.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_ishierarchical
     */
    get_IsHierarchical() {
        result := ComCall(8, this, BOOL.Ptr, &pfIsHierarchical := 0, "HRESULT")
        return pfIsHierarchical
    }

    /**
     * Sets a value that indicates whether the search engine is notified (by protocol handlers or other applications) about changes to the URLs under the search root.
     * @remarks
     * That value that <b>ISearchRoot::put_ProvidesNotifications</b> sets is not protocol specific.
     * 
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line 
     * options for Crawl Scope Manager (CSM) indexing operations.
     * @param {BOOL} fProvidesNotifications Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if notifications are provided; otherwise, <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_providesnotifications
     */
    put_ProvidesNotifications(fProvidesNotifications) {
        result := ComCall(9, this, BOOL, fProvidesNotifications, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether the search engine is notified (by protocol handlers or other applications) about changes to the URLs under the search root.
     * @remarks
     * The value <b>ISearchRoot::get_ProvidesNotifications</b> returns is not protocol specific.
     * 
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line 
     * options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * On return, points to <b>TRUE</b> if this search root provides notifications; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_providesnotifications
     */
    get_ProvidesNotifications() {
        result := ComCall(10, this, BOOL.Ptr, &pfProvidesNotifications := 0, "HRESULT")
        return pfProvidesNotifications
    }

    /**
     * Sets a value that indicates whether this search root should be indexed only by notification and not crawled.
     * @remarks
     * For search root URLs in a custom data store or on a remote system, it can be useful to limit the search engine to indexing the URLs only if the store or system has sent notifications that something has changed. This might help to reduce traffic in the store or across the network by avoiding the incremental crawls when the store is unchanged.
     * 
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @param {BOOL} fUseNotificationsOnly Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if this search root should be indexed only by notification; otherwise, <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_usenotificationsonly
     */
    put_UseNotificationsOnly(fUseNotificationsOnly) {
        result := ComCall(11, this, BOOL, fUseNotificationsOnly, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether this search root should be indexed only by notification and not crawled.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line 
     * options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * On return, points to <b>TRUE</b> if this search root should be indexed only by notification; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_usenotificationsonly
     */
    get_UseNotificationsOnly() {
        result := ComCall(12, this, BOOL.Ptr, &pfUseNotificationsOnly := 0, "HRESULT")
        return pfUseNotificationsOnly
    }

    /**
     * Sets the enumeration depth for this search root.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line 
     * options for Crawl Scope Manager (CSM) indexing operations.
     * @param {Integer} dwDepth Type: <b>DWORD</b>
     * 
     * The depth (number of levels) to enumerate.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_enumerationdepth
     */
    put_EnumerationDepth(dwDepth) {
        result := ComCall(13, this, "uint", dwDepth, "HRESULT")
        return result
    }

    /**
     * Gets the enumeration depth for this search root.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line 
     * options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to the depth (number of levels) to enumerate.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_enumerationdepth
     */
    get_EnumerationDepth() {
        result := ComCall(14, this, "uint*", &pdwDepth := 0, "HRESULT")
        return pdwDepth
    }

    /**
     * Sets a value that indicates how far into a host tree to crawl when indexing.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line 
     * options for Crawl Scope Manager (CSM) indexing operations.
     * @param {Integer} dwDepth Type: <b>DWORD</b>
     * 
     * The depth (number of levels) to crawl a host tree.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_hostdepth
     */
    put_HostDepth(dwDepth) {
        result := ComCall(15, this, "uint", dwDepth, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates how far into a host tree to crawl when indexing.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line 
     * options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * On return, points to the depth (number of levels) to crawl in the host tree.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_hostdepth
     */
    get_HostDepth() {
        result := ComCall(16, this, "uint*", &pdwDepth := 0, "HRESULT")
        return pdwDepth
    }

    /**
     * Sets a BOOL value that indicates whether the search engine should follow subdirectories and hierarchical scopes for this search root.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line 
     * options for Crawl Scope Manager (CSM) indexing operations.
     * @param {BOOL} fFollowDirectories Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to follow directories or hierarchical scopes, otherwise <b>FALSE</b>. The default for this value is <b>TRUE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_followdirectories
     */
    put_FollowDirectories(fFollowDirectories) {
        result := ComCall(17, this, BOOL, fFollowDirectories, "HRESULT")
        return result
    }

    /**
     * Gets a BOOL value that indicates whether the search engine follows subdirectories and hierarchical scopes.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line 
     * options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * On return, points to <b>TRUE</b> if the search engine follows subdirectories and hierarchical scopes; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_followdirectories
     */
    get_FollowDirectories() {
        result := ComCall(18, this, BOOL.Ptr, &pfFollowDirectories := 0, "HRESULT")
        return pfFollowDirectories
    }

    /**
     * Sets the type of authentication required to access the URLs under this search root.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line 
     * options for Crawl Scope Manager (CSM) indexing operations.
     * @param {AUTH_TYPE} authType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-auth_type">AUTH_TYPE</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-auth_type">AUTH_TYPE</a> enumeration that indicates the authentication type.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_authenticationtype
     */
    put_AuthenticationType(authType) {
        result := ComCall(19, this, AUTH_TYPE, authType, "HRESULT")
        return result
    }

    /**
     * Retrieves the type of authentication needed to access the URLs under this this search root.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line 
     * options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {AUTH_TYPE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-auth_type">AUTH_TYPE</a>*</b>
     * 
     * A pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-auth_type">AUTH_TYPE</a> enumeration that indicates the authentication type required to access URLs under this search root.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_authenticationtype
     */
    get_AuthenticationType() {
        result := ComCall(20, this, "int*", &pAuthType := 0, "HRESULT")
        return pAuthType
    }

    /**
     * Not implemented. (ISearchRoot.put_User)
     * @param {PWSTR} pszUser This parameter is unused.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_user
     */
    put_User(pszUser) {
        pszUser := pszUser is String ? StrPtr(pszUser) : pszUser

        result := ComCall(21, this, "ptr", pszUser, "HRESULT")
        return result
    }

    /**
     * Not implemented. (ISearchRoot.get_User)
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line 
     * options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {PWSTR} This parameter is unused.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_user
     */
    get_User() {
        result := ComCall(22, this, PWSTR.Ptr, &ppszUser := 0, "HRESULT")
        return ppszUser
    }

    /**
     * Not implemented. (ISearchRoot.put_Password)
     * @param {PWSTR} pszPassword This parameter is unused.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_password
     */
    put_Password(pszPassword) {
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        result := ComCall(23, this, "ptr", pszPassword, "HRESULT")
        return result
    }

    /**
     * Not implemented. (ISearchRoot.get_Password)
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line 
     * options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {PWSTR} This parameter is unused.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_password
     */
    get_Password() {
        result := ComCall(24, this, PWSTR.Ptr, &ppszPassword := 0, "HRESULT")
        return ppszPassword
    }

    Query(iid) {
        if (ISearchRoot.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_Schedule := CallbackCreate(GetMethod(implObj, "put_Schedule"), flags, 2)
        this.vtbl.get_Schedule := CallbackCreate(GetMethod(implObj, "get_Schedule"), flags, 2)
        this.vtbl.put_RootURL := CallbackCreate(GetMethod(implObj, "put_RootURL"), flags, 2)
        this.vtbl.get_RootURL := CallbackCreate(GetMethod(implObj, "get_RootURL"), flags, 2)
        this.vtbl.put_IsHierarchical := CallbackCreate(GetMethod(implObj, "put_IsHierarchical"), flags, 2)
        this.vtbl.get_IsHierarchical := CallbackCreate(GetMethod(implObj, "get_IsHierarchical"), flags, 2)
        this.vtbl.put_ProvidesNotifications := CallbackCreate(GetMethod(implObj, "put_ProvidesNotifications"), flags, 2)
        this.vtbl.get_ProvidesNotifications := CallbackCreate(GetMethod(implObj, "get_ProvidesNotifications"), flags, 2)
        this.vtbl.put_UseNotificationsOnly := CallbackCreate(GetMethod(implObj, "put_UseNotificationsOnly"), flags, 2)
        this.vtbl.get_UseNotificationsOnly := CallbackCreate(GetMethod(implObj, "get_UseNotificationsOnly"), flags, 2)
        this.vtbl.put_EnumerationDepth := CallbackCreate(GetMethod(implObj, "put_EnumerationDepth"), flags, 2)
        this.vtbl.get_EnumerationDepth := CallbackCreate(GetMethod(implObj, "get_EnumerationDepth"), flags, 2)
        this.vtbl.put_HostDepth := CallbackCreate(GetMethod(implObj, "put_HostDepth"), flags, 2)
        this.vtbl.get_HostDepth := CallbackCreate(GetMethod(implObj, "get_HostDepth"), flags, 2)
        this.vtbl.put_FollowDirectories := CallbackCreate(GetMethod(implObj, "put_FollowDirectories"), flags, 2)
        this.vtbl.get_FollowDirectories := CallbackCreate(GetMethod(implObj, "get_FollowDirectories"), flags, 2)
        this.vtbl.put_AuthenticationType := CallbackCreate(GetMethod(implObj, "put_AuthenticationType"), flags, 2)
        this.vtbl.get_AuthenticationType := CallbackCreate(GetMethod(implObj, "get_AuthenticationType"), flags, 2)
        this.vtbl.put_User := CallbackCreate(GetMethod(implObj, "put_User"), flags, 2)
        this.vtbl.get_User := CallbackCreate(GetMethod(implObj, "get_User"), flags, 2)
        this.vtbl.put_Password := CallbackCreate(GetMethod(implObj, "put_Password"), flags, 2)
        this.vtbl.get_Password := CallbackCreate(GetMethod(implObj, "get_Password"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_Schedule)
        CallbackFree(this.vtbl.get_Schedule)
        CallbackFree(this.vtbl.put_RootURL)
        CallbackFree(this.vtbl.get_RootURL)
        CallbackFree(this.vtbl.put_IsHierarchical)
        CallbackFree(this.vtbl.get_IsHierarchical)
        CallbackFree(this.vtbl.put_ProvidesNotifications)
        CallbackFree(this.vtbl.get_ProvidesNotifications)
        CallbackFree(this.vtbl.put_UseNotificationsOnly)
        CallbackFree(this.vtbl.get_UseNotificationsOnly)
        CallbackFree(this.vtbl.put_EnumerationDepth)
        CallbackFree(this.vtbl.get_EnumerationDepth)
        CallbackFree(this.vtbl.put_HostDepth)
        CallbackFree(this.vtbl.get_HostDepth)
        CallbackFree(this.vtbl.put_FollowDirectories)
        CallbackFree(this.vtbl.get_FollowDirectories)
        CallbackFree(this.vtbl.put_AuthenticationType)
        CallbackFree(this.vtbl.get_AuthenticationType)
        CallbackFree(this.vtbl.put_User)
        CallbackFree(this.vtbl.get_User)
        CallbackFree(this.vtbl.put_Password)
        CallbackFree(this.vtbl.get_Password)
    }
}
