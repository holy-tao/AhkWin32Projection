#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IStream.ahk" { IStream }
#Import ".\IOleDocumentView.ahk" { IOleDocumentView }
#Import ".\IOleInPlaceSite.ahk" { IOleInPlaceSite }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumOleDocumentViews.ahk" { IEnumOleDocumentViews }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables a document object to communicate to containers its ability to create views of its data.
 * @see https://learn.microsoft.com/windows/win32/api/docobj/nn-docobj-ioledocument
 * @namespace Windows.Win32.System.Ole
 */
export default struct IOleDocument extends IUnknown {
    /**
     * The interface identifier for IOleDocument
     * @type {Guid}
     */
    static IID := Guid("{b722bcc5-4e68-101b-a2bc-00aa00404770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOleDocument interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateView       : IntPtr
        GetDocMiscStatus : IntPtr
        EnumViews        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOleDocument.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a document view object in the caller's process and obtains a pointer to that object's IOleDocumentView interface.
     * @remarks
     * A document object container's document site calls <b>CreateView</b> to instruct a document object to create a new view of itself in the container's process, either from default data or using the contents of an existing stream.
     * 
     * Calling <b>CreateView</b> does not cause the new view to display itself. To do so requires a call to either <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-show">IOleDocumentView::Show</a> or <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-uiactivate">IOleDocumentView::UIActivate</a>.
     * @param {IOleInPlaceSite} pIPSite A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplacesite">IOleInPlaceSite</a> interface that represents the view site object to be associated with the new document view object. This parameter can be <b>NULL</b>, for example, when the view is contained in a new, uninitialized document object, in which case the caller must initialize the view with a subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setinplacesite">IOleDocumentView::SetInPlaceSite</a>.
     * @param {IStream} pstm A pointer to a stream containing data from which the new document view object should initialize itself. If <b>NULL</b>, the document object initializes the new document view object with a default state.
     * @param {Integer} dwReserved This parameter is reserved and must be zero.
     * @returns {IOleDocumentView} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-ioledocumentview">IOleDocumentView</a> pointer variable that receives the interface pointer to the new document view object. When successful, the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the <i>ppview</i> pointer when the view object is no longer needed.
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ioledocument-createview
     */
    CreateView(pIPSite, pstm, dwReserved) {
        result := ComCall(3, this, "ptr", pIPSite, "ptr", pstm, "uint", dwReserved, "ptr*", &ppView := 0, "HRESULT")
        return IOleDocumentView(ppView)
    }

    /**
     * Retrieves status information about the document object.
     * @remarks
     * This method provides a way for containers to ascertain whether a document object supports multiple views, complex rectangles, opening in a pop-up window, or file read/write.
     * 
     * Values from this enumerator are also stored in the registry as the value of the DocObject key.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * By calling this method prior to activating a document object, containers can take whatever steps are necessary to support or otherwise accommodate the specified behaviors.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * This method must be completely implemented in any document object, even if the dereferenced value of <i>pdwStatus</i> is zero. E_NOTIMPL is not an acceptable return value. Normally, the returned <a href="https://docs.microsoft.com/windows/win32/api/docobj/ne-docobj-docmisc">DOCMISC</a> value should be hard-coded for performance.
     * @returns {Integer} A pointer to the information on supported behaviors. Possible values are taken from the <a href="https://docs.microsoft.com/windows/win32/api/docobj/ne-docobj-docmisc">DOCMISC</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ioledocument-getdocmiscstatus
     */
    GetDocMiscStatus() {
        result := ComCall(4, this, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * Creates an object that enumerates the views supported by a document object, or if only one view is supported, returns a pointer to that view.
     * @remarks
     * If a document object supports multiple views of its data, it must also implement <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-ienumoledocumentviews">IEnumOleDocumentViews</a> and pass that interface's pointer in the out parameter <i>ppEnum</i>. Using this pointer, the container can enumerate the views supported by the document object.
     * 
     * If the document object supports only a single view, <b>IOleDocument::EnumViews</b> passes that view's <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-ioledocumentview">IOleDocumentView</a> pointer in the out parameter <i>ppView</i>.
     * @param {Pointer<IEnumOleDocumentViews>} ppEnum A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-ienumoledocumentviews">IEnumOleDocumentViews</a> pointer variable that receives the interface pointer to the enumerator object.
     * @param {Pointer<IOleDocumentView>} ppView A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-ioledocumentview">IOleDocumentView</a> pointer variable that receives the interface pointer to a single view object.
     * @returns {HRESULT} This method returns S_OK if the object supports multiple views, then <i>ppEnum</i> contains a pointer to the enumerator object, and <i>ppView</i> is <b>NULL</b>. Otherwise, <i>ppEnum</i> is <b>NULL</b>, and <i>ppView</i> contains an interface pointer on the single view.
     * 
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory available for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address in <i>ppEnum</i> or <i>ppView</i> is invalid. The caller must pass valid pointers for both arguments.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ioledocument-enumviews
     */
    EnumViews(ppEnum, ppView) {
        result := ComCall(5, this, IEnumOleDocumentViews.Ptr, ppEnum, IOleDocumentView.Ptr, ppView, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOleDocument.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateView := CallbackCreate(GetMethod(implObj, "CreateView"), flags, 5)
        this.vtbl.GetDocMiscStatus := CallbackCreate(GetMethod(implObj, "GetDocMiscStatus"), flags, 2)
        this.vtbl.EnumViews := CallbackCreate(GetMethod(implObj, "EnumViews"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateView)
        CallbackFree(this.vtbl.GetDocMiscStatus)
        CallbackFree(this.vtbl.EnumViews)
    }
}
