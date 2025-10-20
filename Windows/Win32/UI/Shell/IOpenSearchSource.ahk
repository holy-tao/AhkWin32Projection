#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method to get search results from a custom client-side OpenSearch data source.
 * @remarks
 * 
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
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iopensearchsource
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IOpenSearchSource extends IUnknown{
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
     * 
     * @param {HWND} hwnd 
     * @param {PWSTR} pszQuery 
     * @param {Integer} dwStartIndex 
     * @param {Integer} dwCount 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetResults(hwnd, pszQuery, dwStartIndex, dwCount, riid, ppv) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        pszQuery := pszQuery is String ? StrPtr(pszQuery) : pszQuery

        result := ComCall(3, this, "ptr", hwnd, "ptr", pszQuery, "uint", dwStartIndex, "uint", dwCount, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
