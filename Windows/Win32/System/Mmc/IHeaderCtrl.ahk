#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables the manipulation of columns and indicates the kind of information that is to be presented in the result view pane of the console.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iheaderctrl
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IHeaderCtrl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHeaderCtrl
     * @type {Guid}
     */
    static IID => Guid("{43136eb3-d36c-11cf-adbc-00aa00a80033}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InsertColumn", "DeleteColumn", "SetColumnText", "GetColumnText", "SetColumnWidth", "GetColumnWidth"]

    /**
     * 
     * @param {Integer} nCol 
     * @param {PWSTR} title 
     * @param {Integer} nFormat 
     * @param {Integer} nWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iheaderctrl-insertcolumn
     */
    InsertColumn(nCol, title, nFormat, nWidth) {
        title := title is String ? StrPtr(title) : title

        result := ComCall(3, this, "int", nCol, "ptr", title, "int", nFormat, "int", nWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nCol 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iheaderctrl-deletecolumn
     */
    DeleteColumn(nCol) {
        result := ComCall(4, this, "int", nCol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nCol 
     * @param {PWSTR} title 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iheaderctrl-setcolumntext
     */
    SetColumnText(nCol, title) {
        title := title is String ? StrPtr(title) : title

        result := ComCall(5, this, "int", nCol, "ptr", title, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nCol 
     * @param {Pointer<PWSTR>} pText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iheaderctrl-getcolumntext
     */
    GetColumnText(nCol, pText) {
        result := ComCall(6, this, "int", nCol, "ptr", pText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nCol 
     * @param {Integer} nWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iheaderctrl-setcolumnwidth
     */
    SetColumnWidth(nCol, nWidth) {
        result := ComCall(7, this, "int", nCol, "int", nWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nCol 
     * @param {Pointer<Integer>} pWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iheaderctrl-getcolumnwidth
     */
    GetColumnWidth(nCol, pWidth) {
        pWidthMarshal := pWidth is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "int", nCol, pWidthMarshal, pWidth, "HRESULT")
        return result
    }
}
