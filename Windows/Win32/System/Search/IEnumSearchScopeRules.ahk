#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISearchScopeRule.ahk" { ISearchScopeRule }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enumerates scope rules.
 * @remarks
 * For a sample that demonstrates how to define command line options for Crawl Scope Manager (CSM) indexing operations, see the [CrawlScopeCommandLine](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/CrawlScopeCommandLine) sample.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-ienumsearchscoperules
 * @namespace Windows.Win32.System.Search
 */
export default struct IEnumSearchScopeRules extends IUnknown {
    /**
     * The interface identifier for IEnumSearchScopeRules
     * @type {Guid}
     */
    static IID := Guid("{ab310581-ac80-11d1-8df3-00c04fb6ef54}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumSearchScopeRules interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumSearchScopeRules.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the specified number of ISearchScopeRule elements.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of elements to retrieve.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * A pointer that this method will set to the actual number of elements retrieved. Can be <b>NULL</b> if <i>celt</i> == 1, otherwise it must not be <b>NULL</b>.
     * @returns {ISearchScopeRule} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchscoperule">ISearchScopeRule</a>**</b>
     * 
     * A pointer to an array which this method will initialize with <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchscoperule">ISearchScopeRule</a> elements.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ienumsearchscoperules-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &pprgelt := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return ISearchScopeRule(pprgelt)
    }

    /**
     * Skips the specified number of elements. (IEnumSearchScopeRules.Skip)
     * @remarks
     * Moves the internal counter a specified number of elements forward so that a subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-ienumsearchscoperules-next">IEnumSearchScopeRules::Next</a> starts from that number.
     * 
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of elements to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, S_FALSE if there were not enough items left in the enumeration to skip, or an error value.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ienumsearchscoperules-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Moves the internal counter to the beginning of the list so that a subsequent call to IEnumSearchScopeRules::Next retrieves from the beginning.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ienumsearchscoperules-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a copy of this IEnumSearchScopeRules object with the same contents and state as the current one.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {IEnumSearchScopeRules} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-ienumsearchscoperules">IEnumSearchScopeRules</a>**</b>
     * 
     * On return, contains a pointer to the cloned <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-ienumsearchscoperules">IEnumSearchScopeRules</a> object. The calling application must free the new object by calling its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ienumsearchscoperules-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSearchScopeRules(ppenum)
    }

    Query(iid) {
        if (IEnumSearchScopeRules.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}
