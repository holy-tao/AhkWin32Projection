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
     * 
     * @param {Pointer<PWSTR>} ppszPatternOrURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchscoperule-get_patternorurl
     */
    get_PatternOrURL(ppszPatternOrURL) {
        result := ComCall(3, this, "ptr", ppszPatternOrURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsIncluded 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchscoperule-get_isincluded
     */
    get_IsIncluded(pfIsIncluded) {
        result := ComCall(4, this, "ptr", pfIsIncluded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsDefault 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchscoperule-get_isdefault
     */
    get_IsDefault(pfIsDefault) {
        result := ComCall(5, this, "ptr", pfIsDefault, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFollowFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchscoperule-get_followflags
     */
    get_FollowFlags(pFollowFlags) {
        pFollowFlagsMarshal := pFollowFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pFollowFlagsMarshal, pFollowFlags, "HRESULT")
        return result
    }
}
