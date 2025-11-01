#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISearchCrawlScopeManager.ahk

/**
 * Extends the functionality of the ISearchCrawlScopeManager interface.
 * @remarks
 * 
  * For a sample that demonstrates how to define command line options for Crawl Scope Manager (CSM) indexing operations, see the [CrawlScopeCommandLine](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/CrawlScopeCommandLine) sample.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchcrawlscopemanager2
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
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @param {Pointer<Pointer<Integer>>} plVersion 
     * @param {Pointer<HANDLE>} phFileMapping 
     * @returns {HRESULT} If the function succeeds, the return value includes the major and minor version numbers of the operating system in the low-order word, and information about the operating system platform in the high-order word.
     * 
     * For all platforms, the low-order word contains the version number of the operating system. The low-order byte of this word specifies the major version number, in hexadecimal notation. The high-order byte specifies the minor version (revision) number, in hexadecimal notation. The  high-order bit is zero, the next 7 bits represent the build number, and the low-order byte is 5.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion(plVersion, phFileMapping) {
        result := ComCall(19, this, "ptr*", plVersion, "ptr", phFileMapping, "HRESULT")
        return result
    }
}
