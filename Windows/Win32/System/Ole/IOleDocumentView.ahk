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
     * 
     * @param {Pointer<IOleInPlaceSite>} pIPSite 
     * @returns {HRESULT} 
     */
    SetInPlaceSite(pIPSite) {
        result := ComCall(3, this, "ptr", pIPSite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOleInPlaceSite>} ppIPSite 
     * @returns {HRESULT} 
     */
    GetInPlaceSite(ppIPSite) {
        result := ComCall(4, this, "ptr", ppIPSite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    GetDocument(ppunk) {
        result := ComCall(5, this, "ptr", ppunk, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(6, this, "ptr", prcView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcView 
     * @returns {HRESULT} 
     */
    GetRect(prcView) {
        result := ComCall(7, this, "ptr", prcView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcView 
     * @param {Pointer<RECT>} prcHScroll 
     * @param {Pointer<RECT>} prcVScroll 
     * @param {Pointer<RECT>} prcSizeBox 
     * @returns {HRESULT} 
     */
    SetRectComplex(prcView, prcHScroll, prcVScroll, prcSizeBox) {
        result := ComCall(8, this, "ptr", prcView, "ptr", prcHScroll, "ptr", prcVScroll, "ptr", prcSizeBox, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     */
    Show(fShow) {
        result := ComCall(9, this, "int", fShow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fUIActivate 
     * @returns {HRESULT} 
     */
    UIActivate(fUIActivate) {
        result := ComCall(10, this, "int", fUIActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Open() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    CloseView(dwReserved) {
        result := ComCall(12, this, "uint", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pstm 
     * @returns {HRESULT} 
     */
    SaveViewState(pstm) {
        result := ComCall(13, this, "ptr", pstm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pstm 
     * @returns {HRESULT} 
     */
    ApplyViewState(pstm) {
        result := ComCall(14, this, "ptr", pstm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOleInPlaceSite>} pIPSiteNew 
     * @param {Pointer<IOleDocumentView>} ppViewNew 
     * @returns {HRESULT} 
     */
    Clone(pIPSiteNew, ppViewNew) {
        result := ComCall(15, this, "ptr", pIPSiteNew, "ptr", ppViewNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
