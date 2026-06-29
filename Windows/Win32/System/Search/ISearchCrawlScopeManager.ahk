#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISearchRoot.ahk" { ISearchRoot }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IEnumSearchScopeRules.ahk" { IEnumSearchScopeRules }
#Import ".\CLUSION_REASON.ahk" { CLUSION_REASON }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IEnumSearchRoots.ahk" { IEnumSearchRoots }

/**
 * Provides methods that notify the search engine of containers to crawl and/or watch, and items under those containers to include or exclude when crawling or watching.
 * @remarks
 * For a sample that demonstrates how to define command line options for Crawl Scope Manager (CSM) indexing operations, see the [CrawlScopeCommandLine](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/CrawlScopeCommandLine) sample.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-isearchcrawlscopemanager
 * @namespace Windows.Win32.System.Search
 */
export default struct ISearchCrawlScopeManager extends IUnknown {
    /**
     * The interface identifier for ISearchCrawlScopeManager
     * @type {Guid}
     */
    static IID := Guid("{ab310581-ac80-11d1-8df3-00c04fb6ef55}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchCrawlScopeManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddDefaultScopeRule     : IntPtr
        AddRoot                 : IntPtr
        RemoveRoot              : IntPtr
        EnumerateRoots          : IntPtr
        AddHierarchicalScope    : IntPtr
        AddUserScopeRule        : IntPtr
        RemoveScopeRule         : IntPtr
        EnumerateScopeRules     : IntPtr
        HasParentScopeRule      : IntPtr
        HasChildScopeRule       : IntPtr
        IncludedInCrawlScope    : IntPtr
        IncludedInCrawlScopeEx  : IntPtr
        RevertToDefaultScopes   : IntPtr
        SaveAll                 : IntPtr
        GetParentScopeVersionId : IntPtr
        RemoveDefaultScopeRule  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchCrawlScopeManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a URL as the default scope for this rule.
     * @remarks
     * Default scope rules provide an initial set of scope rules. User scope rules always take precedence over default scope rules, unless user-defined rules are reverted in which case the default scope rules are reinstated.
     * 
     * URLs passed in as parameters to <b>ISearchCrawlScopeManager::AddDefaultScopeRule</b> are expected to be fully URL-decoded and without URL control codes. For example, file:///c:\My Documents is fully URL-decoded, whereas file:///c:\My%20Documents is not.
     * 
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated, Unicode buffer that contains the URL to use as a default scope.
     * @param {BOOL} fInclude Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if <i>pszUrl</i> should be included in indexing; <b>FALSE</b> if it should be excluded.
     * @param {Integer} fFollowFlags Type: <b>DWORD</b>
     * 
     * Sets the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-follow_flags">FOLLOW_FLAGS</a> to specify whether to follow complex URLs and whether a URL is to be indexed or just followed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-adddefaultscoperule
     */
    AddDefaultScopeRule(pszURL, fInclude, fFollowFlags) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(3, this, "ptr", pszURL, BOOL, fInclude, "uint", fFollowFlags, "HRESULT")
        return result
    }

    /**
     * Adds a new search root to the search engine.
     * @remarks
     * Overrides any existing root definition for the URL.
     * 
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @param {ISearchRoot} pSearchRoot Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchroot">ISearchRoot</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchroot">ISearchRoot</a> describing the new search root to add.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-addroot
     */
    AddRoot(pSearchRoot) {
        result := ComCall(4, this, "ptr", pSearchRoot, "HRESULT")
        return result
    }

    /**
     * Removes a search root from the search engine.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * The URL of a search root to be removed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful; S_FALSE if the root is not found.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-removeroot
     */
    RemoveRoot(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(5, this, "ptr", pszURL, "HRESULT")
        return result
    }

    /**
     * Returns an enumeration of all the roots of which this instance of the ISearchCrawlScopeManager is aware.
     * @remarks
     * <i>ppSearchRoots</i> is set to <b>NULL</b> if there are no roots to enumerate.
     * 
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {IEnumSearchRoots} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-ienumsearchroots">IEnumSearchRoots</a>**</b>
     * 
     * Returns a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-ienumsearchroots">IEnumSearchRoots</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-enumerateroots
     */
    EnumerateRoots() {
        result := ComCall(6, this, "ptr*", &ppSearchRoots := 0, "HRESULT")
        return IEnumSearchRoots(ppSearchRoots)
    }

