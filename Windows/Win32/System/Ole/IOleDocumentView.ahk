#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleInPlaceSite.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\IOleDocumentView.ahk

/**
 * The IOleDocumentView interface enables a container to communicate with each view supported by a document object.
 * @see https://learn.microsoft.com/windows/win32/api//content/docobj/nn-docobj-ioledocumentview
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
     * @remarks
     * As part of activating a document object, a container must pass the object a pointer to the container's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplacesite">IOleInPlaceSite</a>. This pointer designates the document view site that is to be associated with the view on which this method is called.
     * 
     * A container normally passes this pointer in response to a document's request to be activated. A document makes such a request by calling <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentsite-activateme">IOleDocumentSite::ActivateMe</a> and passing the container a pointer to the view to be activated. The container, in turn, uses this pointer to call <b>IOleDocumentView::SetInPlaceSite</b>.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * If the container is requesting creation and activation of a new instance of a document object, rather than merely the activation of a loaded instance of a document object, the view site is passed in the <i>pIPSite</i> argument of <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocument-createview">IOleDocument::CreateView</a>. Therefore, an explicit call to <b>IOleDocumentView::SetInPlaceSite</b> is unnecessary.
     * 
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If this method is called on a view that is already associated with a view site, the view must do some housekeeping in preparation for activating itself in the new site. First, the view must deactivate itself in the current site and release its pointer to that site. Next, if the new <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplacesite">IOleInPlaceSite</a> pointer is not <b>NULL</b>, the view should both save the pointer and call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> on it. The view should then wait for the container to tell it when to activate itself in the new view site.
     * 
     * A document view must implement this method completely; E_NOTIMPL is not an acceptable return value.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/docobj/nf-docobj-ioledocumentview-setinplacesite
     */
    SetInPlaceSite(pIPSite) {
        result := ComCall(3, this, "ptr", pIPSite, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the view site associated with this view object.
     * @remarks
     * <b>IOleDocumentView::GetInPlaceSite</b> obtains the most recent <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplacesite">IOleInPlaceSite</a> pointer passed by <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setinplacesite">IOleDocumentView::SetInPlaceSite</a>, or <b>NULL</b> if <b>IOleDocumentView::SetInPlaceSite</b> has not yet been called. If this pointer is not <b>NULL</b>, this method will call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> on the pointer. The caller is responsible for releasing it. A document view must implement this method completely; E_NOTIMPL is not an acceptable return value.
     * @returns {IOleInPlaceSite} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplacesite">IOleInPlaceSite</a> pointer variable that receives the interface pointer to the document's view site.
     * @see https://learn.microsoft.com/windows/win32/api//content/docobj/nf-docobj-ioledocumentview-getinplacesite
     */
    GetInPlaceSite() {
        result := ComCall(4, this, "ptr*", &ppIPSite := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOleInPlaceSite(ppIPSite)
    }

    /**
     * Obtains the IUnknown interface pointer on the document object that owns this view.
     * @remarks
     * The caller is responsible for incrementing the reference count on the interface pointer obtained by this method. The caller must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on this pointer when it is no longer needed.
     * 
     * Because a view object must always be contained or aggregated in a document object, this method will always succeed. Before returning, this method should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> on the pointer stored in <i>ppunk</i>.
     * @returns {IUnknown} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer that receives a pointer to the document object that owns this view.
     * @see https://learn.microsoft.com/windows/win32/api//content/docobj/nf-docobj-ioledocumentview-getdocument
     */
    GetDocument() {
        result := ComCall(5, this, "ptr*", &ppunk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppunk)
    }

    /**
     * Sets the rectangular coordinates of the viewport in which the view is to be activated or resets the coordinates of the viewport in which a view is currently activated.
     * @remarks
     * For a single document interface (SDI) application, the viewport is the client area of the frame window minus the space allocated for toolbars, status bar, and such. For a multiple document interface (MDI) window, the viewport is the client area of the MDI document window minus any other frame-level user-interface elements.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Calling <b>IOleDocumentView::SetRect</b> or <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setrectcomplex">IOleDocumentView::SetRectComplex</a> is part of the normal activation sequence for document objects, usually following a call to <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-uiactivate">IOleDocumentView::UIActivate</a> and preceding a call to <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-show">IOleDocumentView::Show</a>.
     * 
     * Whenever the window used to display a document object is resized, the container should call <b>IOleDocumentView::SetRect</b> (or <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setrectcomplex">IOleDocumentView::SetRectComplex</a>) to tell the document view object to resize itself to the new window dimensions.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The coordinates of the viewport are within the coordinates of the view window, which is obtained through <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolewindow-getwindow">IOleWindow::GetWindow</a>. The view must resize itself to fit the new coordinates passed in <i>prcView</i>.
     * 
     * This method is defined with the [input_sync] attribute, which means that the view object cannot yield or make another, non input_sync RPC call while executing this method.
     * 
     * A document view must implement this method completely; E_NOTIMPL is not an acceptable return value.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/docobj/nf-docobj-ioledocumentview-setrect
     */
    SetRect(prcView) {
        result := ComCall(6, this, "ptr", prcView, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the rectangular coordinates of the viewport in which the view is or will be activated.
     * @remarks
     * For a single document interface (SDI) application, the viewport is the client area of the frame window minus the space allocated for toolbars, status bar, and such. For a multiple document interface (MDI) window, the viewport is the client area of the MDI document window minus any other frame-level user-interface elements.
     * 
     * The viewport coordinates obtained by this method are those set in the most recent call to either <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setrect">IOleDocumentView::SetRect</a> or <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setrectcomplex">IOleDocumentView::SetRectComplex</a>.
     * 
     * A document view must implement this method completely; E_NOTIMPL is not an acceptable return value.
     * @returns {RECT} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure to contain the coordinates of the current viewport set with <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setrect">IOleDocumentView::SetRect</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/docobj/nf-docobj-ioledocumentview-getrect
     */
    GetRect() {
        prcView := RECT()
        result := ComCall(7, this, "ptr", prcView, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return prcView
    }

    /**
     * Sets the rectangular coordinates of the viewport, scroll bars, and size box.
     * @remarks
     * View frames that support a workbook metaphor, in which a single document comprises multiple sheets or pages, typically call this method to set the coordinates to be used in common by all the sheets or pages.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Calling <b>IOleDocumentView::SetRectComplex</b> is part of the normal activation sequence for document objects that support complex rectangles, usually following a call to <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-uiactivate">IOleDocumentView::UIActivate</a> and preceding a call to <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-show">IOleDocumentView::Show</a>.
     * 
     * Whenever the window used to display a document object is resized, the container should call <b>IOleDocumentView::SetRectComplex</b> or <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setrect">IOleDocumentView::SetRect</a> to tell the view object to resize itself to the new window dimensions.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Document objects that support complex rectangles mark themselves with <a href="https://docs.microsoft.com/windows/win32/api/docobj/ne-docobj-docmisc">DOCMISC</a>_SUPPORTCOMPLEXRECTANGLES, as described in <b>DOCMISC</b> and <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocument-getdocmiscstatus">IOleDocument::GetDocMiscStatus</a>. Document objects that do not support this method can return E_NOTIMPL.
     * 
     * Upon receiving a call to this method, a view should resize itself to fit the coordinates specified in prcView and fit its scrollbars and size box to the areas described in <i>prcHScroll</i>, <i>prcVScroll</i>, and <i>prcSizeBox</i>.
     * 
     * This method is defined with the [input_sync] attribute, which means that the implementing object cannot yield or make another, non input_sync RPC call while executing this method.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/docobj/nf-docobj-ioledocumentview-setrectcomplex
     */
    SetRectComplex(prcView, prcHScroll, prcVScroll, prcSizeBox) {
        result := ComCall(8, this, "ptr", prcView, "ptr", prcHScroll, "ptr", prcVScroll, "ptr", prcSizeBox, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Activates or deactivates a view.
     * @remarks
     * Calling <b>Show</b> is the last step in the activation sequence, because before showing itself a document object must know exactly what space it occupies and have all its tools available.
     * 
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * A call to this method for the purpose of activating a view should follow calls to <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setinplacesite">IOleDocumentView::SetInPlaceSite</a>, <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-uiactivate">IOleDocumentView::UIActivate</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setrect">IOleDocumentView::SetRect</a> (or <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setrectcomplex">IOleDocumentView::SetRectComplex</a>).
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Implementations of this method should embody the following pseudocode.
     * 
     * 
     * ``` syntax
     * if (fShow)
     *     {
     *     In-place activate the view but do not UI activate it.
     *     Show the view window. 
     *     }
     * else
     *     {
     *     Call IOleDocumentView::UIActivate(FALSE) on this view
     *     Hide the view window
     *     }
     * ```
     * 
     * All views of a document object must at least support in-place activation; E_NOTIMPL is not an acceptable value.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/docobj/nf-docobj-ioledocumentview-show
     */
    Show(fShow) {
        result := ComCall(9, this, "int", fShow, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Activates or deactivates a document view's user interface elements, such as menus, toolbars, and accelerators.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Calling this method before calling <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setinplacesite">IOleDocumentView::SetInPlaceSite</a> returns E_UNEXPECTED, because the view must be associated with a view site before it can activate itself.
     * 
     * When <b>IOleDocumentView::UIActivate</b> is called as part of the activation sequence, the call should precede a call to <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setrect">IOleDocumentView::SetRect</a> or <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setrectcomplex">IOleDocumentView::SetRectComplex</a>, because otherwise the view dimensions would not account for toolbar space.
     * 
     * To deactivate a view, the container should call <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-show">IOleDocumentView::Show</a> with <b>FALSE</b>, followed by <b>IOleDocumentView::UIActivate</b> with <b>FALSE</b>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Implementations of this method should embody the following pseudocode.
     * 
     * 
     * ``` syntax
     * if (fActivate)
     *     {
     *     UI activate the view (do menu merging, show frame level tools, process accelerators)
     *     Take focus, and bring the view window forward.
     *     }
     * else
     *     call IOleInPlaceObject::UIDeactivate on this view
     * ```
     * 
     * In addition, the view can and should participate in extended <b>Help</b> menu merging.
     * 
     * All views of a document object must support in-place activation. E_NOTIMPL is not an acceptable return value.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/docobj/nf-docobj-ioledocumentview-uiactivate
     */
    UIActivate(fUIActivate) {
        result := ComCall(10, this, "int", fUIActivate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Displays a document view in a separate pop-up window. The semantics are equivalent to IOleObject::DoVerb with OLEIVERB_OPEN.
     * @remarks
     * A user viewing a document object in a container application such as a browser or "binder" may want to see two or more views or documents at once. Because the browser displays only one view at a time, the container needs a way to ask the other views or documents to display themselves, as required, in separate windows. The <b>IOleDocumentView::Open</b> method provides that way.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * A successful call to <b>IOleDocumentView::Open</b> should be followed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-show">IOleDocumentView::Show</a> to hide the window or to show the window and bring it to the foreground. While the view is active in its separate window, a container can show or hide the window as many times as it may require.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * A document object indicates that it does not support activation in a separate window by setting the <a href="https://docs.microsoft.com/windows/win32/api/docobj/ne-docobj-docmisc">DOCMISC</a>_CANTOPENEDIT status flag and returning E_NOTIMPL to containers that call this method.
     * 
     * Implementation consists mainly of the view object calling its own <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceobject-inplacedeactivate">IOleInPlaceObject::InPlaceDeactivate</a> method, which leaves the document object in a running state but without in-place activation. The document object's user interface is not visible until the container calls <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-show">IOleDocumentView::Show</a> (see Notes to Callers above).
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
     * @see https://learn.microsoft.com/windows/win32/api//content/docobj/nf-docobj-ioledocumentview-open
     */
    Open() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Instructs a document view to close itself and release its IOleInPlaceSite pointer.
     * @remarks
     * When a separate window is no longer needed, the container calls <b>IOleDocumentView::CloseView</b>, whereupon the view releases its site pointer to the separate window and destroys the window. Unlike the normal in-place deactivation sequence for active documents, a document view continues to hold the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplacesite">IOleInPlaceSite</a> pointer. This pointer is released only when the view's container calls <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setinplacesite">SetInPlaceSite</a>, with <i>pIPSite</i> set to <b>NULL</b>, or calls <b>IOleDocumentView::CloseView</b>.
     * 
     * When a user closes a view's separate window, the view should not shut itself down. Instead, it should call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplacesite-oninplaceactivate">IOleInPlaceSite::OnInPlaceActivate</a>. The view site then decides whether to call <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-uiactivate">IOleDocumentView::UIActivate</a> with <b>FALSE</b> immediately or later. In this way, a document view displayed in a separate window remains available for activation in the container's own window.
     * 
     * The container must call this method before it deletes the view, that is, releases its last reference to the view. In general, implementation of this method will call <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-show">IOleDocumentView::Show</a> with <b>FALSE</b> to hide the view if it is not already hidden, then call <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setinplacesite">SetInPlaceSite</a> with <b>NULL</b> to deactivate itself and release the view site pointer.
     * 
     * Because <b>IOleDocumentView::CloseView</b> is called when a container is going to completely shut down a view, this method must be implemented and has no reason to fail.
     * @param {Integer} dwReserved This parameter is reserved and cannot be <b>NULL</b>.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api//content/docobj/nf-docobj-ioledocumentview-closeview
     */
    CloseView(dwReserved) {
        result := ComCall(12, this, "uint", dwReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Saves the view state into the specified stream.
     * @remarks
     * The view's state includes properties such as the view type, zoom factor, and location of insertion point. The container typically calls this function before deactivating the view. The stream can then later be used to reinitialize a view of the same document to this saved state through <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-applyviewstate">IOleDocumentView::ApplyViewState</a>.
     * 
     * According to the rules governing <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststream">IPersistStream</a>, a view must write its CLSID as the first element in the stream. Any cross-platform file format compatibility issues that apply to the document's storage representation also apply to this context.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/docobj/nf-docobj-ioledocumentview-saveviewstate
     */
    SaveViewState(pstm) {
        result := ComCall(13, this, "ptr", pstm, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a view with view state previously saved in call to IOleDocumentView::SaveViewState.
     * @remarks
     * Typically, this function is called after an existing view has been created in the container but before that view has been displayed. It is the responsibility of the view to validate the data in the view stream; the container does not attempt to interpret the view's state data.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/docobj/nf-docobj-ioledocumentview-applyviewstate
     */
    ApplyViewState(pstm) {
        result := ComCall(14, this, "ptr", pstm, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a duplicate view object with an internal state identical to that of the current view.
     * @remarks
     * This method is useful for creating a new view with a different viewport and view site but with the same view context as the view being cloned. Typically, containers hosting an MDI application will call this method to provide "Window/New window" capability.
     * @param {IOleInPlaceSite} pIPSiteNew A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplacesite">IOleInPlaceSite</a> interface that represents the view site in which the new view object will be activated. On receiving this pointer, the view being cloned should pass it to the new view's <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setinplacesite">IOleDocumentView::SetInPlaceSite</a> method. This pointer can be <b>NULL</b>, in which case the caller is responsible for calling <b>IOleDocumentView::SetInPlaceSite</b> on the new view directly.
     * @returns {IOleDocumentView} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-ioledocumentview">IOleDocumentView</a> pointer variable that receives the interface pointer to the new view object. The caller is responsible for releasing <i>ppViewNew</i> when it is no longer needed.
     * @see https://learn.microsoft.com/windows/win32/api//content/docobj/nf-docobj-ioledocumentview-clone
     */
    Clone(pIPSiteNew) {
        result := ComCall(15, this, "ptr", pIPSiteNew, "ptr*", &ppViewNew := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOleDocumentView(ppViewNew)
    }
}
