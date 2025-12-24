#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumSearchRoots.ahk
#Include .\IEnumSearchScopeRules.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods that notify the search engine of containers to crawl and/or watch, and items under those containers to include or exclude when crawling or watching.
 * @remarks
 * 
 * For a sample that demonstrates how to define command line options for Crawl Scope Manager (CSM) indexing operations, see the [CrawlScopeCommandLine](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/CrawlScopeCommandLine) sample.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchcrawlscopemanager
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchCrawlScopeManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchCrawlScopeManager
     * @type {Guid}
     */
    static IID => Guid("{ab310581-ac80-11d1-8df3-00c04fb6ef55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddDefaultScopeRule", "AddRoot", "RemoveRoot", "EnumerateRoots", "AddHierarchicalScope", "AddUserScopeRule", "RemoveScopeRule", "EnumerateScopeRules", "HasParentScopeRule", "HasChildScopeRule", "IncludedInCrawlScope", "IncludedInCrawlScopeEx", "RevertToDefaultScopes", "SaveAll", "GetParentScopeVersionId", "RemoveDefaultScopeRule"]

    /**
     * Adds a URL as the default scope for this rule.
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcrawlscopemanager-adddefaultscoperule
     */
    AddDefaultScopeRule(pszURL, fInclude, fFollowFlags) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(3, this, "ptr", pszURL, "int", fInclude, "uint", fFollowFlags, "HRESULT")
        return result
    }

    /**
     * Adds a new search root to the search engine.
     * @param {ISearchRoot} pSearchRoot Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchroot">ISearchRoot</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchroot">ISearchRoot</a> describing the new search root to add.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcrawlscopemanager-addroot
     */
    AddRoot(pSearchRoot) {
        result := ComCall(4, this, "ptr", pSearchRoot, "HRESULT")
        return result
    }

    /**
     * Removes a search root from the search engine.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * The URL of a search root to be removed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful; S_FALSE if the root is not found.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcrawlscopemanager-removeroot
     */
    RemoveRoot(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(5, this, "ptr", pszURL, "HRESULT")
        return result
    }

    /**
     * Returns an enumeration of all the roots of which this instance of the ISearchCrawlScopeManager is aware.
     * @returns {IEnumSearchRoots} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-ienumsearchroots">IEnumSearchRoots</a>**</b>
     * 
     * Returns a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-ienumsearchroots">IEnumSearchRoots</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcrawlscopemanager-enumerateroots
     */
    EnumerateRoots() {
        result := ComCall(6, this, "ptr*", &ppSearchRoots := 0, "HRESULT")
        return IEnumSearchRoots(ppSearchRoots)
    }

    /**
     * Adds a hierarchical scope to the search engine.
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcrawlscopemanager-addhierarchicalscope
     */
    AddHierarchicalScope(pszURL, fInclude, fDefault, fOverrideChildren) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(7, this, "ptr", pszURL, "int", fInclude, "int", fDefault, "int", fOverrideChildren, "HRESULT")
        return result
    }

    /**
     * Adds a new crawl scope rule when the user creates a new rule or adds a URL to be indexed.
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcrawlscopemanager-adduserscoperule
     */
    AddUserScopeRule(pszURL, fInclude, fOverrideChildren, fFollowFlags) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(8, this, "ptr", pszURL, "int", fInclude, "int", fOverrideChildren, "uint", fFollowFlags, "HRESULT")
        return result
    }

    /**
     * Removes a scope rule from the search engine.
     * @param {PWSTR} pszRule Type: <b>LPCWSTR</b>
     * 
     * The URL or pattern of a scope rule to be removed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful; returns S_FALSE if the scope rule is not found.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcrawlscopemanager-removescoperule
     */
    RemoveScopeRule(pszRule) {
        pszRule := pszRule is String ? StrPtr(pszRule) : pszRule

        result := ComCall(9, this, "ptr", pszRule, "HRESULT")
        return result
    }

    /**
     * Returns an enumeration of all the scope rules of which this instance of the ISearchCrawlScopeManager interface is aware.
     * @returns {IEnumSearchScopeRules} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-ienumsearchscoperules">IEnumSearchScopeRules</a>**</b>
     * 
     * Returns a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-ienumsearchscoperules">IEnumSearchScopeRules</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcrawlscopemanager-enumeratescoperules
     */
    EnumerateScopeRules() {
        result := ComCall(10, this, "ptr*", &ppSearchScopeRules := 0, "HRESULT")
        return IEnumSearchScopeRules(ppSearchScopeRules)
    }

    /**
     * Identifies whether a given URL has a parent rule in scope.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * A string containing the URL to check for a parent rule.  The string can contain wildcard characters, such as asterisks (*).
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * <b>TRUE</b> if <i>pszURL</i> has a parent rule; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcrawlscopemanager-hasparentscoperule
     */
    HasParentScopeRule(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(11, this, "ptr", pszURL, "int*", &pfHasParentRule := 0, "HRESULT")
        return pfHasParentRule
    }

    /**
     * Identifies whether a given URL has a child rule in scope.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * A string containing the URL to check for a child rule. The string can contain wildcard characters, such as asterisks (*).
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * <b>TRUE</b> if <i>pszURL</i> has a child rule; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcrawlscopemanager-haschildscoperule
     */
    HasChildScopeRule(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(12, this, "ptr", pszURL, "int*", &pfHasChildRule := 0, "HRESULT")
        return pfHasChildRule
    }

    /**
     * Retrieves an indicator of whether the specified URL is included in the crawl scope.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * A string containing the URL to check for inclusion in the crawl scope.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer to a <b>BOOL</b> value: <b>TRUE</b> if <i>pszURL</i> is included in the crawl scope; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcrawlscopemanager-includedincrawlscope
     */
    IncludedInCrawlScope(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(13, this, "ptr", pszURL, "int*", &pfIsIncluded := 0, "HRESULT")
        return pfIsIncluded
    }

    /**
     * Retrieves an indicator of whether and why the specified URL is included in the crawl scope.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * A string value indicating the URL to check for inclusion in the crawl scope.
     * @param {Pointer<BOOL>} pfIsIncluded Type: <b>BOOL*</b>
     * 
     * A pointer to a <b>BOOL</b> value: <b>TRUE</b> if <i>pszURL</i> is included in the crawl scope; otherwise, <b>FALSE</b>.
     * @param {Pointer<Integer>} pReason Type: <b><a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-clusion_reason">CLUSION_REASON</a>*</b>
     * 
     * Retrieves a pointer to a value from the <a href="https://docs.microsoft.com/windows/win32/api/searchapi/ne-searchapi-clusion_reason">CLUSION_REASON</a> enumeration that indicates the reason that the specified URL was included in or excluded from the crawl scope.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcrawlscopemanager-includedincrawlscopeex
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
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcrawlscopemanager-reverttodefaultscopes
     */
    RevertToDefaultScopes() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Commits all changes to the search engine.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcrawlscopemanager-saveall
     */
    SaveAll() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Gets the version ID of the parent inclusion URL.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * A string containing the current URL.
     * @returns {Integer} Type: <b>LONG*</b>
     * 
     * On return, contains a pointer to the version ID of the parent inclusion  URL for <b>pszUrl</b>.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcrawlscopemanager-getparentscopeversionid
     */
    GetParentScopeVersionId(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(17, this, "ptr", pszURL, "int*", &plScopeId := 0, "HRESULT")
        return plScopeId
    }

    /**
     * Removes a default scope rule from the search engine.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * 
     * A string identifying the URL or pattern of the default rule to be removed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcrawlscopemanager-removedefaultscoperule
     */
    RemoveDefaultScopeRule(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(18, this, "ptr", pszURL, "HRESULT")
        return result
    }
}
