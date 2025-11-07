#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\WindowsAndMessaging\HICON.ahk
#Include .\IMAGEINFO.ahk
#Include ..\..\Foundation\RECT.ahk
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-add
     */
    Add(hbmImage, hbmMask) {
        hbmImage := hbmImage is Win32Handle ? NumGet(hbmImage, "ptr") : hbmImage
        hbmMask := hbmMask is Win32Handle ? NumGet(hbmMask, "ptr") : hbmMask

        result := ComCall(3, this, "ptr", hbmImage, "ptr", hbmMask, "int*", &pi := 0, "HRESULT")
        return pi
    }

    /**
     * 
     * @param {Integer} i 
     * @param {HICON} hicon 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-replaceicon
     */
    ReplaceIcon(i, hicon) {
        hicon := hicon is Win32Handle ? NumGet(hicon, "ptr") : hicon

        result := ComCall(4, this, "int", i, "ptr", hicon, "int*", &pi := 0, "HRESULT")
        return pi
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-addmasked
     */
    AddMasked(hbmImage, crMask) {
        hbmImage := hbmImage is Win32Handle ? NumGet(hbmImage, "ptr") : hbmImage

        result := ComCall(7, this, "ptr", hbmImage, "uint", crMask, "int*", &pi := 0, "HRESULT")
        return pi
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
     * @returns {HICON} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-geticon
     */
    GetIcon(i, flags) {
        picon := HICON()
        result := ComCall(10, this, "int", i, "uint", flags, "ptr", picon, "HRESULT")
        return picon
    }

    /**
     * 
     * @param {Integer} i 
     * @returns {IMAGEINFO} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-getimageinfo
     */
    GetImageInfo(i) {
        pImageInfo := IMAGEINFO()
        result := ComCall(11, this, "int", i, "ptr", pImageInfo, "HRESULT")
        return pImageInfo
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
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-merge
     */
    Merge(i1, punk2, i2, dx, dy, riid) {
        result := ComCall(13, this, "int", i1, "ptr", punk2, "int", i2, "int", dx, "int", dy, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-clone
     */
    Clone(riid) {
        result := ComCall(14, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Integer} i 
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-getimagerect
     */
    GetImageRect(i) {
        prc := RECT()
        result := ComCall(15, this, "int", i, "ptr", prc, "HRESULT")
        return prc
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-getimagecount
     */
    GetImageCount() {
        result := ComCall(18, this, "int*", &pi := 0, "HRESULT")
        return pi
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
     * @returns {COLORREF} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setbkcolor
     */
    SetBkColor(clrBk) {
        result := ComCall(20, this, "uint", clrBk, "uint*", &pclr := 0, "HRESULT")
        return pclr
    }

    /**
     * The GetBkColor function returns the current background color for the specified device context.
     * @returns {COLORREF} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getbkcolor
     */
    GetBkColor() {
        result := ComCall(21, this, "uint*", &pclr := 0, "HRESULT")
        return pclr
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-getitemflags
     */
    GetItemFlags(i) {
        result := ComCall(30, this, "int", i, "uint*", &dwFlags := 0, "HRESULT")
        return dwFlags
    }

    /**
     * 
     * @param {Integer} iOverlay 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-iimagelist-getoverlayimage
     */
    GetOverlayImage(iOverlay) {
        result := ComCall(31, this, "int", iOverlay, "int*", &piIndex := 0, "HRESULT")
        return piIndex
    }
}
