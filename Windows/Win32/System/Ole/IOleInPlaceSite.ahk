#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleWindow.ahk

/**
 * Manages the interaction between the container and the object's in-place client site. Recall that the client site is the display site for embedded objects, and provides position and conceptual information about the object.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ioleinplacesite
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleInPlaceSite extends IOleWindow{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleInPlaceSite
     * @type {Guid}
     */
    static IID => Guid("{00000119-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CanInPlaceActivate", "OnInPlaceActivate", "OnUIActivate", "GetWindowContext", "Scroll", "OnUIDeactivate", "OnInPlaceDeactivate", "DiscardUndoState", "DeactivateAndUndo", "OnPosRectChange"]

    /**
     * Determines whether the container can activate the object in place.
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
     * The container does not allow in-place activation for this object.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplacesite-caninplaceactivate
     */
    CanInPlaceActivate() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Notifies the container that one of its objects is being activated in place.
     * @returns {HRESULT} This method returns S_OK if the container allows the in-place activation.
     * Other possible return values include the following.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplacesite-oninplaceactivate
     */
    OnInPlaceActivate() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Notifies the container that the object is about to be activated in place and that the object is going to replace the container's main menu with an in-place composite menu.
     * @returns {HRESULT} This method returns S_OK if the container allows the in-place activation.
     * Other possible return values include the following.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplacesite-onuiactivate
     */
    OnUIActivate() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Enables an in-place object to retrieve the window interfaces that form the window object hierarchy, and the position in the parent window where the object's in-place activation window should be located.
     * @param {Pointer<IOleInPlaceFrame>} ppFrame A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplaceframe">IOleInPlaceFrame</a> pointer variable that receives the interface pointer to the frame. If an error occurs, the implementation must set <i>ppFrame</i> to <b>NULL</b>.
     * @param {Pointer<IOleInPlaceUIWindow>} ppDoc A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplaceuiwindow">IOleInPlaceUIWindow</a> pointer variable that receives the interface pointer to the document window. If the document window is the same as the frame window, <i>ppDoc</i> is set to <b>NULL</b>. In this case, the object can only use <i>ppFrame</i> or border negotiation. If an error is returned, the implementation must set <i>ppDoc</i> to <b>NULL</b>.
     * @param {Pointer<RECT>} lprcPosRect A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure for the rectangle containing the position of the in-place object in the client coordinates of its parent window. If an error is returned, this parameter must be set to <b>NULL</b>.
     * @param {Pointer<RECT>} lprcClipRect A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure for the outer rectangle containing the in-place object's position rectangle (<i>lprcPosRect</i>). This rectangle is relative to the client area of the object's parent window. If an error is returned, this parameter must be set to <b>NULL</b>.
     * @param {Pointer<OLEINPLACEFRAMEINFO>} lpFrameInfo A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/oleidl/ns-oleidl-oleinplaceframeinfo">OLEINPLACEFRAMEINFO</a> structure the container is to fill in with appropriate data. If an error is returned, this parameter must be set to <b>NULL</b>.
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
     *  One or more of the supplied pointers is invalid.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplacesite-getwindowcontext
     */
    GetWindowContext(ppFrame, ppDoc, lprcPosRect, lprcClipRect, lpFrameInfo) {
        result := ComCall(8, this, "ptr*", ppFrame, "ptr*", ppDoc, "ptr", lprcPosRect, "ptr", lprcClipRect, "ptr", lpFrameInfo, "HRESULT")
        return result
    }

    /**
     * Instructs the container to scroll the view of the object by the specified number of pixels.
     * @param {SIZE} scrollExtant The number of pixels by which to scroll in the X and Y directions.
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
     * The specified pointer is not valid.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplacesite-scroll
     */
    Scroll(scrollExtant) {
        result := ComCall(9, this, "ptr", scrollExtant, "HRESULT")
        return result
    }

    /**
     * Notifies the container that it should reinstall its user interface and take focus, and whether the object has an undoable state.
     * @param {BOOL} fUndoable Specifies whether the object can undo changes (TRUE) or not (FALSE).
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplacesite-onuideactivate
     */
    OnUIDeactivate(fUndoable) {
        result := ComCall(10, this, "int", fUndoable, "HRESULT")
        return result
    }

    /**
     * Notifies the container that the object is no longer active in place.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplacesite-oninplacedeactivate
     */
    OnInPlaceDeactivate() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Instructs the container to discard its undo state. The container should not call IOleInPlaceObject::ReActivateAndUndo.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplacesite-discardundostate
     */
    DiscardUndoState() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Deactivates the object, ends the in-place session, and reverts to the container's saved undo state.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplacesite-deactivateandundo
     */
    DeactivateAndUndo() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Notifies the container that the object extents have changed.
     * @param {Pointer<RECT>} lprcPosRect A pointer a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the position of the in-place object in the client coordinates of its parent window.
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
     * The supplied pointer is invalid.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplacesite-onposrectchange
     */
    OnPosRectChange(lprcPosRect) {
        result := ComCall(14, this, "ptr", lprcPosRect, "HRESULT")
        return result
    }
}
