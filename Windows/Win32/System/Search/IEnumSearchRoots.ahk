#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISearchRoot.ahk
#Include .\IEnumSearchRoots.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods to enumerate the search roots of a catalog, for example, SystemIndex.
 * @remarks
 * 
  * For a sample that demonstrates how to define command line options for Crawl Scope Manager (CSM) indexing operations, see the [CrawlScopeCommandLine](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/CrawlScopeCommandLine) code sample.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-ienumsearchroots
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IEnumSearchRoots extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumSearchRoots
     * @type {Guid}
     */
    static IID => Guid("{ab310581-ac80-11d1-8df3-00c04fb6ef52}")

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
     * @returns {ISearchRoot} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ienumsearchroots-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &rgelt := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return ISearchRoot(rgelt)
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ienumsearchroots-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ienumsearchroots-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumSearchRoots} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ienumsearchroots-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSearchRoots(ppenum)
    }
}
