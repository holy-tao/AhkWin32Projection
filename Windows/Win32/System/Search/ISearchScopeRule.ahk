#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods to define scope rules for crawling and indexing.
 * @remarks
 * 
 * For a sample that demonstrates how to define command line options for Crawl Scope Manager (CSM) indexing operations, see the [CrawlScopeCommandLine](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/CrawlScopeCommandLine) sample.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchscoperule
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchScopeRule extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchScopeRule
     * @type {Guid}
     */
    static IID => Guid("{ab310581-ac80-11d1-8df3-00c04fb6ef53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PatternOrURL", "get_IsIncluded", "get_IsDefault", "get_FollowFlags"]

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
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * On return, contains the address of a pointer to a null-terminated, Unicode buffer that contains the pattern or URL string.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchscoperule-get_patternorurl
     */
    get_PatternOrURL() {
        result := ComCall(3, this, "ptr*", &ppszPatternOrURL := 0, "HRESULT")
        return ppszPatternOrURL
    }

    /**
     * Gets a value identifying whether this rule is an inclusion rule. Inclusion rules identify scopes that should be included in the crawl scope.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * On return, points to <b>TRUE</b> if this rule is an inclusion rule, <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchscoperule-get_isincluded
     */
    get_IsIncluded() {
        result := ComCall(4, this, "int*", &pfIsIncluded := 0, "HRESULT")
        return pfIsIncluded
    }

    /**
     * Gets a value that identifies whether this is a default rule.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * On return, points to the <b>TRUE</b> for default rules and <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchscoperule-get_isdefault
     */
    get_IsDefault() {
        result := ComCall(5, this, "int*", &pfIsDefault := 0, "HRESULT")
        return pfIsDefault
    }

    /**
     * Not supported.This method returns E_InvalidArg when called.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Returns a pointer to a value that contains the follow flags.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchscoperule-get_followflags
     */
    get_FollowFlags() {
        result := ComCall(6, this, "uint*", &pFollowFlags := 0, "HRESULT")
        return pFollowFlags
    }
}
