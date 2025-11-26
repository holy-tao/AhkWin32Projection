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
     * Allows the container to insert its menu groups into the composite menu that is displayed when an extended namespace is being viewed or used.
     * @param {HMENU} hmenuShared Type: <b>HMENU</b>
     * 
     * A handle to an empty menu.
     * @param {Pointer<OLEMENUGROUPWIDTHS>} lpMenuWidths Type: <b>LPOLEMENUGROUPWIDTHS</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ns-oleidl-olemenugroupwidths">OLEMENUGROUPWIDTHS</a> array of six <b>LONG</b> values. The container fills in elements 0, 2, and 4 to reflect the number of menu elements it provided in the File, View, and Window menu groups.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or a COM-defined error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellbrowser-insertmenussb
     */
    InsertMenusSB(hmenuShared, lpMenuWidths) {
        hmenuShared := hmenuShared is Win32Handle ? NumGet(hmenuShared, "ptr") : hmenuShared

        result := ComCall(5, this, "ptr", hmenuShared, "ptr", lpMenuWidths, "HRESULT")
        return result
    }

    /**
     * Installs the composite menu in the view window.
     * @param {HMENU} hmenuShared Type: <b>HMENU</b>
     * 
     * A handle to the composite menu constructed by calls to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-insertmenussb">IShellBrowser::InsertMenusSB</a> and the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-insertmenua">InsertMenu</a> function.
     * @param {Pointer} holemenuRes Type: <b>HOLEMENU</b>
     * @param {HWND} hwndActiveObject Type: <b>HWND</b>
     * 
     * The view's window handle.
     * @returns {HRESULT} Type: <b>RESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or a COM-defined error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellbrowser-setmenusb
     */
    SetMenuSB(hmenuShared, holemenuRes, hwndActiveObject) {
        hmenuShared := hmenuShared is Win32Handle ? NumGet(hmenuShared, "ptr") : hmenuShared
        hwndActiveObject := hwndActiveObject is Win32Handle ? NumGet(hwndActiveObject, "ptr") : hwndActiveObject

        result := ComCall(6, this, "ptr", hmenuShared, "ptr", holemenuRes, "ptr", hwndActiveObject, "HRESULT")
        return result
    }

    /**
     * Permits the container to remove any of its menu elements from the in-place composite menu and to free all associated resources.
     * @param {HMENU} hmenuShared Type: <b>HMENU</b>
     * 
     * A handle to the in-place composite menu that was constructed by calls to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-insertmenussb">IShellBrowser::InsertMenusSB</a> and the  <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-insertmenua">InsertMenu</a> function.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellbrowser-removemenussb
     */
    RemoveMenusSB(hmenuShared) {
        hmenuShared := hmenuShared is Win32Handle ? NumGet(hmenuShared, "ptr") : hmenuShared

        result := ComCall(7, this, "ptr", hmenuShared, "HRESULT")
        return result
    }

    /**
     * Sets and displays status text about the in-place object in the container's frame-window status bar.
     * @param {PWSTR} pszStatusText Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated character string that contains the message to display.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellbrowser-setstatustextsb
     */
    SetStatusTextSB(pszStatusText) {
        pszStatusText := pszStatusText is String ? StrPtr(pszStatusText) : pszStatusText

        result := ComCall(8, this, "ptr", pszStatusText, "HRESULT")
        return result
    }

    /**
     * Tells Windows Explorer to enable or disable its modeless dialog boxes.
     * @param {BOOL} fEnable Type: <b>BOOL</b>
     * 
     * Specifies whether the modeless dialog boxes are to be enabled or disabled. If this parameter is nonzero, modeless dialog boxes are enabled. If this parameter is zero, modeless dialog boxes are disabled.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or a COM-defined error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellbrowser-enablemodelesssb
     */
    EnableModelessSB(fEnable) {
        result := ComCall(9, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * Translates accelerator keystrokes intended for the browser's frame while the view is active.
     * @param {Pointer<MSG>} pmsg Type: <b>LPMSG</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure containing the keystroke message.
     * @param {Integer} wID Type: <b>WORD</b>
     * 
     * The command identifier value corresponding to the keystroke in the container-provided accelerator table. Containers should use this value instead of translating again.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or a COM-defined error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellbrowser-translateacceleratorsb
     */
    TranslateAcceleratorSB(pmsg, wID) {
        result := ComCall(10, this, "ptr", pmsg, "ushort", wID, "HRESULT")
        return result
    }

    /**
     * Informs Windows Explorer to browse to another folder.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUIDLIST_RELATIVE</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> (item identifier list) structure that specifies an object's location. This value is dependent on the flag or flags set in the <i>wFlags</i> parameter.
     * @param {Integer} wFlags Type: <b>UINT</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellbrowser-browseobject
     */
    BrowseObject(pidl, wFlags) {
        result := ComCall(11, this, "ptr", pidl, "uint", wFlags, "HRESULT")
        return result
    }

    /**
     * Gets an IStream interface that can be used for storage of view-specific state information.
     * @param {Integer} grfMode Type: <b>DWORD</b>
     * @returns {IStream} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>**</b>
     * 
     * The address that receives the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellbrowser-getviewstatestream
     */
    GetViewStateStream(grfMode) {
        result := ComCall(12, this, "uint", grfMode, "ptr*", &ppStrm := 0, "HRESULT")
        return IStream(ppStrm)
    }

    /**
     * Gets the window handle to a browser control.
     * @param {Integer} id Type: <b>UINT</b>
     * @returns {HWND} Type: <b>HWND*</b>
     * 
     * The address of the window handle to the Windows Explorer control.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellbrowser-getcontrolwindow
     */
    GetControlWindow(id) {
        phwnd := HWND()
        result := ComCall(13, this, "uint", id, "ptr", phwnd, "HRESULT")
        return phwnd
    }

    /**
     * Sends control messages to either the toolbar or the status bar in a Windows Explorer window.
     * @param {Integer} id Type: <b>UINT</b>
     * 
     * An identifier for either a toolbar (<b>FCW_TOOLBAR</b>) or for a status bar window (<b>FCW_STATUS</b>).
     * @param {Integer} uMsg Type: <b>UINT</b>
     * 
     * The message to be sent to the control.
     * @param {WPARAM} wParam Type: <b>WPARAM</b>
     * 
     * The value depends on the message specified in the <i>uMsg</i> parameter.
     * @param {LPARAM} lParam Type: <b>LPARAM</b>
     * 
     * The value depends on the message specified in the <i>uMsg</i> parameter.
     * @returns {LRESULT} Type: <b>LRESULT*</b>
     * 
     * The address of the return value of the 
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendmessage">SendMessage</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellbrowser-sendcontrolmsg
     */
    SendControlMsg(id, uMsg, wParam, lParam) {
        result := ComCall(14, this, "uint", id, "uint", uMsg, "ptr", wParam, "ptr", lParam, "ptr*", &pret := 0, "HRESULT")
        return pret
    }

    /**
     * Retrieves the currently active (displayed) Shell view object.
     * @returns {IShellView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>**</b>
     * 
     * The address of the pointer to the currently active Shell view object.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellbrowser-queryactiveshellview
     */
    QueryActiveShellView() {
        result := ComCall(15, this, "ptr*", &ppshv := 0, "HRESULT")
        return IShellView(ppshv)
    }

    /**
     * Called by the Shell view when the view window or one of its child windows gets the focus or becomes active.
     * @param {IShellView} pshv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * Address of the view object's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> pointer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellbrowser-onviewwindowactive
     */
    OnViewWindowActive(pshv) {
        result := ComCall(16, this, "ptr", pshv, "HRESULT")
        return result
    }

    /**
     * Adds toolbar items to Windows Explorer's toolbar.
     * @param {Pointer<TBBUTTON>} lpButtons Type: <b>LPTBBUTTONSB</b>
     * 
     * The address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tbbutton">TBBUTTON</a> structures.
     * @param {Integer} nButtons Type: <b>UINT</b>
     * 
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tbbutton">TBBUTTON</a> structures in the <i>lpButtons</i> array.
     * @param {Integer} uFlags Type: <b>UINT</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellbrowser-settoolbaritems
     */
    SetToolbarItems(lpButtons, nButtons, uFlags) {
        result := ComCall(17, this, "ptr", lpButtons, "uint", nButtons, "uint", uFlags, "HRESULT")
        return result
    }
}
