#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleInPlaceUIWindow.ahk

/**
 * Controls the container's top-level frame window.
 * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nn-oleidl-ioleinplaceframe
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleInPlaceFrame extends IOleInPlaceUIWindow{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleInPlaceFrame
     * @type {Guid}
     */
    static IID => Guid("{00000116-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InsertMenus", "SetMenu", "RemoveMenus", "SetStatusText", "EnableModeless", "TranslateAccelerator"]

    /**
     * Enables the container to insert menu groups into the composite menu to be used during the in-place session.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * This method is called by object applications when they are first being activated. They call it to insert their menus into the frame-level user interface.
     * 
     * The object application asks the container to add its menus to the menu specified in <i>hmenuShared</i> and to set the group counts in the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ns-oleidl-olemenugroupwidths">OLEMENUGROUPWIDTHS</a> array pointed to by <i>lpMenuWidths</i>. The object application then adds its own menus and counts. Objects can call <b>IOleInPlaceFrame::InsertMenus</b> as many times as necessary to build up the composite menus. The container should use the initial menu handle associated with the composite menu for all menu items in the drop-down menus.
     * @param {HMENU} hmenuShared A handle to an empty menu.
     * @param {Pointer<OLEMENUGROUPWIDTHS>} lpMenuWidths A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ns-oleidl-olemenugroupwidths">OLEMENUGROUPWIDTHS</a> array with six elements. The container fills in elements 0, 2, and 4 to reflect the number of menu elements it provided in the <b>File</b>, <b>View</b>, and <b>Window</b> menu groups.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleinplaceframe-insertmenus
     */
    InsertMenus(hmenuShared, lpMenuWidths) {
        hmenuShared := hmenuShared is Win32Handle ? NumGet(hmenuShared, "ptr") : hmenuShared

        result := ComCall(9, this, "ptr", hmenuShared, "ptr", lpMenuWidths, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a composite menu to the window frame containing the object being activated in place.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The object calls <b>IOleInPlaceFrame::SetMenu</b> to ask the container to install the composite menu structure set up by calls to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceframe-insertmenus">IOleInPlaceFrame::InsertMenus</a>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * An SDI container's implementation of this method should call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setmenu">SetMenu</a> function. An MDI container should send a <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-mdisetmenu">WM_MDISETMENU</a> message, using <i>hmenuShared</i> as the menu to install. The container should call <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olesetmenudescriptor">OleSetMenuDescriptor</a> to install the OLE dispatching code.
     * 
     * When deactivating, the container must call <b>IOleInPlaceFrame::SetMenu</b>, specifying <b>NULL</b> to remove the shared menu. This is done to help minimize window repaints. The container should also call <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olesetmenudescriptor">OleSetMenuDescriptor</a>, specifying <b>NULL</b> to unhook the dispatching code. Finally, the object application calls <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oledestroymenudescriptor">OleDestroyMenuDescriptor</a> to free the data structure.
     * 
     * <div class="alert"><b>Note</b>  While executing <b>IOleInPlaceFrame::SetMenu</b>, do not make calls to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountincomingarchive-getmessage-vb">GetMessage</a> functions, or a dialog box. Doing so may cause the system to deadlock. There are further restrictions on which OLE interface methods and functions can be called from within <b>IOleInPlaceFrame::SetMenu</b>.</div>
     * <div> </div>
     * @param {HMENU} hmenuShared A handle to the composite menu constructed by calls to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceframe-insertmenus">IOleInPlaceFrame::InsertMenus</a> and the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-insertmenua">InsertMenu</a> function.
     * @param {Pointer} holemenu A handle to the menu descriptor returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olecreatemenudescriptor">OleCreateMenuDescriptor</a> function.
     * @param {HWND} hwndActiveObject A handle to a window owned by the object and to which menu messages, commands, and accelerators are to be sent.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleinplaceframe-setmenu
     */
    SetMenu(hmenuShared, holemenu, hwndActiveObject) {
        hmenuShared := hmenuShared is Win32Handle ? NumGet(hmenuShared, "ptr") : hmenuShared
        hwndActiveObject := hwndActiveObject is Win32Handle ? NumGet(hwndActiveObject, "ptr") : hwndActiveObject

        result := ComCall(10, this, "ptr", hmenuShared, "ptr", holemenu, "ptr", hwndActiveObject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes a container's menu elements from the composite menu.
     * @remarks
     * The object should always give the container a chance to remove its menu elements from the composite menu before deactivating the shared user interface.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * This method is called by the object application while it is being UI-deactivated to remove its menus.
     * @param {HMENU} hmenuShared A handle to the in-place composite menu that was constructed by calls to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceframe-insertmenus">IOleInPlaceFrame::InsertMenus</a> and the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-insertmenua">InsertMenu</a> function.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleinplaceframe-removemenus
     */
    RemoveMenus(hmenuShared) {
        hmenuShared := hmenuShared is Win32Handle ? NumGet(hmenuShared, "ptr") : hmenuShared

        result := ComCall(11, this, "ptr", hmenuShared, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets and displays status text about the in-place object in the container's frame window status line.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * You should call <b>IOleInPlaceFrame::SetStatusText</b> when you need to ask the container to display object text in its frame's status line, if it has one. Because the container's frame window owns the status line, calling <b>IOleInPlaceFrame::SetStatusText</b> is the only way an object can display status information in the container's frame window. If the container refuses the object's request, the object application can, however, negotiate for border space to display its own status window.
     * 
     * When switching between menus owned by the container and the in-place active object, the status bar text is not reflected properly if the object does not call the container's <b>IOleInPlaceFrame::SetStatusText</b> method. For example, if, during an in-place session, the user were to select the <b>File</b> menu, the status bar would reflect the action that would occur if the user selected this menu. If the user then selects the <b>Edit</b> menu (which is owned by the in-place object), the status bar text would not change unless the <b>IOleInPlaceFrame::SetStatusText</b> happened to be called. This is because there is no way for the container to recognize that one of the object's menus has been made active because all the messages that the container would trap are now going to the object.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * To avoid potential problems, all objects being activated in place should process the <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-menuselect">WM_MENUSELECT</a> message and call <b>IOleInPlaceFrame::SetStatusText</b>, even if the object does not usually provide status information (in which case the object can just pass a <b>NULL</b> string for the requested status text).
     * 
     * <div class="alert"><b>Note</b>  While executing <b>IOleInPlaceFrame::SetStatusText</b>, do not make calls to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountincomingarchive-getmessage-vb">GetMessage</a> functions, or a dialog box. Doing so may cause the system to deadlock. There are further restrictions on which OLE interface methods and functions can be called from within <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceuiwindow-getborder">IOleInPlaceUIWindow::GetBorder</a>.</div>
     * <div> </div>
     * @param {PWSTR} pszStatusText The message to be displayed.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_TRUNCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some text was displayed but the message was too long and was truncated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified pointer is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleinplaceframe-setstatustext
     */
    SetStatusText(pszStatusText) {
        pszStatusText := pszStatusText is String ? StrPtr(pszStatusText) : pszStatusText

        result := ComCall(12, this, "ptr", pszStatusText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enables or disables a frame's modeless dialog boxes.
     * @param {BOOL} fEnable Specifies whether the modeless dialog box windows are to be enabled (<b>TRUE</b>) or disabled (<b>FALSE</b>).
     * @returns {HRESULT} This method returns S_OK if the dialog box was either enabled or disabled successfully, depending on the value for <i>fEnable</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleinplaceframe-enablemodeless
     */
    EnableModeless(fEnable) {
        result := ComCall(13, this, "int", fEnable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Translates accelerator keystrokes intended for the container's frame while an object is active in place.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The <b>IOleInPlaceFrame::TranslateAccelerator</b> method is called indirectly by <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oletranslateaccelerator">OleTranslateAccelerator</a> when a keystroke accelerator intended for the container (frame) is received.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The container application should perform its usual accelerator processing, or use <i>wID</i> directly, and then return, indicating whether the keystroke accelerator was processed. If the container is an MDI application and the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/cbasepropertypage-translateaccelerator">TranslateAccelerator</a> function fails, the container can call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-translatemdisysaccel">TranslateMDISysAccel</a> function, just as it does for its usual message processing.
     * 
     * In-place objects should be given first chance at translating accelerator messages. However, because objects implemented by DLL object applications do not have their own message pump, they receive their messages from the container's message queue. To ensure that the object has first chance at translating messages, a container should always call <b>IOleInPlaceFrame::TranslateAccelerator</b> before doing its own accelerator translation. Conversely, an executable object application should call <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oletranslateaccelerator">OleTranslateAccelerator</a> after calling <a href="https://docs.microsoft.com/windows/desktop/DirectShow/cbasepropertypage-translateaccelerator">TranslateAccelerator</a>, calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-translatemessage">TranslateMessage</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-dispatchmessage">DispatchMessage</a> only if both translation functions fail.
     * 
     * You should define accelerator tables for containers so they will work properly with object applications that do their own accelerator keystroke translations. Tables should be defined as follows.
     * 
     * 
     * ``` syntax
     * "char", wID, VIRTKEY, CONTROL
     * ```
     * 
     * This is the most common way to describe keyboard accelerators. Failure to do so can result in keystrokes being lost or sent to the wrong object during an in-place session.
     * @param {Pointer<MSG>} lpmsg A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure that contains the keystroke message.
     * @param {Integer} wID The command identifier value corresponding to the keystroke in the container-provided accelerator table. Containers should use this value instead of translating again.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The keystroke was not used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified pointer is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleinplaceframe-translateaccelerator
     */
    TranslateAccelerator(lpmsg, wID) {
        result := ComCall(14, this, "ptr", lpmsg, "ushort", wID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
