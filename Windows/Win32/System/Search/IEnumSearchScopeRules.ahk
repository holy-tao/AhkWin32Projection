#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISearchScopeRule.ahk
#Include .\IEnumSearchScopeRules.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates scope rules.
 * @remarks
 * 
 * For a sample that demonstrates how to define command line options for Crawl Scope Manager (CSM) indexing operations, see the [CrawlScopeCommandLine](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/CrawlScopeCommandLine) sample.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-ienumsearchscoperules
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IEnumSearchScopeRules extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumSearchScopeRules
     * @type {Guid}
     */
    static IID => Guid("{ab310581-ac80-11d1-8df3-00c04fb6ef54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {ISearchScopeRule} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ienumsearchscoperules-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &pprgelt := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return ISearchScopeRule(pprgelt)
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ienumsearchscoperules-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ienumsearchscoperules-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumSearchScopeRules} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ienumsearchscoperules-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSearchScopeRules(ppenum)
    }
}
