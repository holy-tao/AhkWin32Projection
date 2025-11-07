#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk
#Include .\IImageList.ahk
#Include .\IConsoleVerb.ahk
#Include ..\..\Foundation\HWND.ahk

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
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-queryresultview
     */
    QueryResultView() {
        result := ComCall(5, this, "ptr*", &pUnknown := 0, "HRESULT")
        return IUnknown(pUnknown)
    }

    /**
     * 
     * @returns {IImageList} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-queryscopeimagelist
     */
    QueryScopeImageList() {
        result := ComCall(6, this, "ptr*", &ppImageList := 0, "HRESULT")
        return IImageList(ppImageList)
    }

    /**
     * 
     * @returns {IImageList} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-queryresultimagelist
     */
    QueryResultImageList() {
        result := ComCall(7, this, "ptr*", &ppImageList := 0, "HRESULT")
        return IImageList(ppImageList)
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
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-messagebox
     */
    MessageBox(lpszText, lpszTitle, fuStyle) {
        lpszText := lpszText is String ? StrPtr(lpszText) : lpszText
        lpszTitle := lpszTitle is String ? StrPtr(lpszTitle) : lpszTitle

        result := ComCall(9, this, "ptr", lpszText, "ptr", lpszTitle, "uint", fuStyle, "int*", &piRetval := 0, "HRESULT")
        return piRetval
    }

    /**
     * 
     * @returns {IConsoleVerb} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-queryconsoleverb
     */
    QueryConsoleVerb() {
        result := ComCall(10, this, "ptr*", &ppConsoleVerb := 0, "HRESULT")
        return IConsoleVerb(ppConsoleVerb)
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
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-getmainwindow
     */
    GetMainWindow() {
        phwnd := HWND()
        result := ComCall(12, this, "ptr", phwnd, "HRESULT")
        return phwnd
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
