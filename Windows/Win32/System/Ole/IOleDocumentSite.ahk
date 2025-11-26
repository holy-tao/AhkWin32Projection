#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables a document that has been implemented as a document object to bypass the normal activation sequence for in-place-active objects and to directly instruct its client site to activate it as a document object.
 * @see https://docs.microsoft.com/windows/win32/api//docobj/nn-docobj-ioledocumentsite
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
     * @param {IOleDocumentView} pViewToActivate A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-ioledocumentview">IOleDocumentView</a> interface pointer that represents the document view to be used in activating the document object. This parameter can be <b>NULL</b>, in which case the container should call <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocument-createview">IOleDocument::CreateView</a> to obtain a document view pointer.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//docobj/nf-docobj-ioledocumentsite-activateme
     */
    ActivateMe(pViewToActivate) {
        result := ComCall(3, this, "ptr", pViewToActivate, "HRESULT")
        return result
    }
}
