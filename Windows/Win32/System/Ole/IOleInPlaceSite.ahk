#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\OLEINPLACEFRAMEINFO.ahk" { OLEINPLACEFRAMEINFO }
#Import ".\IOleInPlaceUIWindow.ahk" { IOleInPlaceUIWindow }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IOleWindow.ahk" { IOleWindow }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import ".\IOleInPlaceFrame.ahk" { IOleInPlaceFrame }

/**
 * Manages the interaction between the container and the object's in-place client site. Recall that the client site is the display site for embedded objects, and provides position and conceptual information about the object.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-ioleinplacesite
 * @namespace Windows.Win32.System.Ole
 */
export default struct IOleInPlaceSite extends IOleWindow {
    /**
     * The interface identifier for IOleInPlaceSite
     * @type {Guid}
     */
    static IID := Guid("{00000119-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOleInPlaceSite interfaces
    */
    struct Vtbl extends IOleWindow.Vtbl {
        CanInPlaceActivate  : IntPtr
        OnInPlaceActivate   : IntPtr
        OnUIActivate        : IntPtr
        GetWindowContext    : IntPtr
        Scroll              : IntPtr
        OnUIDeactivate      : IntPtr
        OnInPlaceDeactivate : IntPtr
        DiscardUndoState    : IntPtr
        DeactivateAndUndo   : IntPtr
        OnPosRectChange     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOleInPlaceSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether the container can activate the object in place.
     * @remarks
     * Only objects being displayed as DVASPECT_CONTENT can be activated in place.
     * 
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * <b>CanInPlaceActivate</b> is called by the client site's immediate child object when this object must activate in place. This function allows the container application to accept or refuse the activation request.
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
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-caninplaceactivate
     */
    CanInPlaceActivate() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Notifies the container that one of its objects is being activated in place.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * <b>OnInPlaceActivate</b> is called by the active embedded object when it is activated in-place for the first time. The container should note that the object is becoming active.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * A container that supports linking to embedded objects must properly manage the running of its in-place objects when they are UI-inactive and running in the hidden state. To reactivate the in-place object quickly, a container should not call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-close">IOleObject::Close</a> until the container's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplacesite-deactivateandundo">IOleInPlaceSite::DeactivateAndUndo</a> method is called. To help protect against the object being left in an unstable state if a linking client updates silently, the container should call <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olelockrunning">OleLockRunning</a> to lock the object in the running state. This prevents the hidden in-place object from shutting down before it can be saved in its container.
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
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-oninplaceactivate
     */
    OnInPlaceActivate() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Notifies the container that the object is about to be activated in place and that the object is going to replace the container's main menu with an in-place composite menu.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The in-place object calls <b>IOleInPlaceSite::OnUIActivate</b> just before activating its user interface.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The container should remove any user interface associated with its own activation. If the container is itself an embedded object, it should remove its document-level user interface.
     * 
     * If there is already an object active in place in the same document, the container should call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceobject-uideactivate">IOleInPlaceObject::UIDeactivate</a> before calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplacesite-onuideactivate">OnUIDeactivate</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-onuiactivate
     */
    OnUIActivate() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Enables an in-place object to retrieve the window interfaces that form the window object hierarchy, and the position in the parent window where the object's in-place activation window should be located.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/win32/api/oleidl/ns-oleidl-oleinplaceframeinfo">OLEINPLACEFRAMEINFO</a> structure provides data needed by OLE to dispatch keystroke accelerators to a container frame while an object is active in place.
     * 
     * When an object is activated, it calls <b>GetWindowContext</b> from its container. The container returns the handle to its in-place accelerator table through the <a href="https://docs.microsoft.com/windows/win32/api/oleidl/ns-oleidl-oleinplaceframeinfo">OLEINPLACEFRAMEINFO</a> structure. Before calling <b>GetWindowContext</b>, the object must provide the size of the <b>OLEINPLACEFRAMEINFO</b> structure by filling in the cb member, pointed to by <i>lpFrameInfo</i>.
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
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-getwindowcontext
     */
    GetWindowContext(ppFrame, ppDoc, lprcPosRect, lprcClipRect, lpFrameInfo) {
        result := ComCall(8, this, IOleInPlaceFrame.Ptr, ppFrame, IOleInPlaceUIWindow.Ptr, ppDoc, RECT.Ptr, lprcPosRect, RECT.Ptr, lprcClipRect, OLEINPLACEFRAMEINFO.Ptr, lpFrameInfo, "HRESULT")
        return result
    }

    /**
     * Instructs the container to scroll the view of the object by the specified number of pixels.
     * @remarks
     * As a result of scrolling, the object's visible rectangle can change. If that happens, the container should give the new clipping rectangle to the object by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceobject-setobjectrects">IOleInPlaceObject::SetObjectRects</a>. The intersection of the <i>lprcClipRect</i> and <i>lprcPosRect</i> rectangles gives the new visible rectangle. See <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplacesite-getwindowcontext">IOleInPlaceSite::GetWindowContext</a> for more information.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Called by an active, in-place object when it is asking the container to scroll.
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
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-scroll
     */
    Scroll(scrollExtant) {
        result := ComCall(9, this, SIZE, scrollExtant, "HRESULT")
        return result
    }

    /**
     * Notifies the container that it should reinstall its user interface and take focus, and whether the object has an undoable state.
     * @remarks
     * The object indicates whether it can undo changes through the <i>fUndoable</i> flag. If the object can undo changes, the container can (by the user invoking the <b>Edit Undo</b> command) call the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceobject-reactivateandundo">IOleInPlaceObject::ReactivateAndUndo</a> method to undo the changes.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * <b>IOleInPlaceSite::OnUIDeactivate</b> is called by the site's immediate child object when it is deactivating to notify the container that it should reinstall its own user interface components and take focus. The container should wait for the call to <b>IOleInPlaceSite::OnUIDeactivate</b> to complete before fully cleaning up and destroying any composite submenus.
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
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-onuideactivate
     */
    OnUIDeactivate(fUndoable) {
        result := ComCall(10, this, BOOL, fUndoable, "HRESULT")
        return result
    }

    /**
     * Notifies the container that the object is no longer active in place.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * <b>OnInPlaceDeactivate</b> is called by an in-place object when it is fully deactivated. This function notifies the container that the object has been deactivated, and it gives the container a chance to run code pertinent to the object's deactivation. In particular, <b>OnInPlaceDeactivate</b> is called as a result of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceobject-inplacedeactivate">IOleInPlaceObject::InPlaceDeactivate</a> being called. Calling <b>OnInPlaceDeactivate</b> indicates that the object can no longer support Undo.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If the container is holding pointers to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplaceobject">IOleInPlaceObject</a> and <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplaceactiveobject">IOleInPlaceActiveObject</a> interface implementations, it should release them after the <b>OnInPlaceDeactivate</b> call.
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
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-oninplacedeactivate
     */
    OnInPlaceDeactivate() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Instructs the container to discard its undo state. The container should not call IOleInPlaceObject::ReActivateAndUndo.
     * @remarks
     * If an object is activated in place and the object's associated object application maintains only one level of undo, there is no need to have more than one entry on the undo stack. That is, after a change has been made to the active object that invalidates its undo state saved by the container, there is no need to maintain this undo state in the container.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * <b>DiscardUndoState</b> is called by the active object while performing some action that would discard the undo state of the object. The in-place object calls this method to notify the container to discard the object's last saved undo state.
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
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-discardundostate
     */
    DiscardUndoState() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Deactivates the object, ends the in-place session, and reverts to the container's saved undo state.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Called by the active object when the user invokes undo just after activating the object.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Upon completion of this call, the container should call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceobject-uideactivate">IOleInPlaceObject::UIDeactivate</a> to remove the user interface for the object, activate itself, and undo.
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
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-deactivateandundo
     */
    DeactivateAndUndo() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Notifies the container that the object extents have changed.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The <b>OnPosRectChange</b> method is called by the in-place object.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * When the in-place object calls <b>OnPosRectChange</b>, the container must call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceobject-setobjectrects">IOleInPlaceObject::SetObjectRects</a> to specify the new position of the in-place window and the clipping rectangle. Only then does the object resize its window.
     * 
     * In most cases, the object grows to the right and/or down. There could be cases where the object grows to the left and/or up, as conveyed through <i>lprcPosRect</i>. It is also possible to change the object's position without changing its size.
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
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-onposrectchange
     */
    OnPosRectChange(lprcPosRect) {
        result := ComCall(14, this, RECT.Ptr, lprcPosRect, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOleInPlaceSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CanInPlaceActivate := CallbackCreate(GetMethod(implObj, "CanInPlaceActivate"), flags, 1)
        this.vtbl.OnInPlaceActivate := CallbackCreate(GetMethod(implObj, "OnInPlaceActivate"), flags, 1)
        this.vtbl.OnUIActivate := CallbackCreate(GetMethod(implObj, "OnUIActivate"), flags, 1)
        this.vtbl.GetWindowContext := CallbackCreate(GetMethod(implObj, "GetWindowContext"), flags, 6)
        this.vtbl.Scroll := CallbackCreate(GetMethod(implObj, "Scroll"), flags, 2)
        this.vtbl.OnUIDeactivate := CallbackCreate(GetMethod(implObj, "OnUIDeactivate"), flags, 2)
        this.vtbl.OnInPlaceDeactivate := CallbackCreate(GetMethod(implObj, "OnInPlaceDeactivate"), flags, 1)
        this.vtbl.DiscardUndoState := CallbackCreate(GetMethod(implObj, "DiscardUndoState"), flags, 1)
        this.vtbl.DeactivateAndUndo := CallbackCreate(GetMethod(implObj, "DeactivateAndUndo"), flags, 1)
        this.vtbl.OnPosRectChange := CallbackCreate(GetMethod(implObj, "OnPosRectChange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CanInPlaceActivate)
        CallbackFree(this.vtbl.OnInPlaceActivate)
        CallbackFree(this.vtbl.OnUIActivate)
        CallbackFree(this.vtbl.GetWindowContext)
        CallbackFree(this.vtbl.Scroll)
        CallbackFree(this.vtbl.OnUIDeactivate)
        CallbackFree(this.vtbl.OnInPlaceDeactivate)
        CallbackFree(this.vtbl.DiscardUndoState)
        CallbackFree(this.vtbl.DeactivateAndUndo)
        CallbackFree(this.vtbl.OnPosRectChange)
    }
}
