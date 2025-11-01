#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IRichEditOleCallback interface is used by a rich text edit control to retrieve OLE-related information from its client.
 * @see https://docs.microsoft.com/windows/win32/api//richole/nn-richole-iricheditolecallback
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class IRichEditOleCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichEditOleCallback
     * @type {Guid}
     */
    static IID => Guid("{00020d03-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNewStorage", "GetInPlaceContext", "ShowContainerUI", "QueryInsertObject", "DeleteObject", "QueryAcceptData", "ContextSensitiveHelp", "GetClipboardData", "GetDragDropEffect", "GetContextMenu"]

    /**
     * 
     * @param {Pointer<IStorage>} lplpstg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditolecallback-getnewstorage
     */
    GetNewStorage(lplpstg) {
        result := ComCall(3, this, "ptr*", lplpstg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOleInPlaceFrame>} lplpFrame 
     * @param {Pointer<IOleInPlaceUIWindow>} lplpDoc 
     * @param {Pointer<OLEINPLACEFRAMEINFO>} lpFrameInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditolecallback-getinplacecontext
     */
    GetInPlaceContext(lplpFrame, lplpDoc, lpFrameInfo) {
        result := ComCall(4, this, "ptr*", lplpFrame, "ptr*", lplpDoc, "ptr", lpFrameInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditolecallback-showcontainerui
     */
    ShowContainerUI(fShow) {
        result := ComCall(5, this, "int", fShow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} lpclsid 
     * @param {IStorage} lpstg 
     * @param {Integer} cp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditolecallback-queryinsertobject
     */
    QueryInsertObject(lpclsid, lpstg, cp) {
        result := ComCall(6, this, "ptr", lpclsid, "ptr", lpstg, "int", cp, "HRESULT")
        return result
    }

    /**
     * The DeleteObject function deletes a logical pen, brush, font, bitmap, region, or palette, freeing all system resources associated with the object. After the object is deleted, the specified handle is no longer valid.
     * @param {IOleObject} lpoleobj 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the specified handle is not valid or is currently selected into a DC, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-deleteobject
     */
    DeleteObject(lpoleobj) {
        result := ComCall(7, this, "ptr", lpoleobj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataObject} lpdataobj 
     * @param {Pointer<Integer>} lpcfFormat 
     * @param {Integer} reco 
     * @param {BOOL} fReally 
     * @param {HGLOBAL} hMetaPict 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditolecallback-queryacceptdata
     */
    QueryAcceptData(lpdataobj, lpcfFormat, reco, fReally, hMetaPict) {
        hMetaPict := hMetaPict is Win32Handle ? NumGet(hMetaPict, "ptr") : hMetaPict

        lpcfFormatMarshal := lpcfFormat is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, "ptr", lpdataobj, lpcfFormatMarshal, lpcfFormat, "uint", reco, "int", fReally, "ptr", hMetaPict, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnterMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditolecallback-contextsensitivehelp
     */
    ContextSensitiveHelp(fEnterMode) {
        result := ComCall(9, this, "int", fEnterMode, "HRESULT")
        return result
    }

    /**
     * Retrieves data from the clipboard in a specified format. The clipboard must have been opened previously.
     * @param {Pointer<CHARRANGE>} lpchrg 
     * @param {Integer} reco 
     * @param {Pointer<IDataObject>} lplpdataobj 
     * @returns {HRESULT} Type: <b>HANDLE</b>
     * 
     * If the function succeeds, the return value is the handle to a clipboard object in the specified format.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getclipboarddata
     */
    GetClipboardData(lpchrg, reco, lplpdataobj) {
        result := ComCall(10, this, "ptr", lpchrg, "uint", reco, "ptr*", lplpdataobj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fDrag 
     * @param {Integer} grfKeyState 
     * @param {Pointer<Integer>} pdwEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditolecallback-getdragdropeffect
     */
    GetDragDropEffect(fDrag, grfKeyState, pdwEffect) {
        pdwEffectMarshal := pdwEffect is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "int", fDrag, "uint", grfKeyState, pdwEffectMarshal, pdwEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} seltype 
     * @param {IOleObject} lpoleobj 
     * @param {Pointer<CHARRANGE>} lpchrg 
     * @param {Pointer<HMENU>} lphmenu 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/richole/nf-richole-iricheditolecallback-getcontextmenu
     */
    GetContextMenu(seltype, lpoleobj, lpchrg, lphmenu) {
        result := ComCall(12, this, "ushort", seltype, "ptr", lpoleobj, "ptr", lpchrg, "ptr", lphmenu, "HRESULT")
        return result
    }
}
