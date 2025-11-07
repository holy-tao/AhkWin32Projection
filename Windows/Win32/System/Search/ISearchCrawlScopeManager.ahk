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
     * 
     * @param {PWSTR} pszURL 
     * @param {BOOL} fInclude 
     * @param {Integer} fFollowFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-adddefaultscoperule
     */
    AddDefaultScopeRule(pszURL, fInclude, fFollowFlags) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(3, this, "ptr", pszURL, "int", fInclude, "uint", fFollowFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISearchRoot} pSearchRoot 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-addroot
     */
    AddRoot(pSearchRoot) {
        result := ComCall(4, this, "ptr", pSearchRoot, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-removeroot
     */
    RemoveRoot(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(5, this, "ptr", pszURL, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumSearchRoots} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-enumerateroots
     */
    EnumerateRoots() {
        result := ComCall(6, this, "ptr*", &ppSearchRoots := 0, "HRESULT")
        return IEnumSearchRoots(ppSearchRoots)
    }

    /**
     * 
     * @param {PWSTR} pszURL 
     * @param {BOOL} fInclude 
     * @param {BOOL} fDefault 
     * @param {BOOL} fOverrideChildren 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-addhierarchicalscope
     */
    AddHierarchicalScope(pszURL, fInclude, fDefault, fOverrideChildren) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(7, this, "ptr", pszURL, "int", fInclude, "int", fDefault, "int", fOverrideChildren, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszURL 
     * @param {BOOL} fInclude 
     * @param {BOOL} fOverrideChildren 
     * @param {Integer} fFollowFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-adduserscoperule
     */
    AddUserScopeRule(pszURL, fInclude, fOverrideChildren, fFollowFlags) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(8, this, "ptr", pszURL, "int", fInclude, "int", fOverrideChildren, "uint", fFollowFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszRule 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-removescoperule
     */
    RemoveScopeRule(pszRule) {
        pszRule := pszRule is String ? StrPtr(pszRule) : pszRule

        result := ComCall(9, this, "ptr", pszRule, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumSearchScopeRules} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-enumeratescoperules
     */
    EnumerateScopeRules() {
        result := ComCall(10, this, "ptr*", &ppSearchScopeRules := 0, "HRESULT")
        return IEnumSearchScopeRules(ppSearchScopeRules)
    }

    /**
     * 
     * @param {PWSTR} pszURL 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-hasparentscoperule
     */
    HasParentScopeRule(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(11, this, "ptr", pszURL, "int*", &pfHasParentRule := 0, "HRESULT")
        return pfHasParentRule
    }

    /**
     * 
     * @param {PWSTR} pszURL 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-haschildscoperule
     */
    HasChildScopeRule(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(12, this, "ptr", pszURL, "int*", &pfHasChildRule := 0, "HRESULT")
        return pfHasChildRule
    }

    /**
     * 
     * @param {PWSTR} pszURL 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-includedincrawlscope
     */
    IncludedInCrawlScope(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(13, this, "ptr", pszURL, "int*", &pfIsIncluded := 0, "HRESULT")
        return pfIsIncluded
    }

    /**
     * 
     * @param {PWSTR} pszURL 
     * @param {Pointer<BOOL>} pfIsIncluded 
     * @param {Pointer<Integer>} pReason 
     * @returns {HRESULT} 
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-reverttodefaultscopes
     */
    RevertToDefaultScopes() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-saveall
     */
    SaveAll() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszURL 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-getparentscopeversionid
     */
    GetParentScopeVersionId(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(17, this, "ptr", pszURL, "int*", &plScopeId := 0, "HRESULT")
        return plScopeId
    }

    /**
     * 
     * @param {PWSTR} pszURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager-removedefaultscoperule
     */
    RemoveDefaultScopeRule(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(18, this, "ptr", pszURL, "HRESULT")
        return result
    }
}
