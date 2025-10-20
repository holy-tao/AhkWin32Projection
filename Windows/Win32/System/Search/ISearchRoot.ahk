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
     * 
     * @param {PWSTR} pszTaskArg 
     * @returns {HRESULT} 
     */
    put_Schedule(pszTaskArg) {
        pszTaskArg := pszTaskArg is String ? StrPtr(pszTaskArg) : pszTaskArg

        result := ComCall(3, this, "ptr", pszTaskArg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszTaskArg 
     * @returns {HRESULT} 
     */
    get_Schedule(ppszTaskArg) {
        result := ComCall(4, this, "ptr", ppszTaskArg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszURL 
     * @returns {HRESULT} 
     */
    put_RootURL(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(5, this, "ptr", pszURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszURL 
     * @returns {HRESULT} 
     */
    get_RootURL(ppszURL) {
        result := ComCall(6, this, "ptr", ppszURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fIsHierarchical 
     * @returns {HRESULT} 
     */
    put_IsHierarchical(fIsHierarchical) {
        result := ComCall(7, this, "int", fIsHierarchical, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsHierarchical 
     * @returns {HRESULT} 
     */
    get_IsHierarchical(pfIsHierarchical) {
        result := ComCall(8, this, "ptr", pfIsHierarchical, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fProvidesNotifications 
     * @returns {HRESULT} 
     */
    put_ProvidesNotifications(fProvidesNotifications) {
        result := ComCall(9, this, "int", fProvidesNotifications, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfProvidesNotifications 
     * @returns {HRESULT} 
     */
    get_ProvidesNotifications(pfProvidesNotifications) {
        result := ComCall(10, this, "ptr", pfProvidesNotifications, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fUseNotificationsOnly 
     * @returns {HRESULT} 
     */
    put_UseNotificationsOnly(fUseNotificationsOnly) {
        result := ComCall(11, this, "int", fUseNotificationsOnly, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfUseNotificationsOnly 
     * @returns {HRESULT} 
     */
    get_UseNotificationsOnly(pfUseNotificationsOnly) {
        result := ComCall(12, this, "ptr", pfUseNotificationsOnly, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwDepth 
     * @returns {HRESULT} 
     */
    put_EnumerationDepth(dwDepth) {
        result := ComCall(13, this, "uint", dwDepth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwDepth 
     * @returns {HRESULT} 
     */
    get_EnumerationDepth(pdwDepth) {
        result := ComCall(14, this, "uint*", pdwDepth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwDepth 
     * @returns {HRESULT} 
     */
    put_HostDepth(dwDepth) {
        result := ComCall(15, this, "uint", dwDepth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwDepth 
     * @returns {HRESULT} 
     */
    get_HostDepth(pdwDepth) {
        result := ComCall(16, this, "uint*", pdwDepth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fFollowDirectories 
     * @returns {HRESULT} 
     */
    put_FollowDirectories(fFollowDirectories) {
        result := ComCall(17, this, "int", fFollowDirectories, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfFollowDirectories 
     * @returns {HRESULT} 
     */
    get_FollowDirectories(pfFollowDirectories) {
        result := ComCall(18, this, "ptr", pfFollowDirectories, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} authType 
     * @returns {HRESULT} 
     */
    put_AuthenticationType(authType) {
        result := ComCall(19, this, "int", authType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pAuthType 
     * @returns {HRESULT} 
     */
    get_AuthenticationType(pAuthType) {
        result := ComCall(20, this, "int*", pAuthType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszUser 
     * @returns {HRESULT} 
     */
    put_User(pszUser) {
        pszUser := pszUser is String ? StrPtr(pszUser) : pszUser

        result := ComCall(21, this, "ptr", pszUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszUser 
     * @returns {HRESULT} 
     */
    get_User(ppszUser) {
        result := ComCall(22, this, "ptr", ppszUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPassword 
     * @returns {HRESULT} 
     */
    put_Password(pszPassword) {
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        result := ComCall(23, this, "ptr", pszPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszPassword 
     * @returns {HRESULT} 
     */
    get_Password(ppszPassword) {
        result := ComCall(24, this, "ptr", ppszPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
