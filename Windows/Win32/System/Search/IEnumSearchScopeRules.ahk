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
     * Retrieves the specified number of ISearchScopeRule elements.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of elements to retrieve.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * On return, contains a pointer to the actual number of elements retrieved. Can be <b>NULL</b> if <i>celt</i> == 1, otherwise it must not be <b>NULL</b>.
     * @returns {ISearchScopeRule} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchscoperule">ISearchScopeRule</a>**</b>
     * 
     * On return, contains a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchscoperule">ISearchScopeRule</a> elements.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-ienumsearchscoperules-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &pprgelt := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return ISearchScopeRule(pprgelt)
    }

    /**
     * Skips the specified number of elements.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of elements to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, S_FALSE if there were not enough items left in the enumeration to skip, or an error value.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-ienumsearchscoperules-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Moves the internal counter to the beginning of the list so that a subsequent call to IEnumSearchScopeRules::Next retrieves from the beginning.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-ienumsearchscoperules-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a copy of this IEnumSearchScopeRules object with the same contents and state as the current one.
     * @returns {IEnumSearchScopeRules} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-ienumsearchscoperules">IEnumSearchScopeRules</a>**</b>
     * 
     * On return, contains a pointer to the cloned <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-ienumsearchscoperules">IEnumSearchScopeRules</a> object. The calling application must free the new object by calling its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-ienumsearchscoperules-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSearchScopeRules(ppenum)
    }
}
