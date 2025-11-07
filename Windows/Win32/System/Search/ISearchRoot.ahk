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
     * 
     * @param {PWSTR} pszTaskArg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_schedule
     */
    put_Schedule(pszTaskArg) {
        pszTaskArg := pszTaskArg is String ? StrPtr(pszTaskArg) : pszTaskArg

        result := ComCall(3, this, "ptr", pszTaskArg, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_schedule
     */
    get_Schedule() {
        result := ComCall(4, this, "ptr*", &ppszTaskArg := 0, "HRESULT")
        return ppszTaskArg
    }

    /**
     * 
     * @param {PWSTR} pszURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_rooturl
     */
    put_RootURL(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(5, this, "ptr", pszURL, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_rooturl
     */
    get_RootURL() {
        result := ComCall(6, this, "ptr*", &ppszURL := 0, "HRESULT")
        return ppszURL
    }

    /**
     * 
     * @param {BOOL} fIsHierarchical 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_ishierarchical
     */
    put_IsHierarchical(fIsHierarchical) {
        result := ComCall(7, this, "int", fIsHierarchical, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_ishierarchical
     */
    get_IsHierarchical() {
        result := ComCall(8, this, "int*", &pfIsHierarchical := 0, "HRESULT")
        return pfIsHierarchical
    }

    /**
     * 
     * @param {BOOL} fProvidesNotifications 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_providesnotifications
     */
    put_ProvidesNotifications(fProvidesNotifications) {
        result := ComCall(9, this, "int", fProvidesNotifications, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_providesnotifications
     */
    get_ProvidesNotifications() {
        result := ComCall(10, this, "int*", &pfProvidesNotifications := 0, "HRESULT")
        return pfProvidesNotifications
    }

    /**
     * 
     * @param {BOOL} fUseNotificationsOnly 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_usenotificationsonly
     */
    put_UseNotificationsOnly(fUseNotificationsOnly) {
        result := ComCall(11, this, "int", fUseNotificationsOnly, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_usenotificationsonly
     */
    get_UseNotificationsOnly() {
        result := ComCall(12, this, "int*", &pfUseNotificationsOnly := 0, "HRESULT")
        return pfUseNotificationsOnly
    }

    /**
     * 
     * @param {Integer} dwDepth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_enumerationdepth
     */
    put_EnumerationDepth(dwDepth) {
        result := ComCall(13, this, "uint", dwDepth, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_enumerationdepth
     */
    get_EnumerationDepth() {
        result := ComCall(14, this, "uint*", &pdwDepth := 0, "HRESULT")
        return pdwDepth
    }

    /**
     * 
     * @param {Integer} dwDepth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_hostdepth
     */
    put_HostDepth(dwDepth) {
        result := ComCall(15, this, "uint", dwDepth, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_hostdepth
     */
    get_HostDepth() {
        result := ComCall(16, this, "uint*", &pdwDepth := 0, "HRESULT")
        return pdwDepth
    }

    /**
     * 
     * @param {BOOL} fFollowDirectories 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_followdirectories
     */
    put_FollowDirectories(fFollowDirectories) {
        result := ComCall(17, this, "int", fFollowDirectories, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_followdirectories
     */
    get_FollowDirectories() {
        result := ComCall(18, this, "int*", &pfFollowDirectories := 0, "HRESULT")
        return pfFollowDirectories
    }

    /**
     * 
     * @param {Integer} authType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_authenticationtype
     */
    put_AuthenticationType(authType) {
        result := ComCall(19, this, "int", authType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_authenticationtype
     */
    get_AuthenticationType() {
        result := ComCall(20, this, "int*", &pAuthType := 0, "HRESULT")
        return pAuthType
    }

    /**
     * 
     * @param {PWSTR} pszUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_user
     */
    put_User(pszUser) {
        pszUser := pszUser is String ? StrPtr(pszUser) : pszUser

        result := ComCall(21, this, "ptr", pszUser, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_user
     */
    get_User() {
        result := ComCall(22, this, "ptr*", &ppszUser := 0, "HRESULT")
        return ppszUser
    }

    /**
     * 
     * @param {PWSTR} pszPassword 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-put_password
     */
    put_Password(pszPassword) {
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        result := ComCall(23, this, "ptr", pszPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchroot-get_password
     */
    get_Password() {
        result := ComCall(24, this, "ptr*", &ppszPassword := 0, "HRESULT")
        return ppszPassword
    }
}