    /**
     * Adds a hierarchical scope to the search engine.
     * @remarks
     * This method overrides existing scope rules for the URL.The preferred methods for such functionality are <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchcrawlscopemanager-adddefaultscoperule">ISearchCrawlScopeManager::AddDefaultScopeRule</a> and <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchcrawlscopemanager-adduserscoperule">ISearchCrawlScopeManager::AddUserScopeRule</a>.
     * 
     * URLs passed in as parameters to <b>ISearchCrawlScopeManager::AddHierarchicalScope</b> are expected to be fully URL-decoded and without URL control codes. For example, file:///c:\My Documents is fully URL-decoded, whereas file:///c:\My%20Documents is not.
     * 
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * The URL of the scope to be added.
     * @param {BOOL} fInclude Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if this is an inclusion scope, <b>FALSE</b> if this is an exclusion scope.
     * @param {BOOL} fDefault Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if this is to be the default scope, <b>FALSE</b> if this is not a default scope.
     * @param {BOOL} fOverrideChildren Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if this scope overrides all of the child URL rules, <b>FALSE</b> otherwise.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-addhierarchicalscope
     */
    AddHierarchicalScope(pszURL, fInclude, fDefault, fOverrideChildren) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(7, this, "ptr", pszURL, BOOL, fInclude, BOOL, fDefault, BOOL, fOverrideChildren, "HRESULT")
        return result
    }

    /**
     * Adds a new crawl scope rule when the user creates a new rule or adds a URL to be indexed.
     * @remarks
     * A scope rule can be a fully qualified URL or a rule with a pattern.
     * 
     * <b>ISearchCrawlScopeManager::AddUserScopeRule</b> overrides any existing scope rule for the URL or pattern.
     * 
     * URLs passed in as parameters to <b>ISearchCrawlScopeManager::AddUserScopeRule</b> are expected to be fully URL-decoded and without URL control codes. For example, file:///c:\My Documents is fully URL-decoded, whereas file:///c:\My%20Documents is not.
     * 
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * The URL to be indexed.
     * @param {BOOL} fInclude Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if this should be included in all <i>pszUrl</i> searches; otherwise, <b>FALSE</b>.
     * @param {BOOL} fOverrideChildren Type: <b>BOOL</b>
     * 
     * A <b>BOOL</b> value specifying whether child rules should be overridden. If set to <b>TRUE</b>, this essentially removes all child rules.
     * @param {Integer} fFollowFlags Type: <b>DWORD</b>
     * 
     * Sets the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-follow_flags">FOLLOW_FLAGS</a> to specify whether to follow complex URLs and whether a URL is to be indexed or just followed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-adduserscoperule
     */
    AddUserScopeRule(pszURL, fInclude, fOverrideChildren, fFollowFlags) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(8, this, "ptr", pszURL, BOOL, fInclude, BOOL, fOverrideChildren, "uint", fFollowFlags, "HRESULT")
        return result
    }

    /**
     * Removes a scope rule from the search engine.
     * @remarks
     * URLs passed in as parameters to <b>ISearchCrawlScopeManager::RemoveScopeRule</b> are expected to be fully URL-decoded and without URL control codes. For example, file:///c:\My Documents is fully URL-decoded, whereas file:///c:\My%20Documents is not.
     * 
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @param {PWSTR} pszRule Type: <b>LPCWSTR</b>
     * 
     * The URL or pattern of a scope rule to be removed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful; returns S_FALSE if the scope rule is not found.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-removescoperule
     */
    RemoveScopeRule(pszRule) {
        pszRule := pszRule is String ? StrPtr(pszRule) : pszRule

        result := ComCall(9, this, "ptr", pszRule, "HRESULT")
        return result
    }

    /**
     * Returns an enumeration of all the scope rules of which this instance of the ISearchCrawlScopeManager interface is aware.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {IEnumSearchScopeRules} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-ienumsearchscoperules">IEnumSearchScopeRules</a>**</b>
     * 
     * Returns a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-ienumsearchscoperules">IEnumSearchScopeRules</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-enumeratescoperules
     */
    EnumerateScopeRules() {
        result := ComCall(10, this, "ptr*", &ppSearchScopeRules := 0, "HRESULT")
        return IEnumSearchScopeRules(ppSearchScopeRules)
    }

    /**
     * Identifies whether a given URL has a parent rule in scope.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * A string containing the URL to check for a parent rule.  The string can contain wildcard characters, such as asterisks (*).
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * <b>TRUE</b> if <i>pszURL</i> has a parent rule; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-hasparentscoperule
     */
    HasParentScopeRule(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(11, this, "ptr", pszURL, BOOL.Ptr, &pfHasParentRule := 0, "HRESULT")
        return pfHasParentRule
    }

    /**
     * Identifies whether a given URL has a child rule in scope.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * A string containing the URL to check for a child rule. The string can contain wildcard characters, such as asterisks (*).
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * <b>TRUE</b> if <i>pszURL</i> has a child rule; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-haschildscoperule
     */
    HasChildScopeRule(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(12, this, "ptr", pszURL, BOOL.Ptr, &pfHasChildRule := 0, "HRESULT")
        return pfHasChildRule
    }

    /**
     * Retrieves an indicator of whether the specified URL is included in the crawl scope.
     * @remarks
     * For hierarchical sources, the most immediate parent is included. For non-hierarchical sources like URLs, this will be only the URL rule itself. Other URLs that might be indexed will cause this method to retrieve <b>FALSE</b> because there is no way to tell whether they are in the scope.
     * 
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * A string containing the URL to check for inclusion in the crawl scope.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer to a <b>BOOL</b> value: <b>TRUE</b> if <i>pszURL</i> is included in the crawl scope; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-includedincrawlscope
     */
    IncludedInCrawlScope(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(13, this, "ptr", pszURL, BOOL.Ptr, &pfIsIncluded := 0, "HRESULT")
        return pfIsIncluded
    }

    /**
     * Retrieves an indicator of whether and why the specified URL is included in the crawl scope.
     * @remarks
     * For hierarchical sources, the most immediate parent is included. For non-hierarchical sources like URLs, this will be only the URL rule itself. Other URLs that might be indexed will cause this method to retrieve <b>FALSE</b> because there is no way to tell whether they are in the scope.
     * 
     * <<b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * A string value indicating the URL to check for inclusion in the crawl scope.
     * @param {Pointer<BOOL>} pfIsIncluded Type: <b>BOOL*</b>
     * 
     * A pointer to a <b>BOOL</b> value: <b>TRUE</b> if <i>pszURL</i> is included in the crawl scope; otherwise, <b>FALSE</b>.
     * @param {Pointer<CLUSION_REASON>} pReason Type: <b><a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-clusion_reason">CLUSION_REASON</a>*</b>
     * 
     * Retrieves a pointer to a value from the <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-clusion_reason">CLUSION_REASON</a> enumeration that indicates the reason that the specified URL was included in or excluded from the crawl scope.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-includedincrawlscopeex
     */
    IncludedInCrawlScopeEx(pszURL, pfIsIncluded, pReason) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        pfIsIncludedMarshal := pfIsIncluded is VarRef ? "int*" : "ptr"
        pReasonMarshal := pReason is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, "ptr", pszURL, pfIsIncludedMarshal, pfIsIncluded, pReasonMarshal, pReason, "HRESULT")
        return result
    }

    /**
     * Reverts to the default scopes.
     * @remarks
     * This method removes all user-defined rules and reverts the working set of crawls scope rules to the default rules.
     * 
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-reverttodefaultscopes
     */
    RevertToDefaultScopes() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Commits all changes to the search engine.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-saveall
     */
    SaveAll() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Gets the version ID of the parent inclusion URL.
     * @remarks
     * Use this method to determine whether the indexer is aware of a change in a data store or scope (for example, a data store is removed and then re-added to the index), potentially requiring a new push of the hierarchical parent of the store's URL.
     * 
     * This ID can change if a scope rule is removed and then added again. This method returns <b>S_FALSE</b> if no parent inclusion URL was found.
     * 
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * A string containing the current URL.
     * @returns {Integer} Type: <b>LONG*</b>
     * 
     * On return, contains a pointer to the version ID of the parent inclusion  URL for <b>pszUrl</b>.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-getparentscopeversionid
     */
    GetParentScopeVersionId(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(17, this, "ptr", pszURL, "int*", &plScopeId := 0, "HRESULT")
        return plScopeId
    }

    /**
     * Removes a default scope rule from the search engine.
     * @remarks
     * URLs passed in as parameters to <b>ISearchCrawlScopeManager::RemoveDefaultScopeRule</b> are expected to be fully URL-decoded and without URL control codes. For example, file:///c:\My Documents is fully URL-decoded, whereas file:///c:\My%20Documents is not.
     * 
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * A string identifying the URL or pattern of the default rule to be removed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-removedefaultscoperule
     */
    RemoveDefaultScopeRule(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(18, this, "ptr", pszURL, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISearchCrawlScopeManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddDefaultScopeRule := CallbackCreate(GetMethod(implObj, "AddDefaultScopeRule"), flags, 4)
        this.vtbl.AddRoot := CallbackCreate(GetMethod(implObj, "AddRoot"), flags, 2)
        this.vtbl.RemoveRoot := CallbackCreate(GetMethod(implObj, "RemoveRoot"), flags, 2)
        this.vtbl.EnumerateRoots := CallbackCreate(GetMethod(implObj, "EnumerateRoots"), flags, 2)
        this.vtbl.AddHierarchicalScope := CallbackCreate(GetMethod(implObj, "AddHierarchicalScope"), flags, 5)
        this.vtbl.AddUserScopeRule := CallbackCreate(GetMethod(implObj, "AddUserScopeRule"), flags, 5)
        this.vtbl.RemoveScopeRule := CallbackCreate(GetMethod(implObj, "RemoveScopeRule"), flags, 2)
        this.vtbl.EnumerateScopeRules := CallbackCreate(GetMethod(implObj, "EnumerateScopeRules"), flags, 2)
        this.vtbl.HasParentScopeRule := CallbackCreate(GetMethod(implObj, "HasParentScopeRule"), flags, 3)
        this.vtbl.HasChildScopeRule := CallbackCreate(GetMethod(implObj, "HasChildScopeRule"), flags, 3)
        this.vtbl.IncludedInCrawlScope := CallbackCreate(GetMethod(implObj, "IncludedInCrawlScope"), flags, 3)
        this.vtbl.IncludedInCrawlScopeEx := CallbackCreate(GetMethod(implObj, "IncludedInCrawlScopeEx"), flags, 4)
        this.vtbl.RevertToDefaultScopes := CallbackCreate(GetMethod(implObj, "RevertToDefaultScopes"), flags, 1)
        this.vtbl.SaveAll := CallbackCreate(GetMethod(implObj, "SaveAll"), flags, 1)
        this.vtbl.GetParentScopeVersionId := CallbackCreate(GetMethod(implObj, "GetParentScopeVersionId"), flags, 3)
        this.vtbl.RemoveDefaultScopeRule := CallbackCreate(GetMethod(implObj, "RemoveDefaultScopeRule"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddDefaultScopeRule)
        CallbackFree(this.vtbl.AddRoot)
        CallbackFree(this.vtbl.RemoveRoot)
        CallbackFree(this.vtbl.EnumerateRoots)
        CallbackFree(this.vtbl.AddHierarchicalScope)
        CallbackFree(this.vtbl.AddUserScopeRule)
        CallbackFree(this.vtbl.RemoveScopeRule)
        CallbackFree(this.vtbl.EnumerateScopeRules)
        CallbackFree(this.vtbl.HasParentScopeRule)
        CallbackFree(this.vtbl.HasChildScopeRule)
        CallbackFree(this.vtbl.IncludedInCrawlScope)
        CallbackFree(this.vtbl.IncludedInCrawlScopeEx)
        CallbackFree(this.vtbl.RevertToDefaultScopes)
        CallbackFree(this.vtbl.SaveAll)
        CallbackFree(this.vtbl.GetParentScopeVersionId)
        CallbackFree(this.vtbl.RemoveDefaultScopeRule)
    }
}
