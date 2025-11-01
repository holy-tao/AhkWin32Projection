#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

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
     * 
     * @param {IOleInPlaceSite} pIPSite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ioledocumentview-setinplacesite
     */
    SetInPlaceSite(pIPSite) {
        result := ComCall(3, this, "ptr", pIPSite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOleInPlaceSite>} ppIPSite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ioledocumentview-getinplacesite
     */
    GetInPlaceSite(ppIPSite) {
        result := ComCall(4, this, "ptr*", ppIPSite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ioledocumentview-getdocument
     */
    GetDocument(ppunk) {
        result := ComCall(5, this, "ptr*", ppunk, "HRESULT")
        return result
    }

    /**
     * The SetRect function sets the coordinates of the specified rectangle. This is equivalent to assigning the left, top, right, and bottom arguments to the appropriate members of the RECT structure.
     * @param {Pointer<RECT>} prcView 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setrect
     */
    SetRect(prcView) {
        result := ComCall(6, this, "ptr", prcView, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ioledocumentview-getrect
     */
    GetRect(prcView) {
        result := ComCall(7, this, "ptr", prcView, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcView 
     * @param {Pointer<RECT>} prcHScroll 
     * @param {Pointer<RECT>} prcVScroll 
     * @param {Pointer<RECT>} prcSizeBox 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ioledocumentview-setrectcomplex
     */
    SetRectComplex(prcView, prcHScroll, prcVScroll, prcSizeBox) {
        result := ComCall(8, this, "ptr", prcView, "ptr", prcHScroll, "ptr", prcVScroll, "ptr", prcSizeBox, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ioledocumentview-show
     */
    Show(fShow) {
        result := ComCall(9, this, "int", fShow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fUIActivate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ioledocumentview-uiactivate
     */
    UIActivate(fUIActivate) {
        result := ComCall(10, this, "int", fUIActivate, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ioledocumentview-open
     */
    Open() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ioledocumentview-closeview
     */
    CloseView(dwReserved) {
        result := ComCall(12, this, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pstm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ioledocumentview-saveviewstate
     */
    SaveViewState(pstm) {
        result := ComCall(13, this, "ptr", pstm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pstm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ioledocumentview-applyviewstate
     */
    ApplyViewState(pstm) {
        result := ComCall(14, this, "ptr", pstm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOleInPlaceSite} pIPSiteNew 
     * @param {Pointer<IOleDocumentView>} ppViewNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-ioledocumentview-clone
     */
    Clone(pIPSiteNew, ppViewNew) {
        result := ComCall(15, this, "ptr", pIPSiteNew, "ptr*", ppViewNew, "HRESULT")
        return result
    }
}
