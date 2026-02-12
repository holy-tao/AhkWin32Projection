#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleWindow.ahk

/**
 * Manages the activation and deactivation of in-place objects, and determines how much of the in-place object should be visible.
 * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nn-oleidl-ioleinplaceobject
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleInPlaceObject extends IOleWindow{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleInPlaceObject
     * @type {Guid}
     */
    static IID => Guid("{00000113-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InPlaceDeactivate", "UIDeactivate", "SetObjectRects", "ReactivateAndUndo"]

    /**
     * Deactivates an active in-place object and discards the object's undo state.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * This method is called by an active object's immediate container to deactivate the active object and discard its undo state.
     * 
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * On return from <b>IOleInPlaceObject::InPlaceDeactivate</b>, the object discards its undo state. The object application should not shut down immediately after this call. Instead, it should wait for an explicit call to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-close">IOleObject::Close</a> or for the object's reference count to reach zero.
     * 
     * Before deactivating, the object application should give the container a chance to put its user interface back on the frame window by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplacesite-onuideactivate">IOleInPlaceSite::OnUIDeactivate</a>.
     * 
     * If the in-place user interface is still visible during the call to <b>IOleInPlaceObject::InPlaceDeactivate</b>, the object application should call its own <b>IOleInPlaceObject::InPlaceDeactivate</b> method to hide the user interface. The in-place user interface can be optionally destroyed during calls to <b>IOleInPlaceObject::InPlaceDeactivate</b> and <b>IOleInPlaceObject::InPlaceDeactivate</b>. But if the user interface has not already been destroyed when the container calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-close">IOleObject::Close</a>, then it must be destroyed during the call to <b>IOleObject::Close</b>.
     * 
     * During the call to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-close">IOleObject::Close</a>, the object should check to see whether it is still active in place. If so, it should call <b>IOleInPlaceObject::InPlaceDeactivate</b>.
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
     * An unexpected error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleinplaceobject-inplacedeactivate
     */
    InPlaceDeactivate() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deactivates and removes the user interface of an active in-place object.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * This method is called by the object's immediate container when, for example, the user has clicked in the client area outside the object.
     * 
     * If the container has called <b>IOleInPlaceObject::UIDeactivate</b>, it should later call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceobject-inplacedeactivate">IOleInPlaceObject::InPlaceDeactivate</a> to properly clean up resources. The container can assume that stopping or releasing the object cleans up resources if necessary. The object must be prepared to do so if <b>IOleInPlaceObject::InPlaceDeactivate</b> has not been called. but either <b>IOleInPlaceObject::UIDeactivate</b> or <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-close">IOleObject::Close</a> has been called.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Resources such as menus and windows can be either cleaned up or kept in a hidden state until your object is completely deactivated by calls to either <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceobject-inplacedeactivate">IOleInPlaceObject::InPlaceDeactivate</a> or <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-close">IOleObject::Close</a>. The object application must call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplacesite-onuideactivate">IOleInPlaceSite::OnUIDeactivate</a> before doing anything with the composite menus so that the container can first be detached from the frame window. On deactivating the in-place object's user interface, the object is left in a ready state so it can be quickly reactivated. The object stays in this state until the undo state of the document changes. The container should then call <b>IOleInPlaceObject::InPlaceDeactivate</b> to tell the object to discard its undo state.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleinplaceobject-uideactivate
     */
    UIDeactivate() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies how much of the in-place object is to be visible.
     * @remarks
     * It is possible for <i>lprcClipRect</i> to change without <i>lprcPosRect</i> changing.
     * 
     * The size of an in-place object's rectangle is always calculated in pixels. This is different from other OLE object's visualizations, which are in <b>HIMETRIC</b>.
     * 
     * <div class="alert"><b>Note</b>  While executing <b>IOleInPlaceObject::SetObjectRects</b>, do not make calls to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountincomingarchive-getmessage-vb">GetMessage</a> functions, or a dialog box. Doing so may cause the system to deadlock. There are further restrictions on which OLE interface methods and functions can be called from within <b>IOleInPlaceObject::SetObjectRects</b>.</div>
     * <div> </div>
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The container should call <b>IOleInPlaceObject::SetObjectRects</b> whenever the window position of the in-place object and/or the visible part of the in-place object changes.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The object must size its in-place window to match the intersection of <i>lprcPosRect</i> and <i>lprcClipRect</i>. The object must also draw its contents into the object's in-place window so that proper clipping takes place.
     * 
     * The object should compare its width and height with those provided by its container (conveyed through <i>lprcPosRect</i>). If the comparison does not result in a match, the container is applying scaling to the object. The object must then decide whether it should continue the in-place editing in the scale/zoom mode or deactivate.
     * @param {Pointer<RECT>} lprcPosRect A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the position of the in-place object using the client coordinates of its parent window.
     * @param {Pointer<RECT>} lprcClipRect A pointer to the outer rectangle containing the in-place object's position rectangle (<i>lprcPosRect</i>). This rectangle is relative to the client area of the object's parent window.
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
     * The specified pointer is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory available for the operation.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleinplaceobject-setobjectrects
     */
    SetObjectRects(lprcPosRect, lprcClipRect) {
        result := ComCall(7, this, "ptr", lprcPosRect, "ptr", lprcClipRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Reactivates a previously deactivated object, undoing the last state of the object.
     * @remarks
     * If the user chooses the <b>Undo</b> command before the undo state of the object is lost, the object's immediate container calls <b>IOleInPlaceObject::ReactivateAndUndo</b> to activate the user interface, carry out the undo operation, and return the object to the active state.
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
     * <dt><b>E_NOTUNDOABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The undo state is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory available for the operation.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleinplaceobject-reactivateandundo
     */
    ReactivateAndUndo() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
