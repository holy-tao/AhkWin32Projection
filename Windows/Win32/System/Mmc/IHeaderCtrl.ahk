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
     * 
     * @param {Integer} nCol 
     * @param {PWSTR} title 
     * @param {Integer} nFormat 
     * @param {Integer} nWidth 
     * @returns {HRESULT} 
     */
    InsertColumn(nCol, title, nFormat, nWidth) {
        title := title is String ? StrPtr(title) : title

        result := ComCall(3, this, "int", nCol, "ptr", title, "int", nFormat, "int", nWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nCol 
     * @returns {HRESULT} 
     */
    DeleteColumn(nCol) {
        result := ComCall(4, this, "int", nCol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nCol 
     * @param {PWSTR} title 
     * @returns {HRESULT} 
     */
    SetColumnText(nCol, title) {
        title := title is String ? StrPtr(title) : title

        result := ComCall(5, this, "int", nCol, "ptr", title, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nCol 
     * @param {Pointer<PWSTR>} pText 
     * @returns {HRESULT} 
     */
    GetColumnText(nCol, pText) {
        result := ComCall(6, this, "int", nCol, "ptr", pText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nCol 
     * @param {Integer} nWidth 
     * @returns {HRESULT} 
     */
    SetColumnWidth(nCol, nWidth) {
        result := ComCall(7, this, "int", nCol, "int", nWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nCol 
     * @param {Pointer<Int32>} pWidth 
     * @returns {HRESULT} 
     */
    GetColumnWidth(nCol, pWidth) {
        result := ComCall(8, this, "int", nCol, "int*", pWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
