#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method to get search results from a custom client-side OpenSearch data source.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement this interface when a server-side only solution will not work, such as the following: 
 *             
 * 
 * <ul>
 * <li>Remote indexes with authentication methods which Windows 7 search federation does not support, like forms-based authentication or other custom authentication methods.</li>
 * <li>High value public stores of vertical data which are not controlled by the developer (such as the Library of Congress or medical research databases) and which do not provide OpenSearch output support today but have public web API.</li>
 * <li>Proprietary enterprise data stores or indexes and legacy content management stores for which it might not be possible to implement a front end.</li>
 * </ul>
 * A client-side OpenSearch data source that sits in between the Windows OpenSearch provider and the external data source.
 * 
 * With a search connector (a .searchconnector-ms file), Windows Explorer calls your implementation with the query parameters. Your implementation returns results formatted in RSS or Atom format. That allows your implementation to provide custom authentication UI and connect to the data source using its proprietary API.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-iopensearchsource
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IOpenSearchSource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpenSearchSource
     * @type {Guid}
     */
    static IID => Guid("{f0ee7333-e6fc-479b-9f25-a860c234a38e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResults"]

    /**
     * Returns search results, from an OpenSearch data source, formatted in RSS or Atom format.
     * @remarks
     * Windows Explorer calls this method with the search query parameters. The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iopensearchsource">IOpenSearchSource</a> implementation returns some or all results after performing required actions, such as providing custom authentication UI or connecting to the data source using a proprietary API.
     *             
     * 
     * <h3><a id="Paged_Results"></a><a id="paged_results"></a><a id="PAGED_RESULTS"></a>Paged Results</h3>
     * If you do not want the web service to return more than a limited number of results per request, this method can return just a "page" of results at a time. Windows Explorer can get additional pages of results by calling this method repeatedly and specifying a new index number. When returning results, the first result must be the result at the index requested by <i>dwStartIndex</i>.
     * 
     * <h3><a id="Index_Numbers_and_Counts"></a><a id="index_numbers_and_counts"></a><a id="INDEX_NUMBERS_AND_COUNTS"></a>Index Numbers and Counts</h3>
     * The index number identifies the first result on a page of results. It is equivalent to the OpenSearch {startIndex} parameter. The count, equivalent to the OpenSearch {count} parameter, identifies the expected or preferred number of items returned per page.
     * 
     * If a web service returns 20 items on the first page of results, the expected page size is 20.  To get the next 20 items, Windows Explorer would call <b>IOpenSearchSource::GetResults</b> with the value 21 for <i>dwStartIndex</i> and with the value of 20 for <i>dwCount</i>. When a page of results returned by the web service has fewer items than the expected page size, Windows Explorer assumes it has received the last page of results and stops making requests.
     * @param {HWND} hwnd_ Type: <b>HWND</b>
     * 
     * The window handle of the caller.
     * @param {PWSTR} pszQuery Type: <b>LPCWSTR</b>
     * 
     * The query as entered by the user. This parameter is equivalent to the OpenSearch {searchTerms} parameter and may be empty.
     * @param {Integer} dwStartIndex Type: <b>DWORD</b>
     * 
     * The index of the first result being requested. Equivalent to the OpenSearch {startIndex} parameter. See Remarks below.
     * @param {Integer} dwCount Type: <b>DWORD</b>
     * 
     * The number of results being requested.  Equivalent to the OpenSearch {count} parameter.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The IID of the interface being requested. Typically IID_IStream.
     * @returns {Pointer<Pointer<Void>>} Type: <b>void**</b>
     * 
     * An interface pointer, of type specified by RIID, to the object containing the results in Atom or RSS format.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-iopensearchsource-getresults
     */
    GetResults(hwnd_, pszQuery, dwStartIndex, dwCount, riid) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_
        pszQuery := pszQuery is String ? StrPtr(pszQuery) : pszQuery

        result := ComCall(3, this, "ptr", hwnd_, "ptr", pszQuery, "uint", dwStartIndex, "uint", dwCount, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }
}
