#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow an application to retrieve the contents of the Recent or Frequent categories in a Jump List.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * An implementation of this interface is provided in Windows as CLSID_ApplicationDocumentLists. This interface is not implemented by third parties.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * An application calls the methods of this interface when it wants to retrieve a Jump List's <b>Recent</b> or <b>Frequent</b> list. These lists are generated through calls to <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shaddtorecentdocs">SHAddToRecentDocs</a>, either explicitly or by the system when a file is opened through Windows Explorer or the common file dialog is used to open, save, or create a file.
  * 
  * 
  * 
  * <b>IApplicationDocumentLists</b> is used only with the automatically generated <b>Recent</b> or <b>Frequent</b> categories. It cannot retrieve a list of items that the user has pinned to the Jump List. That list cannot be retrieved programmatically because it cannot be manipulated programmatically; it is strictly under the user's control. <b>IApplicationDocumentLists</b> also cannot access custom categories or the task list.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iapplicationdocumentlists
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IApplicationDocumentLists extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationDocumentLists
     * @type {Guid}
     */
    static IID => Guid("{3c594f9f-9f30-47a1-979a-c9e83d3d0a06}")

    /**
     * The class identifier for ApplicationDocumentLists
     * @type {Guid}
     */
    static CLSID => Guid("{86bec222-30f2-47e0-9f25-60d11cd75c28}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAppID", "GetList"]

    /**
     * 
     * @param {PWSTR} pszAppID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdocumentlists-setappid
     */
    SetAppID(pszAppID) {
        pszAppID := pszAppID is String ? StrPtr(pszAppID) : pszAppID

        result := ComCall(3, this, "ptr", pszAppID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} listtype 
     * @param {Integer} cItemsDesired 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iapplicationdocumentlists-getlist
     */
    GetList(listtype, cItemsDesired, riid) {
        result := ComCall(4, this, "int", listtype, "uint", cItemsDesired, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
