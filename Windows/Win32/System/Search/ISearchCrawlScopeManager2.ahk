#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISearchCrawlScopeManager.ahk" { ISearchCrawlScopeManager }

/**
 * Extends the functionality of the ISearchCrawlScopeManager interface.
 * @remarks
 * For a sample that demonstrates how to define command line options for Crawl Scope Manager (CSM) indexing operations, see the [CrawlScopeCommandLine](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/CrawlScopeCommandLine) sample.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-isearchcrawlscopemanager2
 * @namespace Windows.Win32.System.Search
 */
export default struct ISearchCrawlScopeManager2 extends ISearchCrawlScopeManager {
    /**
     * The interface identifier for ISearchCrawlScopeManager2
     * @type {Guid}
     */
    static IID := Guid("{6292f7ad-4e19-4717-a534-8fc22bcd5ccd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchCrawlScopeManager2 interfaces
    */
    struct Vtbl extends ISearchCrawlScopeManager.Vtbl {
        GetVersion : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchCrawlScopeManager2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Causes file mapping to be mapped into the address space of the calling process, and informs clients if the state of the Crawl Scope Manager (CSM) has changed.
     * @remarks
     * The version number that is retrieved is always current, and changes as the state of the CSM, such as whether additions or removals were made to the crawl scope, for example. Hence, <b>ISearchCrawlScopeManager2::GetVersion</b> needs to be called only once, because the current version always remains available through the retrieved pointer.
     * 
     * <b>ISearchCrawlScopeManager2::GetVersion</b> does not result in a cross-process call. If the method succeeds, then the client must perform the following actions to destroy all file views in its address space, and then close the file mapping object's handle and the file on disk:
     * 
     * <ul>
     * <li>Call <b>UnmapViewOfFile</b> using the pointer of the memory-mapped file provided by <i>plVersion</i></li>
     * <li>Call <b>CloseHandle</b> using the handle of the file mapping object</li>
     * </ul>
     * The client must perform these steps when finished using the memory mapped file, to prevent memory leaks.
     * 
     * <b>Windows 7 and later</b>: Check out the <a href="https://docs.microsoft.com/windows/win32/search/-search-sample-crawlscopecommandline">CrawlScopeCommandLine code sample</a> to see how to define command line options for Crawl Scope Manager (CSM) indexing operations.
     * @param {Pointer<Pointer<Integer>>} plVersion Type: <b>LONG**</b>
     * 
     * Receives a pointer to the address of a memory mapped file that contains the crawl scope version.
     * @param {Pointer<HANDLE>} phFileMapping Type: <b>HANDLE*</b>
     * 
     * Receives a pointer to the handle of the file mapping object, with read-only access, that was used to create the memory mapped file that contains the crawl scope version.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcrawlscopemanager2-getversion
     */
    GetVersion(plVersion, phFileMapping) {
        plVersionMarshal := plVersion is VarRef ? "ptr*" : "ptr"

        result := ComCall(19, this, plVersionMarshal, plVersion, HANDLE.Ptr, phFileMapping, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISearchCrawlScopeManager2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetVersion := CallbackCreate(GetMethod(implObj, "GetVersion"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetVersion)
    }
}
