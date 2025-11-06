#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\IShellView.ahk
#Include ..\..\System\Ole\IOleWindow.ahk

/**
 * Implemented by hosts of Shell views (objects that implement IShellView). Exposes methods that provide services for the view it is hosting and other objects that run in the context of the Explorer window.
 * @remarks
 * 
  * Windows Explorer and the <b>Open File</b> common dialog box are examples of implementations of this interface. It is a companion to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface exposed by extensions.
  * 
  * 
  * 
  * Objects that have access to the site chain of the browser can get a reference to the browser on <b>IShellBrowser</b> using  <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)">IServiceProvider::QueryService</a>, with Service IDs such as SID_STopLevelBrowser and SID_SCommDlgBrowser. See the Knowledge Base article <a href="https://support.microsoft.com/kb/257717">Retrieve the Top-Level IWebBrowser2 Interface from an ActiveX Control</a> for more information on using service IDs.
  * 
  * <b>Windows 7 and later</b>.  Windows Explorer context menus  can support in-place navigation by using  <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)">IServiceProvider::QueryService</a> with the Service ID SID_SlnPlaceBrowser.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellbrowser
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellBrowser extends IOleWindow{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellBrowser
     * @type {Guid}
     */
    static IID => Guid("{000214e2-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InsertMenusSB", "SetMenuSB", "RemoveMenusSB", "SetStatusTextSB", "EnableModelessSB", "TranslateAcceleratorSB", "BrowseObject", "GetViewStateStream", "GetControlWindow", "SendControlMsg", "QueryActiveShellView", "OnViewWindowActive", "SetToolbarItems"]

    /**
     * 
     * @param {HMENU} hmenuShared 
     * @param {Pointer<OLEMENUGROUPWIDTHS>} lpMenuWidths 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-insertmenussb
     */
    InsertMenusSB(hmenuShared, lpMenuWidths) {
        hmenuShared := hmenuShared is Win32Handle ? NumGet(hmenuShared, "ptr") : hmenuShared

        result := ComCall(5, this, "ptr", hmenuShared, "ptr", lpMenuWidths, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HMENU} hmenuShared 
     * @param {Pointer} holemenuRes 
     * @param {HWND} hwndActiveObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-setmenusb
     */
    SetMenuSB(hmenuShared, holemenuRes, hwndActiveObject) {
        hmenuShared := hmenuShared is Win32Handle ? NumGet(hmenuShared, "ptr") : hmenuShared
        hwndActiveObject := hwndActiveObject is Win32Handle ? NumGet(hwndActiveObject, "ptr") : hwndActiveObject

        result := ComCall(6, this, "ptr", hmenuShared, "ptr", holemenuRes, "ptr", hwndActiveObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HMENU} hmenuShared 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-removemenussb
     */
    RemoveMenusSB(hmenuShared) {
        hmenuShared := hmenuShared is Win32Handle ? NumGet(hmenuShared, "ptr") : hmenuShared

        result := ComCall(7, this, "ptr", hmenuShared, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszStatusText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-setstatustextsb
     */
    SetStatusTextSB(pszStatusText) {
        pszStatusText := pszStatusText is String ? StrPtr(pszStatusText) : pszStatusText

        result := ComCall(8, this, "ptr", pszStatusText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-enablemodelesssb
     */
    EnableModelessSB(fEnable) {
        result := ComCall(9, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} pmsg 
     * @param {Integer} wID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-translateacceleratorsb
     */
    TranslateAcceleratorSB(pmsg, wID) {
        result := ComCall(10, this, "ptr", pmsg, "ushort", wID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Integer} wFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-browseobject
     */
    BrowseObject(pidl, wFlags) {
        result := ComCall(11, this, "ptr", pidl, "uint", wFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfMode 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-getviewstatestream
     */
    GetViewStateStream(grfMode) {
        result := ComCall(12, this, "uint", grfMode, "ptr*", &ppStrm := 0, "HRESULT")
        return IStream(ppStrm)
    }

    /**
     * 
     * @param {Integer} id 
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-getcontrolwindow
     */
    GetControlWindow(id) {
        phwnd := HWND()
        result := ComCall(13, this, "uint", id, "ptr", phwnd, "HRESULT")
        return phwnd
    }

    /**
     * 
     * @param {Integer} id 
     * @param {Integer} uMsg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {LRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-sendcontrolmsg
     */
    SendControlMsg(id, uMsg, wParam, lParam) {
        result := ComCall(14, this, "uint", id, "uint", uMsg, "ptr", wParam, "ptr", lParam, "ptr*", &pret := 0, "HRESULT")
        return pret
    }

    /**
     * 
     * @returns {IShellView} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-queryactiveshellview
     */
    QueryActiveShellView() {
        result := ComCall(15, this, "ptr*", &ppshv := 0, "HRESULT")
        return IShellView(ppshv)
    }

    /**
     * 
     * @param {IShellView} pshv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-onviewwindowactive
     */
    OnViewWindowActive(pshv) {
        result := ComCall(16, this, "ptr", pshv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TBBUTTON>} lpButtons 
     * @param {Integer} nButtons 
     * @param {Integer} uFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-settoolbaritems
     */
    SetToolbarItems(lpButtons, nButtons, uFlags) {
        result := ComCall(17, this, "ptr", lpButtons, "uint", nButtons, "uint", uFlags, "HRESULT")
        return result
    }
}
