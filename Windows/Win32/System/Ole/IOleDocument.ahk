#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleDocumentView.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables a document object to communicate to containers its ability to create views of its data.
 * @see https://docs.microsoft.com/windows/win32/api//docobj/nn-docobj-ioledocument
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleDocument extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleDocument
     * @type {Guid}
     */
    static IID => Guid("{b722bcc5-4e68-101b-a2bc-00aa00404770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateView", "GetDocMiscStatus", "EnumViews"]

    /**
     * Creates a document view object in the caller's process and obtains a pointer to that object's IOleDocumentView interface.
     * @param {IOleInPlaceSite} pIPSite A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplacesite">IOleInPlaceSite</a> interface that represents the view site object to be associated with the new document view object. This parameter can be <b>NULL</b>, for example, when the view is contained in a new, uninitialized document object, in which case the caller must initialize the view with a subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setinplacesite">IOleDocumentView::SetInPlaceSite</a>.
     * @param {IStream} pstm A pointer to a stream containing data from which the new document view object should initialize itself. If <b>NULL</b>, the document object initializes the new document view object with a default state.
     * @param {Integer} dwReserved This parameter is reserved and must be zero.
     * @returns {IOleDocumentView} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-ioledocumentview">IOleDocumentView</a> pointer variable that receives the interface pointer to the new document view object. When successful, the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the <i>ppview</i> pointer when the view object is no longer needed.
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ioledocument-createview
     */
    CreateView(pIPSite, pstm, dwReserved) {
        result := ComCall(3, this, "ptr", pIPSite, "ptr", pstm, "uint", dwReserved, "ptr*", &ppView := 0, "HRESULT")
        return IOleDocumentView(ppView)
    }

    /**
     * Retrieves status information about the document object.
     * @returns {Integer} A pointer to the information on supported behaviors. Possible values are taken from the <a href="https://docs.microsoft.com/windows/win32/api/docobj/ne-docobj-docmisc">DOCMISC</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ioledocument-getdocmiscstatus
     */
    GetDocMiscStatus() {
        result := ComCall(4, this, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * Creates an object that enumerates the views supported by a document object, or if only one view is supported, returns a pointer to that view.
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
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ioledocument-enumviews
     */
    EnumViews(ppEnum, ppView) {
        result := ComCall(5, this, "ptr*", ppEnum, "ptr*", ppView, "HRESULT")
        return result
    }
}
