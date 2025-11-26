#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for manipulating a search root. Changes to property members are applied to any URL that falls under the search root. A URL falls under a search root if it matches the search root URL or is a hierarchical child of that URL.
 * @remarks
 * 
 * For a sample that demonstrates how to define command line options for Crawl Scope Manager (CSM) indexing operations, see the [CrawlScopeCommandLine](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/CrawlScopeCommandLine) sample.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchroot
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchRoot extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchRoot
     * @type {Guid}
     */
    static IID => Guid("{04c18ccf-1f57-4cbd-88cc-3900f5195ce3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Schedule", "get_Schedule", "put_RootURL", "get_RootURL", "put_IsHierarchical", "get_IsHierarchical", "put_ProvidesNotifications", "get_ProvidesNotifications", "put_UseNotificationsOnly", "get_UseNotificationsOnly", "put_EnumerationDepth", "get_EnumerationDepth", "put_HostDepth", "get_HostDepth", "put_FollowDirectories", "get_FollowDirectories", "put_AuthenticationType", "get_AuthenticationType", "put_User", "get_User", "put_Password", "get_Password"]

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
     * @type {Integer} 
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
     * Not implemented.
     * @param {PWSTR} pszTaskArg Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated, Unicode buffer that contains the name of the task to be inserted.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-put_schedule
     */
    put_Schedule(pszTaskArg) {
        pszTaskArg := pszTaskArg is String ? StrPtr(pszTaskArg) : pszTaskArg

        result := ComCall(3, this, "ptr", pszTaskArg, "HRESULT")
        return result
    }

    /**
     * Not implemented.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Returns the address of a pointer to a null-terminated, Unicode buffer that contains the name of the task.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-get_schedule
     */
    get_Schedule() {
        result := ComCall(4, this, "ptr*", &ppszTaskArg := 0, "HRESULT")
        return ppszTaskArg
    }

    /**
     * Sets the URL of the current search root.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated, Unicode buffer that contains the URL of this search root.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-put_rooturl
     */
    put_RootURL(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(5, this, "ptr", pszURL, "HRESULT")
        return result
    }

    /**
     * Gets the URL of the starting point for this search root.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * A null-terminated, Unicode buffer that contains the URL.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-get_rooturl
     */
    get_RootURL() {
        result := ComCall(6, this, "ptr*", &ppszURL := 0, "HRESULT")
        return ppszURL
    }

    /**
     * Sets a value that indicates whether the search is rooted on a hierarchical tree structure.
     * @param {BOOL} fIsHierarchical Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> for hierarchical tree structures, <b>FALSE</b> for non-hierarchical systems such as websites.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-put_ishierarchical
     */
    put_IsHierarchical(fIsHierarchical) {
        result := ComCall(7, this, "int", fIsHierarchical, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether the search is rooted on a hierarchical tree structure.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * On return, points to <b>TRUE</b> for hierarchical tree structures, and <b>FALSE</b> for other structures such as websites.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-get_ishierarchical
     */
    get_IsHierarchical() {
        result := ComCall(8, this, "int*", &pfIsHierarchical := 0, "HRESULT")
        return pfIsHierarchical
    }

    /**
     * Sets a value that indicates whether the search engine is notified (by protocol handlers or other applications) about changes to the URLs under the search root.
     * @param {BOOL} fProvidesNotifications Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if notifications are provided; otherwise, <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-put_providesnotifications
     */
    put_ProvidesNotifications(fProvidesNotifications) {
        result := ComCall(9, this, "int", fProvidesNotifications, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether the search engine is notified (by protocol handlers or other applications) about changes to the URLs under the search root.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * On return, points to <b>TRUE</b> if this search root provides notifications; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-get_providesnotifications
     */
    get_ProvidesNotifications() {
        result := ComCall(10, this, "int*", &pfProvidesNotifications := 0, "HRESULT")
        return pfProvidesNotifications
    }

    /**
     * Sets a value that indicates whether this search root should be indexed only by notification and not crawled.
     * @param {BOOL} fUseNotificationsOnly Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if this search root should be indexed only by notification; otherwise, <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-put_usenotificationsonly
     */
    put_UseNotificationsOnly(fUseNotificationsOnly) {
        result := ComCall(11, this, "int", fUseNotificationsOnly, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether this search root should be indexed only by notification and not crawled.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * On return, points to <b>TRUE</b> if this search root should be indexed only by notification; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-get_usenotificationsonly
     */
    get_UseNotificationsOnly() {
        result := ComCall(12, this, "int*", &pfUseNotificationsOnly := 0, "HRESULT")
        return pfUseNotificationsOnly
    }

    /**
     * Sets the enumeration depth for this search root.
     * @param {Integer} dwDepth Type: <b>DWORD</b>
     * 
     * The depth (number of levels) to enumerate.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-put_enumerationdepth
     */
    put_EnumerationDepth(dwDepth) {
        result := ComCall(13, this, "uint", dwDepth, "HRESULT")
        return result
    }

    /**
     * Gets the enumeration depth for this search root.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to the depth (number of levels) to enumerate.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-get_enumerationdepth
     */
    get_EnumerationDepth() {
        result := ComCall(14, this, "uint*", &pdwDepth := 0, "HRESULT")
        return pdwDepth
    }

    /**
     * Sets a value that indicates how far into a host tree to crawl when indexing.
     * @param {Integer} dwDepth Type: <b>DWORD</b>
     * 
     * The depth (number of levels) to crawl a host tree.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-put_hostdepth
     */
    put_HostDepth(dwDepth) {
        result := ComCall(15, this, "uint", dwDepth, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates how far into a host tree to crawl when indexing.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * On return, points to the depth (number of levels) to crawl in the host tree.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-get_hostdepth
     */
    get_HostDepth() {
        result := ComCall(16, this, "uint*", &pdwDepth := 0, "HRESULT")
        return pdwDepth
    }

    /**
     * Sets a BOOL value that indicates whether the search engine should follow subdirectories and hierarchical scopes for this search root.
     * @param {BOOL} fFollowDirectories Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to follow directories or hierarchical scopes, otherwise <b>FALSE</b>. The default for this value is <b>TRUE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-put_followdirectories
     */
    put_FollowDirectories(fFollowDirectories) {
        result := ComCall(17, this, "int", fFollowDirectories, "HRESULT")
        return result
    }

    /**
     * Gets a BOOL value that indicates whether the search engine follows subdirectories and hierarchical scopes.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * On return, points to <b>TRUE</b> if the search engine follows subdirectories and hierarchical scopes; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-get_followdirectories
     */
    get_FollowDirectories() {
        result := ComCall(18, this, "int*", &pfFollowDirectories := 0, "HRESULT")
        return pfFollowDirectories
    }

    /**
     * Sets the type of authentication required to access the URLs under this search root.
     * @param {Integer} authType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-auth_type">AUTH_TYPE</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-auth_type">AUTH_TYPE</a> enumeration that indicates the authentication type.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-put_authenticationtype
     */
    put_AuthenticationType(authType) {
        result := ComCall(19, this, "int", authType, "HRESULT")
        return result
    }

    /**
     * Retrieves the type of authentication needed to access the URLs under this this search root.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-auth_type">AUTH_TYPE</a>*</b>
     * 
     * A pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-auth_type">AUTH_TYPE</a> enumeration that indicates the authentication type required to access URLs under this search root.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-get_authenticationtype
     */
    get_AuthenticationType() {
        result := ComCall(20, this, "int*", &pAuthType := 0, "HRESULT")
        return pAuthType
    }

    /**
     * Not implemented.
     * @param {PWSTR} pszUser This parameter is unused.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-put_user
     */
    put_User(pszUser) {
        pszUser := pszUser is String ? StrPtr(pszUser) : pszUser

        result := ComCall(21, this, "ptr", pszUser, "HRESULT")
        return result
    }

    /**
     * Not implemented.
     * @returns {PWSTR} This parameter is unused.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-get_user
     */
    get_User() {
        result := ComCall(22, this, "ptr*", &ppszUser := 0, "HRESULT")
        return ppszUser
    }

    /**
     * Not implemented.
     * @param {PWSTR} pszPassword This parameter is unused.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-put_password
     */
    put_Password(pszPassword) {
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        result := ComCall(23, this, "ptr", pszPassword, "HRESULT")
        return result
    }

    /**
     * Not implemented.
     * @returns {PWSTR} This parameter is unused.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchroot-get_password
     */
    get_Password() {
        result := ComCall(24, this, "ptr*", &ppszPassword := 0, "HRESULT")
        return ppszPassword
    }
}
