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
     * Called after a specified column is clicked in the IShellView interface.
     * @param {IShellView} ppshv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface of the hosted view.
     * @param {Integer} iColumn Type: <b>int</b>
     * 
     * The index of the column clicked.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-icommdlgbrowser3-oncolumnclicked
     */
    OnColumnClicked(ppshv, iColumn) {
        result := ComCall(9, this, "ptr", ppshv, "int", iColumn, "HRESULT")
        return result
    }

    /**
     * Gets the current filter as a Unicode string.
     * @param {PWSTR} pszFileSpec Type: <b>LPWSTR</b>
     * 
     * Contains a pointer to the current filter path/file as a Unicode string.
     * @param {Integer} cchFileSpec Type: <b>int</b>
     * 
     * Specifies the path/file length, in characters.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-icommdlgbrowser3-getcurrentfilter
     */
    GetCurrentFilter(pszFileSpec, cchFileSpec) {
        pszFileSpec := pszFileSpec is String ? StrPtr(pszFileSpec) : pszFileSpec

        result := ComCall(10, this, "ptr", pszFileSpec, "int", cchFileSpec, "HRESULT")
        return result
    }

    /**
     * Called after a specified preview is created in the IShellView interface.
     * @param {IShellView} ppshv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface of the hosted view.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-icommdlgbrowser3-onpreviewcreated
     */
    OnPreViewCreated(ppshv) {
        result := ComCall(11, this, "ptr", ppshv, "HRESULT")
        return result
    }
}
