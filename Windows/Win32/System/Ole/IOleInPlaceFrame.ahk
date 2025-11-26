#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleInPlaceUIWindow.ahk

/**
 * Controls the container's top-level frame window.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ioleinplaceframe
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplaceframe-insertmenus
     */
    InsertMenus(hmenuShared, lpMenuWidths) {
        hmenuShared := hmenuShared is Win32Handle ? NumGet(hmenuShared, "ptr") : hmenuShared

        result := ComCall(9, this, "ptr", hmenuShared, "ptr", lpMenuWidths, "HRESULT")
        return result
    }

    /**
     * Adds a composite menu to the window frame containing the object being activated in place.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplaceframe-setmenu
     */
    SetMenu(hmenuShared, holemenu, hwndActiveObject) {
        hmenuShared := hmenuShared is Win32Handle ? NumGet(hmenuShared, "ptr") : hmenuShared
        hwndActiveObject := hwndActiveObject is Win32Handle ? NumGet(hwndActiveObject, "ptr") : hwndActiveObject

        result := ComCall(10, this, "ptr", hmenuShared, "ptr", holemenu, "ptr", hwndActiveObject, "HRESULT")
        return result
    }

    /**
     * Removes a container's menu elements from the composite menu.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplaceframe-removemenus
     */
    RemoveMenus(hmenuShared) {
        hmenuShared := hmenuShared is Win32Handle ? NumGet(hmenuShared, "ptr") : hmenuShared

        result := ComCall(11, this, "ptr", hmenuShared, "HRESULT")
        return result
    }

    /**
     * Sets and displays status text about the in-place object in the container's frame window status line.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplaceframe-setstatustext
     */
    SetStatusText(pszStatusText) {
        pszStatusText := pszStatusText is String ? StrPtr(pszStatusText) : pszStatusText

        result := ComCall(12, this, "ptr", pszStatusText, "HRESULT")
        return result
    }

    /**
     * Enables or disables a frame's modeless dialog boxes.
     * @param {BOOL} fEnable Specifies whether the modeless dialog box windows are to be enabled (<b>TRUE</b>) or disabled (<b>FALSE</b>).
     * @returns {HRESULT} This method returns S_OK if the dialog box was either enabled or disabled successfully, depending on the value for <i>fEnable</i>.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplaceframe-enablemodeless
     */
    EnableModeless(fEnable) {
        result := ComCall(13, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * Translates accelerator keystrokes intended for the container's frame while an object is active in place.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplaceframe-translateaccelerator
     */
    TranslateAccelerator(lpmsg, wID) {
        result := ComCall(14, this, "ptr", lpmsg, "ushort", wID, "HRESULT")
        return result
    }
}
