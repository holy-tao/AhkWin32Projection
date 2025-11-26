#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleInPlaceSite.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\IOleDocumentView.ahk

/**
 * The IOleDocumentView interface enables a container to communicate with each view supported by a document object.
 * @see https://docs.microsoft.com/windows/win32/api//docobj/nn-docobj-ioledocumentview
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleDocumentView extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleDocumentView
     * @type {Guid}
     */
    static IID => Guid("{b722bcc6-4e68-101b-a2bc-00aa00404770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetInPlaceSite", "GetInPlaceSite", "GetDocument", "SetRect", "GetRect", "SetRectComplex", "Show", "UIActivate", "Open", "CloseView", "SaveViewState", "ApplyViewState", "Clone"]

    /**
     * Associates a container's document view site with a document's view object.
     * @param {IOleInPlaceSite} pIPSite A pointer to the document view site's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplacesite">IOleInPlaceSite</a> interface. This parameter can be <b>NULL</b>, in which case the document view object loses all asociation with the container.
     * @returns {HRESULT} This method returns S_OK if a document view site was successfully associated (or disassociated if <i>pIPSite</i> is <b>NULL</b>) with a document view object. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ioledocumentview-setinplacesite
     */
    SetInPlaceSite(pIPSite) {
        result := ComCall(3, this, "ptr", pIPSite, "HRESULT")
        return result
    }

    /**
     * Retrieves the view site associated with this view object.
     * @returns {IOleInPlaceSite} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplacesite">IOleInPlaceSite</a> pointer variable that receives the interface pointer to the document's view site.
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ioledocumentview-getinplacesite
     */
    GetInPlaceSite() {
        result := ComCall(4, this, "ptr*", &ppIPSite := 0, "HRESULT")
        return IOleInPlaceSite(ppIPSite)
    }

    /**
     * Obtains the IUnknown interface pointer on the document object that owns this view.
     * @returns {IUnknown} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer that receives a pointer to the document object that owns this view.
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ioledocumentview-getdocument
     */
    GetDocument() {
        result := ComCall(5, this, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * Sets the rectangular coordinates of the viewport in which the view is to be activated or resets the coordinates of the viewport in which a view is currently activated.
     * @param {Pointer<RECT>} prcView A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the coordinates of the viewport.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ioledocumentview-setrect
     */
    SetRect(prcView) {
        result := ComCall(6, this, "ptr", prcView, "HRESULT")
        return result
    }

    /**
     * Retrieves the rectangular coordinates of the viewport in which the view is or will be activated.
     * @returns {RECT} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure to contain the coordinates of the current viewport set with <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setrect">IOleDocumentView::SetRect</a>.
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ioledocumentview-getrect
     */
    GetRect() {
        prcView := RECT()
        result := ComCall(7, this, "ptr", prcView, "HRESULT")
        return prcView
    }

    /**
     * Sets the rectangular coordinates of the viewport, scroll bars, and size box.
     * @param {Pointer<RECT>} prcView A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the coordinates of the viewport.
     * @param {Pointer<RECT>} prcHScroll A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the coordinates of the horizontal scroll bar.
     * @param {Pointer<RECT>} prcVScroll A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the coordinates of the vertical scroll bar.
     * @param {Pointer<RECT>} prcSizeBox A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the coordinates of the size box.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The document object that owns this view does not support complex rectangles.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ioledocumentview-setrectcomplex
     */
    SetRectComplex(prcView, prcHScroll, prcVScroll, prcSizeBox) {
        result := ComCall(8, this, "ptr", prcView, "ptr", prcHScroll, "ptr", prcVScroll, "ptr", prcSizeBox, "HRESULT")
        return result
    }

    /**
     * Activates or deactivates a view.
     * @param {BOOL} fShow If <b>TRUE</b>, the view is to show itself. If <b>FALSE</b>, the view is to hide itself.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory available for operation.
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
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ioledocumentview-show
     */
    Show(fShow) {
        result := ComCall(9, this, "int", fShow, "HRESULT")
        return result
    }

    /**
     * Activates or deactivates a document view's user interface elements, such as menus, toolbars, and accelerators.
     * @param {BOOL} fUIActivate If <b>TRUE</b>, the view is to activate its user interface. If <b>FALSE</b>, the view is to deactivate its user interface.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory available for operation.
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
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ioledocumentview-uiactivate
     */
    UIActivate(fUIActivate) {
        result := ComCall(10, this, "int", fUIActivate, "HRESULT")
        return result
    }

    /**
     * Displays a document view in a separate pop-up window. The semantics are equivalent to IOleObject::DoVerb with OLEIVERB_OPEN.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory  available for the operation.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The document object that owns this view does not support separate window activation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ioledocumentview-open
     */
    Open() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Instructs a document view to close itself and release its IOleInPlaceSite pointer.
     * @param {Integer} dwReserved This parameter is reserved and cannot be <b>NULL</b>.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ioledocumentview-closeview
     */
    CloseView(dwReserved) {
        result := ComCall(12, this, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * Saves the view state into the specified stream.
     * @param {IStream} pstm A pointer to the stream in which the view is to save its state data.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value in pstm is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This view has no meaningful state to save. This error should be rare because most views have at least some state information worth saving.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ioledocumentview-saveviewstate
     */
    SaveViewState(pstm) {
        result := ComCall(13, this, "ptr", pstm, "HRESULT")
        return result
    }

    /**
     * Initializes a view with view state previously saved in call to IOleDocumentView::SaveViewState.
     * @param {IStream} pstm A pointer to a stream containing data from which the view should initialize itself.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value in <i>pstm</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This view has no meaningful state to load. This error should be rare because most views will have at least some state information worth loading.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ioledocumentview-applyviewstate
     */
    ApplyViewState(pstm) {
        result := ComCall(14, this, "ptr", pstm, "HRESULT")
        return result
    }

    /**
     * Creates a duplicate view object with an internal state identical to that of the current view.
     * @param {IOleInPlaceSite} pIPSiteNew A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplacesite">IOleInPlaceSite</a> interface that represents the view site in which the new view object will be activated. On receiving this pointer, the view being cloned should pass it to the new view's <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setinplacesite">IOleDocumentView::SetInPlaceSite</a> method. This pointer can be <b>NULL</b>, in which case the caller is responsible for calling <b>IOleDocumentView::SetInPlaceSite</b> on the new view directly.
     * @returns {IOleDocumentView} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-ioledocumentview">IOleDocumentView</a> pointer variable that receives the interface pointer to the new view object. The caller is responsible for releasing <i>ppViewNew</i> when it is no longer needed.
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ioledocumentview-clone
     */
    Clone(pIPSiteNew) {
        result := ComCall(15, this, "ptr", pIPSiteNew, "ptr*", &ppViewNew := 0, "HRESULT")
        return IOleDocumentView(ppViewNew)
    }
}
