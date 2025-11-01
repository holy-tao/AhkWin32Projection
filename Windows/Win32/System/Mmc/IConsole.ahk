#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables communication with the console.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iconsole
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IConsole extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConsole
     * @type {Guid}
     */
    static IID => Guid("{43136eb1-d36c-11cf-adbc-00aa00a80033}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetHeader", "SetToolbar", "QueryResultView", "QueryScopeImageList", "QueryResultImageList", "UpdateAllViews", "MessageBox", "QueryConsoleVerb", "SelectScopeItem", "GetMainWindow", "NewWindow"]

    /**
     * 
     * @param {IHeaderCtrl} pHeader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-setheader
     */
    SetHeader(pHeader) {
        result := ComCall(3, this, "ptr", pHeader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IToolbar} pToolbar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-settoolbar
     */
    SetToolbar(pToolbar) {
        result := ComCall(4, this, "ptr", pToolbar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnknown 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-queryresultview
     */
    QueryResultView(pUnknown) {
        result := ComCall(5, this, "ptr*", pUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IImageList>} ppImageList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-queryscopeimagelist
     */
    QueryScopeImageList(ppImageList) {
        result := ComCall(6, this, "ptr*", ppImageList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IImageList>} ppImageList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-queryresultimagelist
     */
    QueryResultImageList(ppImageList) {
        result := ComCall(7, this, "ptr*", ppImageList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataObject} lpDataObject 
     * @param {LPARAM} data 
     * @param {Pointer} hint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-updateallviews
     */
    UpdateAllViews(lpDataObject, data, hint) {
        result := ComCall(8, this, "ptr", lpDataObject, "ptr", data, "ptr", hint, "HRESULT")
        return result
    }

    /**
     * Displays a modal dialog box that contains a system icon, a set of buttons, and a brief application-specific message, such as status or error information. The message box returns an integer value that indicates which button the user clicked.
     * @param {PWSTR} lpszText 
     * @param {PWSTR} lpszTitle 
     * @param {Integer} fuStyle 
     * @param {Pointer<Integer>} piRetval 
     * @returns {HRESULT} Type: <b>int</b>
     * 
     * If a message box has a <b>Cancel</b> button, the function returns the <b>IDCANCEL</b> value if either the ESC key is pressed or the <b>Cancel</b> button is selected. If the message box has no <b>Cancel</b> button, pressing ESC will no effect - unless an MB_OK button is present. If an MB_OK button is displayed and the user presses ESC, the return value will be <b>IDOK</b>.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the function succeeds, the return value is one of the following menu-item values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDABORT</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Abort</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDCANCEL</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Cancel</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDCONTINUE</b></dt>
     * <dt>11</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Continue</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDIGNORE</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Ignore</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDNO</b></dt>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>No</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDOK</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>OK</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDRETRY</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Retry</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDTRYAGAIN</b></dt>
     * <dt>10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Try Again</b> button was selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDYES</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Yes</b> button was selected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-messagebox
     */
    MessageBox(lpszText, lpszTitle, fuStyle, piRetval) {
        lpszText := lpszText is String ? StrPtr(lpszText) : lpszText
        lpszTitle := lpszTitle is String ? StrPtr(lpszTitle) : lpszTitle

        piRetvalMarshal := piRetval is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "ptr", lpszText, "ptr", lpszTitle, "uint", fuStyle, piRetvalMarshal, piRetval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IConsoleVerb>} ppConsoleVerb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-queryconsoleverb
     */
    QueryConsoleVerb(ppConsoleVerb) {
        result := ComCall(10, this, "ptr*", ppConsoleVerb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hScopeItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-selectscopeitem
     */
    SelectScopeItem(hScopeItem) {
        result := ComCall(11, this, "ptr", hScopeItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} phwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-getmainwindow
     */
    GetMainWindow(phwnd) {
        result := ComCall(12, this, "ptr", phwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hScopeItem 
     * @param {Integer} lOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-newwindow
     */
    NewWindow(hScopeItem, lOptions) {
        result := ComCall(13, this, "ptr", hScopeItem, "uint", lOptions, "HRESULT")
        return result
    }
}
