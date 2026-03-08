#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables a document that has been implemented as a document object to bypass the normal activation sequence for in-place-active objects and to directly instruct its client site to activate it as a document object.
 * @see https://learn.microsoft.com/windows/win32/api/docobj/nn-docobj-ioledocumentsite
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleDocumentSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleDocumentSite
     * @type {Guid}
     */
    static IID => Guid("{b722bcc7-4e68-101b-a2bc-00aa00404770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ActivateMe"]

    /**
     * Asks a document site to activate the document making the call as a document object rather than an in-place-active object and, optionally, specifies which view of the object document to activate.
     * @remarks
     * When a container calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-doverb">IOleObject::DoVerb</a> to activate a document, a document object bypasses the usual in-place activation sequence by calling <b>IOleDocumentSite::ActivateMe</b>.
     * 
     * When calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-doverb">IOleObject::DoVerb</a> on a document object, the most appropriate activation verb is usually OLEIVERB_SHOW. Other allowable verbs include OLEIVERB_PRIMARY and OLEIVERB_UIACTIVATE. OLEIVERB_OPEN is discouraged because it means opening an embedded object in a separate window, which is contrary to the intent of document object activation.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Only document objects should call this method. A normal in-place active document should respond to a container's call to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-doverb">IOleObject::DoVerb</a> by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplacesite">IOleInPlaceSite</a>.
     * 
     * A document object should initiate its activation by calling <b>IOleDocumentSite::ActivateMe</b>. If the container does not implement <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-ioledocumentsite">IOleDocumentSite</a>, then the document should default to the normal in-place activation sequence.
     * 
     * A document object that supports more than one view of its data can specify which view to activate by passing a pointer to that view's <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-ioledocumentview">IOleDocumentView</a> interface in <i>pViewToActivate</i>.
     * 
     * However the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-ioledocumentview">IOleDocumentView</a> pointer is obtained, the container should release the pointer when it is no longer needed.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * This function must be completely implemented in a document object container; E_NOTIMPL is not an acceptable return value.
     * 
     * If a document object passes an <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-ioledocumentview">IOleDocumentView</a> pointer in <i>pViewToActivate</i>, the container's implementation of <b>IOleDocumentSite::ActivateMe</b> should call <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setinplacesite">IOleDocumentView::SetInPlaceSite</a> and pass a pointer to its <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplacesite">IOleInPlaceSite</a> interface back to the view object. If the container is holding onto the <b>IOleDocumentView</b> pointer, which will normally be the case, it should follow the call to <b>IOleDocumentView::SetInPlaceSite</b> with a call to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a>.
     * 
     * 
     * 
     * If <i>pViewToActivate</i> is <b>NULL</b>, the container can obtain a pointer to a document view by querying the document for <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-ioledocument">IOleDocument</a>, then calling <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocument-createview">IOleDocument::CreateView</a> and passing its <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplacesite">IOleInPlaceSite</a> pointer.
     * @param {IOleDocumentView} pViewToActivate A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-ioledocumentview">IOleDocumentView</a> interface pointer that represents the document view to be used in activating the document object. This parameter can be <b>NULL</b>, in which case the container should call <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocument-createview">IOleDocument::CreateView</a> to obtain a document view pointer.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ioledocumentsite-activateme
     */
    ActivateMe(pViewToActivate) {
        result := ComCall(3, this, "ptr", pViewToActivate, "HRESULT")
        return result
    }
}
