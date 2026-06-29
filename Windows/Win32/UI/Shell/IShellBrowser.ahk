#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IShellView.ahk" { IShellView }
#Import "..\..\System\Ole\IOleWindow.ahk" { IOleWindow }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\WindowsAndMessaging\MSG.ahk" { MSG }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\WindowsAndMessaging\HMENU.ahk" { HMENU }
#Import "..\..\System\Ole\OLEMENUGROUPWIDTHS.ahk" { OLEMENUGROUPWIDTHS }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import "..\Controls\TBBUTTON.ahk" { TBBUTTON }

/**
 * Implemented by hosts of Shell views (objects that implement IShellView). Exposes methods that provide services for the view it is hosting and other objects that run in the context of the Explorer window.
 * @remarks
 * Windows Explorer and the <b>Open File</b> common dialog box are examples of implementations of this interface. It is a companion to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface exposed by extensions.
 * 
 * 
 * 
 * Objects that have access to the site chain of the browser can get a reference to the browser on <b>IShellBrowser</b> using  <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)">IServiceProvider::QueryService</a>, with Service IDs such as SID_STopLevelBrowser and SID_SCommDlgBrowser.
 * 
 * <b>Windows 7 and later</b>.  Windows Explorer context menus  can support in-place navigation by using  <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)">IServiceProvider::QueryService</a> with the Service ID SID_SlnPlaceBrowser.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellbrowser
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellBrowser extends IOleWindow {
    /**
     * The interface identifier for IShellBrowser
     * @type {Guid}
     */
    static IID := Guid("{000214e2-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellBrowser interfaces
    */
    struct Vtbl extends IOleWindow.Vtbl {
        InsertMenusSB          : IntPtr
        SetMenuSB              : IntPtr
        RemoveMenusSB          : IntPtr
        SetStatusTextSB        : IntPtr
        EnableModelessSB       : IntPtr
        TranslateAcceleratorSB : IntPtr
        BrowseObject           : IntPtr
        GetViewStateStream     : IntPtr
        GetControlWindow       : IntPtr
        SendControlMsg         : IntPtr
        QueryActiveShellView   : IntPtr
        OnViewWindowActive     : IntPtr
        SetToolbarItems        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellBrowser.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Allows the container to insert its menu groups into the composite menu that is displayed when an extended namespace is being viewed or used.
     * @remarks
     * This method is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceframe-insertmenus">IOleInPlaceFrame::InsertMenus</a> method. Windows Explorer puts <b>File</b> and <b>Edit</b> drop-down menus in the File menu group, <b>View</b> and <b>Tools</b> menus in the Container menu group, and a <b>Help</b> menu in the Window menu group. Each drop-down menu will have a unique identifier, FCIDM_MENU_FILE/EDIT/VIEW/TOOLS/HELP. The view is allowed to insert menu items into those submenus by their identifiers, which is different from OLE's in-place activation mechanism. The command identifiers for menus that the view inserts into either Windows Explorer's submenus or its own submenus must be between <b>FCIDM_SHVIEWFIRST</b> and <b>FCIDM_SHVIEWLAST</b>.
     * 
     * <h3><a id="Notes_to_Calling_Applications"></a><a id="notes_to_calling_applications"></a><a id="NOTES_TO_CALLING_APPLICATIONS"></a>Notes to Calling Applications</h3>
     * This method is called by namespace extensions when they are first being activated so they can insert their menus into the frame-level user interface.
     * 
     * The object application asks the container to add its menus to the menu specified in the <i>hmenuShared</i> parameter and to set the group counts in the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ns-oleidl-olemenugroupwidths">OLEMENUGROUPWIDTHS</a> array pointed to by the <i>lpMenuWidths</i> parameter. The object application then adds its own menus and counts. Objects can call the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceframe-insertmenus">IOleInPlaceFrame::InsertMenus</a> method as many times as necessary to build up the composite menus. The container should use the initial menu handle associated with the composite menu for all items in the drop-down menus.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * For <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellbrowser">IShellBrowser</a> implementations, the menu identifiers must be in the range of <b>FCIDM_BROWSERFIRST</b> to <b>FCIDM_BROWSERLAST</b>.
     * @param {HMENU} hmenuShared Type: <b>HMENU</b>
     * 
     * A handle to an empty menu.
     * @param {Pointer<OLEMENUGROUPWIDTHS>} lpMenuWidths Type: <b>LPOLEMENUGROUPWIDTHS</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ns-oleidl-olemenugroupwidths">OLEMENUGROUPWIDTHS</a> array of six <b>LONG</b> values. The container fills in elements 0, 2, and 4 to reflect the number of menu elements it provided in the File, View, and Window menu groups.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or a COM-defined error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-insertmenussb
     */
    InsertMenusSB(hmenuShared, lpMenuWidths) {
        result := ComCall(5, this, HMENU, hmenuShared, OLEMENUGROUPWIDTHS.Ptr, lpMenuWidths, "HRESULT")
        return result
    }

    /**
     * Installs the composite menu in the view window.
     * @remarks
     * This method is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceframe-setmenu">IOleInPlaceFrame::SetMenu</a> method. However, Windows Explorer performs menu dispatch based on the menu item identifier.
     * 
     * The availability of specific menu items depends on whether the view has the focus. Accordingly, it is necessary to call the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-onviewwindowactive">IShellBrowser::OnViewWindowActive</a> method whenever the view window (or one of its child windows) has the focus.
     * 
     * <h3><a id="Notes_to_Calling_Applications"></a><a id="notes_to_calling_applications"></a><a id="NOTES_TO_CALLING_APPLICATIONS"></a>Notes to Calling Applications</h3>
     * The object calls <b>IShellBrowser_SetMenuSB</b> to ask the container to install the composite menu structure set up by calls to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-insertmenussb">IShellBrowser::InsertMenusSB</a>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * A container's implementation of this method should call the <b>SetMenu</b> function.
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-setmenusb
     */
    SetMenuSB(hmenuShared, holemenuRes, hwndActiveObject) {
        result := ComCall(6, this, HMENU, hmenuShared, "ptr", holemenuRes, HWND, hwndActiveObject, "HRESULT")
        return result
    }

    /**
     * Permits the container to remove any of its menu elements from the in-place composite menu and to free all associated resources.
     * @remarks
     * This method is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceframe-removemenus">IOleInPlaceFrame::RemoveMenus</a> method.
     * 
     * The object should always permit the container to remove its menu elements from the composite menu before deactivating the shared user interface.
     * 
     * <h3><a id="Notes_to_Calling_Applications"></a><a id="notes_to_calling_applications"></a><a id="NOTES_TO_CALLING_APPLICATIONS"></a>Notes to Calling Applications</h3>
     * The method is called by the object application while it is being UI-deactivated so the browser can remove its menus.
     * @param {HMENU} hmenuShared Type: <b>HMENU</b>
     * 
     * A handle to the in-place composite menu that was constructed by calls to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-insertmenussb">IShellBrowser::InsertMenusSB</a> and the  <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-insertmenua">InsertMenu</a> function.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-removemenussb
     */
    RemoveMenusSB(hmenuShared) {
        result := ComCall(7, this, HMENU, hmenuShared, "HRESULT")
        return result
    }

    /**
     * Sets and displays status text about the in-place object in the container's frame-window status bar.
     * @remarks
     * It is also possible to send messages directly to the status window by using the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-sendcontrolmsg">IShellBrowser::SendControlMsg</a> method.
     * 
     * <h3><a id="Notes_to_Calling_Applications"></a><a id="notes_to_calling_applications"></a><a id="NOTES_TO_CALLING_APPLICATIONS"></a>Notes to Calling Applications</h3>
     * Use this method to set the contents of the status bar.
     * @param {PWSTR} pszStatusText Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated character string that contains the message to display.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-setstatustextsb
     */
    SetStatusTextSB(pszStatusText) {
        pszStatusText := pszStatusText is String ? StrPtr(pszStatusText) : pszStatusText

        result := ComCall(8, this, "ptr", pszStatusText, "HRESULT")
        return result
    }

    /**
     * Tells Windows Explorer to enable or disable its modeless dialog boxes.
     * @remarks
     * This method is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceframe-enablemodeless">IOleInPlaceFrame::EnableModeless</a> method. Although the current version of Windows Explorer does not have any modeless dialog boxes, the view should call this method when it wants to disable or enable modeless dialog boxes associated with the Windows Explorer window.
     * @param {BOOL} fEnable Type: <b>BOOL</b>
     * 
     * Specifies whether the modeless dialog boxes are to be enabled or disabled. If this parameter is nonzero, modeless dialog boxes are enabled. If this parameter is zero, modeless dialog boxes are disabled.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or a COM-defined error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-enablemodelesssb
     */
    EnableModelessSB(fEnable) {
        result := ComCall(9, this, BOOL, fEnable, "HRESULT")
        return result
    }

    /**
     * Translates accelerator keystrokes intended for the browser's frame while the view is active.
     * @remarks
     * This method is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceframe-translateaccelerator">IOleInPlaceFrame::TranslateAccelerator</a> method.
     * @param {Pointer<MSG>} pmsg Type: <b>LPMSG</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure containing the keystroke message.
     * @param {Integer} wID Type: <b>WORD</b>
     * 
     * The command identifier value corresponding to the keystroke in the container-provided accelerator table. Containers should use this value instead of translating again.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or a COM-defined error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-translateacceleratorsb
     */
    TranslateAcceleratorSB(pmsg, wID) {
        result := ComCall(10, this, MSG.Ptr, pmsg, "ushort", wID, "HRESULT")
        return result
    }

    /**
     * Informs Windows Explorer to browse to another folder.
     * @remarks
     * Views can use this method to force Windows Explorer to browse to a specific place in the namespace. Typically, these are folders contained in the view.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUIDLIST_RELATIVE</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> (item identifier list) structure that specifies an object's location. This value is dependent on the flag or flags set in the <i>wFlags</i> parameter.
     * @param {Integer} wFlags Type: <b>UINT</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-browseobject
     */
    BrowseObject(pidl, wFlags) {
        result := ComCall(11, this, ITEMIDLIST.Ptr, pidl, "uint", wFlags, "HRESULT")
        return result
    }

    /**
     * Gets an IStream interface that can be used for storage of view-specific state information.
     * @remarks
     * This method is used to save and restore the persistent state for a view (the icon positions, the column widths, and the current scroll position, for example).
     * 
     * <h3><a id="Notes_to_Calling_Applications"></a><a id="notes_to_calling_applications"></a><a id="NOTES_TO_CALLING_APPLICATIONS"></a>Notes to Calling Applications</h3>
     * Use <b>GetViewStateStream</b> when the view is being created to read in the saved view state and also when the view is being closed to save any changes to the view state. Typically, the view calls this method with <b>STGM_READ</b> when creating a view window and with <b>STGM_WRITE</b> when the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellview-saveviewstate">SaveViewState</a> method of its <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface is called.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Each Shell view should have its own view stream. Windows Explorer implements a most recently used (MRU) list of view streams that are stored on a per-user basis in the registry.
     * 
     * See also <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellbrowser">IShellBrowser</a>
     * @param {Integer} grfMode Type: <b>DWORD</b>
     * @returns {IStream} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>**</b>
     * 
     * The address that receives the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-getviewstatestream
     */
    GetViewStateStream(grfMode) {
        result := ComCall(12, this, "uint", grfMode, "ptr*", &ppStrm := 0, "HRESULT")
        return IStream(ppStrm)
    }

    /**
     * Gets the window handle to a browser control.
     * @remarks
     * <b>GetControlWindow</b> is used so views can directly manipulate the browser's controls. <b>FCW_TREE</b> should be used only to determine if the tree is present.
     * 
     * <h3><a id="Notes_to_Calling_Applications"></a><a id="notes_to_calling_applications"></a><a id="NOTES_TO_CALLING_APPLICATIONS"></a>Notes to Calling Applications</h3>
     * <b>GetControlWindow</b> is used to manipulate and test the state of the control windows. Do not send messages directly to these controls; instead, use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-sendcontrolmsg">IShellBrowser::SendControlMsg</a>. Be prepared for this method to return <b>NULL</b>. Later versions of Windows Explorer may not include a toolbar, status bar, or tree window.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * <b>GetControlWindow</b> returns the window handle to these controls if they exist in your implementation.
     * 
     * See also <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellbrowser">IShellBrowser</a>
     * @param {Integer} id Type: <b>UINT</b>
     * @returns {HWND} Type: <b>HWND*</b>
     * 
     * The address of the window handle to the Windows Explorer control.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-getcontrolwindow
     */
    GetControlWindow(id) {
        phwnd := HWND()
        result := ComCall(13, this, "uint", id, HWND.Ptr, phwnd, "HRESULT")
        return phwnd
    }

    /**
     * Sends control messages to either the toolbar or the status bar in a Windows Explorer window.
     * @remarks
     * Refer to the <a href="https://docs.microsoft.com/windows/desktop/Controls/common-controls-intro">Common Controls</a> documentation for more information on the messages that can be sent to the toolbar or status bar control.
     * 
     * <h3><a id="Notes_to_Calling_Applications"></a><a id="notes_to_calling_applications"></a><a id="NOTES_TO_CALLING_APPLICATIONS"></a>Notes to Calling Applications</h3>
     * Use of this call requires diligent attention, because leaving either the status bar or toolbar in an inappropriate state will affect the performance of Windows Explorer.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If your Windows Explorer does not have these controls, you can return <b>E_NOTIMPL</b>.
     * @param {Integer} id Type: <b>UINT</b>
     * 
     * An identifier for either a toolbar (<b>FCW_TOOLBAR</b>) or for a status bar window (<b>FCW_STATUS</b>).
     * @param {Integer} uMsg Type: <b>UINT</b>
     * 
     * The message to be sent to the control.
     * @param {WPARAM} _wParam Type: <b>WPARAM</b>
     * 
     * The value depends on the message specified in the <i>uMsg</i> parameter.
     * @param {LPARAM} _lParam Type: <b>LPARAM</b>
     * 
     * The value depends on the message specified in the <i>uMsg</i> parameter.
     * @returns {LRESULT} Type: <b>LRESULT*</b>
     * 
     * The address of the return value of the 
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendmessage">SendMessage</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-sendcontrolmsg
     */
    SendControlMsg(id, uMsg, _wParam, _lParam) {
        result := ComCall(14, this, "uint", id, "uint", uMsg, WPARAM, _wParam, LPARAM, _lParam, LRESULT.Ptr, &pret := 0, "HRESULT")
        return pret
    }

    /**
     * Retrieves the currently active (displayed) Shell view object.
     * @remarks
     * <h3><a id="Notes_to_Calling_Applications"></a><a id="notes_to_calling_applications"></a><a id="NOTES_TO_CALLING_APPLICATIONS"></a>Notes to Calling Applications</h3>
     * Because the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellbrowser">IShellBrowser</a> interface can host several Shell views simultaneously, this method provides an easy way to determine the active Shell view object.
     * @returns {IShellView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>**</b>
     * 
     * The address of the pointer to the currently active Shell view object.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-queryactiveshellview
     */
    QueryActiveShellView() {
        result := ComCall(15, this, "ptr*", &ppshv := 0, "HRESULT")
        return IShellView(ppshv)
    }

    /**
     * Called by the Shell view when the view window or one of its child windows gets the focus or becomes active.
     * @remarks
     * The view must pass its <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> implementation to this routine, although the current version of Windows Explorer does not use this parameter.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The Shell view object must call this method before calling the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-insertmenussb">IShellBrowser::InsertMenusSB</a> method. This method will insert a different set of menu items depending on whether the view has the focus.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * This method informs the browser that the view is getting the focus (when the mouse is clicked on the view, for example).
     * @param {IShellView} pshv Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * Address of the view object's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> pointer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-onviewwindowactive
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellbrowser-settoolbaritems
     */
    SetToolbarItems(lpButtons, nButtons, uFlags) {
        result := ComCall(17, this, TBBUTTON.Ptr, lpButtons, "uint", nButtons, "uint", uFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellBrowser.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InsertMenusSB := CallbackCreate(GetMethod(implObj, "InsertMenusSB"), flags, 3)
        this.vtbl.SetMenuSB := CallbackCreate(GetMethod(implObj, "SetMenuSB"), flags, 4)
        this.vtbl.RemoveMenusSB := CallbackCreate(GetMethod(implObj, "RemoveMenusSB"), flags, 2)
        this.vtbl.SetStatusTextSB := CallbackCreate(GetMethod(implObj, "SetStatusTextSB"), flags, 2)
        this.vtbl.EnableModelessSB := CallbackCreate(GetMethod(implObj, "EnableModelessSB"), flags, 2)
        this.vtbl.TranslateAcceleratorSB := CallbackCreate(GetMethod(implObj, "TranslateAcceleratorSB"), flags, 3)
        this.vtbl.BrowseObject := CallbackCreate(GetMethod(implObj, "BrowseObject"), flags, 3)
        this.vtbl.GetViewStateStream := CallbackCreate(GetMethod(implObj, "GetViewStateStream"), flags, 3)
        this.vtbl.GetControlWindow := CallbackCreate(GetMethod(implObj, "GetControlWindow"), flags, 3)
        this.vtbl.SendControlMsg := CallbackCreate(GetMethod(implObj, "SendControlMsg"), flags, 6)
        this.vtbl.QueryActiveShellView := CallbackCreate(GetMethod(implObj, "QueryActiveShellView"), flags, 2)
        this.vtbl.OnViewWindowActive := CallbackCreate(GetMethod(implObj, "OnViewWindowActive"), flags, 2)
        this.vtbl.SetToolbarItems := CallbackCreate(GetMethod(implObj, "SetToolbarItems"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InsertMenusSB)
        CallbackFree(this.vtbl.SetMenuSB)
        CallbackFree(this.vtbl.RemoveMenusSB)
        CallbackFree(this.vtbl.SetStatusTextSB)
        CallbackFree(this.vtbl.EnableModelessSB)
        CallbackFree(this.vtbl.TranslateAcceleratorSB)
        CallbackFree(this.vtbl.BrowseObject)
        CallbackFree(this.vtbl.GetViewStateStream)
        CallbackFree(this.vtbl.GetControlWindow)
        CallbackFree(this.vtbl.SendControlMsg)
        CallbackFree(this.vtbl.QueryActiveShellView)
        CallbackFree(this.vtbl.OnViewWindowActive)
        CallbackFree(this.vtbl.SetToolbarItems)
    }
}
