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
     * 
     * @param {Pointer<PWSTR>} ppszPatternOrURL 
     * @returns {HRESULT} 
     */
    get_PatternOrURL(ppszPatternOrURL) {
        result := ComCall(3, this, "ptr", ppszPatternOrURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsIncluded 
     * @returns {HRESULT} 
     */
    get_IsIncluded(pfIsIncluded) {
        result := ComCall(4, this, "ptr", pfIsIncluded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsDefault 
     * @returns {HRESULT} 
     */
    get_IsDefault(pfIsDefault) {
        result := ComCall(5, this, "ptr", pfIsDefault, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pFollowFlags 
     * @returns {HRESULT} 
     */
    get_FollowFlags(pFollowFlags) {
        result := ComCall(6, this, "uint*", pFollowFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
