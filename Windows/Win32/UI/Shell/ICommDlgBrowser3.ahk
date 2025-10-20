#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICommDlgBrowser2.ahk

/**
 * Extends the capabilities of ICommDlgBrowser2, and used by the common file dialog boxes when they host a Shell browser.
 * @remarks
 * 
  * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icommdlgbrowser">ICommDlgBrowser</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icommdlgbrowser2">ICommDlgBrowser2</a> interfaces, from which it inherits.
  * 
  * A pointer to <b>ICommDlgBrowser3</b> can be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icommdlgbrowser2">ICommDlgBrowser2</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-icommdlgbrowser3
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICommDlgBrowser3 extends ICommDlgBrowser2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommDlgBrowser3
     * @type {Guid}
     */
    static IID => Guid("{c8ad25a1-3294-41ee-8165-71174bd01c57}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnColumnClicked", "GetCurrentFilter", "OnPreViewCreated"]

    /**
     * 
     * @param {IShellView} ppshv 
     * @param {Integer} iColumn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-icommdlgbrowser3-oncolumnclicked
     */
    OnColumnClicked(ppshv, iColumn) {
        result := ComCall(9, this, "ptr", ppshv, "int", iColumn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFileSpec 
     * @param {Integer} cchFileSpec 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-icommdlgbrowser3-getcurrentfilter
     */
    GetCurrentFilter(pszFileSpec, cchFileSpec) {
        pszFileSpec := pszFileSpec is String ? StrPtr(pszFileSpec) : pszFileSpec

        result := ComCall(10, this, "ptr", pszFileSpec, "int", cchFileSpec, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellView} ppshv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-icommdlgbrowser3-onpreviewcreated
     */
    OnPreViewCreated(ppshv) {
        result := ComCall(11, this, "ptr", ppshv, "HRESULT")
        return result
    }
}
