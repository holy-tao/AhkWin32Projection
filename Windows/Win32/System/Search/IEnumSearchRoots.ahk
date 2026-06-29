#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISearchRoot.ahk" { ISearchRoot }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods to enumerate the search roots of a catalog, for example, SystemIndex.
 * @remarks
 * For a sample that demonstrates how to define command line options for Crawl Scope Manager (CSM) indexing operations, see the [CrawlScopeCommandLine](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/CrawlScopeCommandLine) code sample.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-ienumsearchroots
 * @namespace Windows.Win32.System.Search
 */
export default struct IEnumSearchRoots extends IUnknown {
    /**
     * The interface identifier for IEnumSearchRoots
     * @type {Guid}
     */
    static IID := Guid("{ab310581-ac80-11d1-8df3-00c04fb6ef52}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumSearchRoots interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumSearchRoots.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the specified number of ISearchRoot elements.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of elements to retrieve.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * Retrieves a pointer to the actual number of elements retrieved. Can be <b>NULL</b> if <i>celt</i> == 1; otherwise it must not be <b>NULL</b>.
     * @returns {ISearchRoot} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchroot">ISearchRoot</a>**</b>
     * 
     * Retrieves a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchroot">ISearchRoot</a> elements.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ienumsearchroots-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &rgelt := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return ISearchRoot(rgelt)
    }

    /**
     * Skips the specified number of elements. (IEnumSearchRoots.Skip)
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of elements to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, S_FALSE if there were not enough items left in the enumeration to skip, or an error value.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ienumsearchroots-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Moves the internal counter to the beginning of the list so a subsequent call to IEnumSearchRoots::Next retrieves from the beginning.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ienumsearchroots-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a copy of the IEnumSearchRoots object with the same contents and state as the current one.
     * @remarks
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @returns {IEnumSearchRoots} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-ienumsearchroots">IEnumSearchRoots</a>**</b>
     * 
     * Returns a pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-ienumsearchroots">IEnumSearchRoots</a> object. The calling application must free the new object by calling its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ienumsearchroots-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSearchRoots(ppenum)
    }

    Query(iid) {
        if (IEnumSearchRoots.IID.Equals(iid)) {
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
