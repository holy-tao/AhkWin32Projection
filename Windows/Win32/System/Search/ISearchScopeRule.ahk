#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods to define scope rules for crawling and indexing.
 * @remarks
 * For a sample that demonstrates how to define command line options for Crawl Scope Manager (CSM) indexing operations, see the [CrawlScopeCommandLine](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/CrawlScopeCommandLine) sample.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-isearchscoperule
 * @namespace Windows.Win32.System.Search
 */
export default struct ISearchScopeRule extends IUnknown {
    /**
     * The interface identifier for ISearchScopeRule
     * @type {Guid}
     */
    static IID := Guid("{ab310581-ac80-11d1-8df3-00c04fb6ef53}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchScopeRule interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_PatternOrURL : IntPtr
        get_IsIncluded   : IntPtr
        get_IsDefault    : IntPtr
        get_FollowFlags  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchScopeRule.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {PWSTR} 
     */
    PatternOrURL {
        get => this.get_PatternOrURL()
    }

    /**
     * @type {BOOL} 
     */
    IsIncluded {
        get => this.get_IsIncluded()
    }

    /**
     * @type {BOOL} 
     */
    IsDefault {
        get => this.get_IsDefault()
    }

    /**
     * @type {Integer} 
     */
    FollowFlags {
        get => this.get_FollowFlags()
    }

    /**
     * Gets the pattern or URL for the rule. The scope rules determine what URLs or paths to include or exclude.
     * @remarks
     * A standard URL might look like this: <c> outlookexpress://{User sid}/{Identity}/Inbox)</c>
     * 
     * A pattern might look like this: <c> file:///c:\documents and settings\*\application data\* </c>
     * 
     * Only exclusion rules use patterns.
     * 
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * On return, contains the address of a pointer to a null-terminated, Unicode buffer that contains the pattern or URL string.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchscoperule-get_patternorurl
     */
    get_PatternOrURL() {
        result := ComCall(3, this, PWSTR.Ptr, &ppszPatternOrURL := 0, "HRESULT")
        return ppszPatternOrURL
    }

    /**
     * Gets a value identifying whether this rule is an inclusion rule. Inclusion rules identify scopes that should be included in the crawl scope.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * On return, points to <b>TRUE</b> if this rule is an inclusion rule, <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchscoperule-get_isincluded
     */
    get_IsIncluded() {
        result := ComCall(4, this, BOOL.Ptr, &pfIsIncluded := 0, "HRESULT")
        return pfIsIncluded
    }

    /**
     * Gets a value that identifies whether this is a default rule.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * On return, points to the <b>TRUE</b> for default rules and <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchscoperule-get_isdefault
     */
    get_IsDefault() {
        result := ComCall(5, this, BOOL.Ptr, &pfIsDefault := 0, "HRESULT")
        return pfIsDefault
    }

    /**
     * Not supported.This method returns E_InvalidArg when called.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Returns a pointer to a value that contains the follow flags.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchscoperule-get_followflags
     */
    get_FollowFlags() {
        result := ComCall(6, this, "uint*", &pFollowFlags := 0, "HRESULT")
        return pFollowFlags
    }

    Query(iid) {
        if (ISearchScopeRule.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PatternOrURL := CallbackCreate(GetMethod(implObj, "get_PatternOrURL"), flags, 2)
        this.vtbl.get_IsIncluded := CallbackCreate(GetMethod(implObj, "get_IsIncluded"), flags, 2)
        this.vtbl.get_IsDefault := CallbackCreate(GetMethod(implObj, "get_IsDefault"), flags, 2)
        this.vtbl.get_FollowFlags := CallbackCreate(GetMethod(implObj, "get_FollowFlags"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PatternOrURL)
        CallbackFree(this.vtbl.get_IsIncluded)
        CallbackFree(this.vtbl.get_IsDefault)
        CallbackFree(this.vtbl.get_FollowFlags)
    }
}
