#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISearchCrawlScopeManager.ahk

/**
 * Extends the functionality of the ISearchCrawlScopeManager interface.
 * @remarks
 * For a sample that demonstrates how to define command line options for Crawl Scope Manager (CSM) indexing operations, see the [CrawlScopeCommandLine](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/CrawlScopeCommandLine) sample.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-isearchcrawlscopemanager2
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchCrawlScopeManager2 extends ISearchCrawlScopeManager{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchCrawlScopeManager2
     * @type {Guid}
     */
    static IID => Guid("{6292f7ad-4e19-4717-a534-8fc22bcd5ccd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVersion"]

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

        result := ComCall(19, this, plVersionMarshal, plVersion, "ptr", phFileMapping, "HRESULT")
        return result
    }
}
