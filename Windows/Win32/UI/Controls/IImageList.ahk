#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that manipulate and interact with image lists.
 * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/nn-commoncontrols-iimagelist
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class IImageList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImageList
     * @type {Guid}
     */
    static IID => Guid("{46eb5926-582e-4017-9fdf-e8998daa0950}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Add", "ReplaceIcon", "SetOverlayImage", "Replace", "AddMasked", "Draw", "Remove", "GetIcon", "GetImageInfo", "Copy", "Merge", "Clone", "GetImageRect", "GetIconSize", "SetIconSize", "GetImageCount", "SetImageCount", "SetBkColor", "GetBkColor", "BeginDrag", "EndDrag", "DragEnter", "DragLeave", "DragMove", "SetDragCursorImage", "DragShowNolock", "GetDragImage", "GetItemFlags", "GetOverlayImage"]

    /**
     * 
     * @param {HBITMAP} hbmImage 
     * @param {HBITMAP} hbmMask 
     * @param {Pointer<Integer>} pi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-add
     */
    Add(hbmImage, hbmMask, pi) {
        hbmImage := hbmImage is Win32Handle ? NumGet(hbmImage, "ptr") : hbmImage
        hbmMask := hbmMask is Win32Handle ? NumGet(hbmMask, "ptr") : hbmMask

        piMarshal := pi is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", hbmImage, "ptr", hbmMask, piMarshal, pi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {HICON} hicon 
     * @param {Pointer<Integer>} pi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-replaceicon
     */
    ReplaceIcon(i, hicon, pi) {
        hicon := hicon is Win32Handle ? NumGet(hicon, "ptr") : hicon

        piMarshal := pi is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "int", i, "ptr", hicon, piMarshal, pi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iImage 
     * @param {Integer} iOverlay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-setoverlayimage
     */
    SetOverlayImage(iImage, iOverlay) {
        result := ComCall(5, this, "int", iImage, "int", iOverlay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {HBITMAP} hbmImage 
     * @param {HBITMAP} hbmMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-replace
     */
    Replace(i, hbmImage, hbmMask) {
        hbmImage := hbmImage is Win32Handle ? NumGet(hbmImage, "ptr") : hbmImage
        hbmMask := hbmMask is Win32Handle ? NumGet(hbmMask, "ptr") : hbmMask

        result := ComCall(6, this, "int", i, "ptr", hbmImage, "ptr", hbmMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HBITMAP} hbmImage 
     * @param {COLORREF} crMask 
     * @param {Pointer<Integer>} pi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-addmasked
     */
    AddMasked(hbmImage, crMask, pi) {
        hbmImage := hbmImage is Win32Handle ? NumGet(hbmImage, "ptr") : hbmImage

        piMarshal := pi is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", hbmImage, "uint", crMask, piMarshal, pi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMAGELISTDRAWPARAMS>} pimldp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-draw
     */
    Draw(pimldp) {
        result := ComCall(8, this, "ptr", pimldp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-remove
     */
    Remove(i) {
        result := ComCall(9, this, "int", i, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {Integer} flags 
     * @param {Pointer<HICON>} picon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-geticon
     */
    GetIcon(i, flags, picon) {
        result := ComCall(10, this, "int", i, "uint", flags, "ptr", picon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {Pointer<IMAGEINFO>} pImageInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-getimageinfo
     */
    GetImageInfo(i, pImageInfo) {
        result := ComCall(11, this, "int", i, "ptr", pImageInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iDst 
     * @param {IUnknown} punkSrc 
     * @param {Integer} iSrc 
     * @param {Integer} uFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-copy
     */
    Copy(iDst, punkSrc, iSrc, uFlags) {
        result := ComCall(12, this, "int", iDst, "ptr", punkSrc, "int", iSrc, "uint", uFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} i1 
     * @param {IUnknown} punk2 
     * @param {Integer} i2 
     * @param {Integer} dx 
     * @param {Integer} dy 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-merge
     */
    Merge(i1, punk2, i2, dx, dy, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "int", i1, "ptr", punk2, "int", i2, "int", dx, "int", dy, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-clone
     */
    Clone(riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-getimagerect
     */
    GetImageRect(i, prc) {
        result := ComCall(15, this, "int", i, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} cx 
     * @param {Pointer<Integer>} cy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-geticonsize
     */
    GetIconSize(cx, cy) {
        cxMarshal := cx is VarRef ? "int*" : "ptr"
        cyMarshal := cy is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, cxMarshal, cx, cyMarshal, cy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cx 
     * @param {Integer} cy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-seticonsize
     */
    SetIconSize(cx, cy) {
        result := ComCall(17, this, "int", cx, "int", cy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-getimagecount
     */
    GetImageCount(pi) {
        piMarshal := pi is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, piMarshal, pi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uNewCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-setimagecount
     */
    SetImageCount(uNewCount) {
        result := ComCall(19, this, "uint", uNewCount, "HRESULT")
        return result
    }

    /**
     * The SetBkColor function sets the current background color to the specified color value, or to the nearest physical color if the device cannot represent the specified color value.
     * @param {COLORREF} clrBk 
     * @param {Pointer<COLORREF>} pclr 
     * @returns {HRESULT} If the function succeeds, the return value specifies the previous background color as a <a href="/windows/desktop/gdi/colorref">COLORREF</a> value.
     * 
     * If the function fails, the return value is CLR_INVALID.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setbkcolor
     */
    SetBkColor(clrBk, pclr) {
        result := ComCall(20, this, "uint", clrBk, "ptr", pclr, "HRESULT")
        return result
    }

    /**
     * The GetBkColor function returns the current background color for the specified device context.
     * @param {Pointer<COLORREF>} pclr 
     * @returns {HRESULT} If the function succeeds, the return value is a <a href="/windows/desktop/gdi/colorref">COLORREF</a> value for the current background color.
     * 
     * If the function fails, the return value is CLR_INVALID.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getbkcolor
     */
    GetBkColor(pclr) {
        result := ComCall(21, this, "ptr", pclr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iTrack 
     * @param {Integer} dxHotspot 
     * @param {Integer} dyHotspot 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-begindrag
     */
    BeginDrag(iTrack, dxHotspot, dyHotspot) {
        result := ComCall(22, this, "int", iTrack, "int", dxHotspot, "int", dyHotspot, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-enddrag
     */
    EndDrag() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndLock 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-dragenter
     */
    DragEnter(hwndLock, x, y) {
        hwndLock := hwndLock is Win32Handle ? NumGet(hwndLock, "ptr") : hwndLock

        result := ComCall(24, this, "ptr", hwndLock, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndLock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-dragleave
     */
    DragLeave(hwndLock) {
        hwndLock := hwndLock is Win32Handle ? NumGet(hwndLock, "ptr") : hwndLock

        result := ComCall(25, this, "ptr", hwndLock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-dragmove
     */
    DragMove(x, y) {
        result := ComCall(26, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @param {Integer} iDrag 
     * @param {Integer} dxHotspot 
     * @param {Integer} dyHotspot 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-setdragcursorimage
     */
    SetDragCursorImage(punk, iDrag, dxHotspot, dyHotspot) {
        result := ComCall(27, this, "ptr", punk, "int", iDrag, "int", dxHotspot, "int", dyHotspot, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-dragshownolock
     */
    DragShowNolock(fShow) {
        result := ComCall(28, this, "int", fShow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} ppt 
     * @param {Pointer<POINT>} pptHotspot 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-getdragimage
     */
    GetDragImage(ppt, pptHotspot, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(29, this, "ptr", ppt, "ptr", pptHotspot, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {Pointer<Integer>} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-getitemflags
     */
    GetItemFlags(i, dwFlags) {
        dwFlagsMarshal := dwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, "int", i, dwFlagsMarshal, dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iOverlay 
     * @param {Pointer<Integer>} piIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-getoverlayimage
     */
    GetOverlayImage(iOverlay, piIndex) {
        piIndexMarshal := piIndex is VarRef ? "int*" : "ptr"

        result := ComCall(31, this, "int", iOverlay, piIndexMarshal, piIndex, "HRESULT")
        return result
    }
}
