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
     * 
     * @param {IOleInPlaceSite} pIPSite 
     * @param {IStream} pstm 
     * @param {Integer} dwReserved 
     * @returns {IOleDocumentView} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ioledocument-createview
     */
    CreateView(pIPSite, pstm, dwReserved) {
        result := ComCall(3, this, "ptr", pIPSite, "ptr", pstm, "uint", dwReserved, "ptr*", &ppView := 0, "HRESULT")
        return IOleDocumentView(ppView)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ioledocument-getdocmiscstatus
     */
    GetDocMiscStatus() {
        result := ComCall(4, this, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * 
     * @param {Pointer<IEnumOleDocumentViews>} ppEnum 
     * @param {Pointer<IOleDocumentView>} ppView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ioledocument-enumviews
     */
    EnumViews(ppEnum, ppView) {
        result := ComCall(5, this, "ptr*", ppEnum, "ptr*", ppView, "HRESULT")
        return result
    }
}
