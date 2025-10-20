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
     * 
     * @param {HBITMAP} hbmImage 
     * @param {HBITMAP} hbmMask 
     * @param {Pointer<Int32>} pi 
     * @returns {HRESULT} 
     */
    Add(hbmImage, hbmMask, pi) {
        hbmImage := hbmImage is Win32Handle ? NumGet(hbmImage, "ptr") : hbmImage
        hbmMask := hbmMask is Win32Handle ? NumGet(hbmMask, "ptr") : hbmMask

        result := ComCall(3, this, "ptr", hbmImage, "ptr", hbmMask, "int*", pi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {HICON} hicon 
     * @param {Pointer<Int32>} pi 
     * @returns {HRESULT} 
     */
    ReplaceIcon(i, hicon, pi) {
        hicon := hicon is Win32Handle ? NumGet(hicon, "ptr") : hicon

        result := ComCall(4, this, "int", i, "ptr", hicon, "int*", pi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iImage 
     * @param {Integer} iOverlay 
     * @returns {HRESULT} 
     */
    SetOverlayImage(iImage, iOverlay) {
        result := ComCall(5, this, "int", iImage, "int", iOverlay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {HBITMAP} hbmImage 
     * @param {HBITMAP} hbmMask 
     * @returns {HRESULT} 
     */
    Replace(i, hbmImage, hbmMask) {
        hbmImage := hbmImage is Win32Handle ? NumGet(hbmImage, "ptr") : hbmImage
        hbmMask := hbmMask is Win32Handle ? NumGet(hbmMask, "ptr") : hbmMask

        result := ComCall(6, this, "int", i, "ptr", hbmImage, "ptr", hbmMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HBITMAP} hbmImage 
     * @param {COLORREF} crMask 
     * @param {Pointer<Int32>} pi 
     * @returns {HRESULT} 
     */
    AddMasked(hbmImage, crMask, pi) {
        hbmImage := hbmImage is Win32Handle ? NumGet(hbmImage, "ptr") : hbmImage

        result := ComCall(7, this, "ptr", hbmImage, "uint", crMask, "int*", pi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMAGELISTDRAWPARAMS>} pimldp 
     * @returns {HRESULT} 
     */
    Draw(pimldp) {
        result := ComCall(8, this, "ptr", pimldp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @returns {HRESULT} 
     */
    Remove(i) {
        result := ComCall(9, this, "int", i, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {Integer} flags 
     * @param {Pointer<HICON>} picon 
     * @returns {HRESULT} 
     */
    GetIcon(i, flags, picon) {
        result := ComCall(10, this, "int", i, "uint", flags, "ptr", picon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {Pointer<IMAGEINFO>} pImageInfo 
     * @returns {HRESULT} 
     */
    GetImageInfo(i, pImageInfo) {
        result := ComCall(11, this, "int", i, "ptr", pImageInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iDst 
     * @param {Pointer<IUnknown>} punkSrc 
     * @param {Integer} iSrc 
     * @param {Integer} uFlags 
     * @returns {HRESULT} 
     */
    Copy(iDst, punkSrc, iSrc, uFlags) {
        result := ComCall(12, this, "int", iDst, "ptr", punkSrc, "int", iSrc, "uint", uFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} i1 
     * @param {Pointer<IUnknown>} punk2 
     * @param {Integer} i2 
     * @param {Integer} dx 
     * @param {Integer} dy 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    Merge(i1, punk2, i2, dx, dy, riid, ppv) {
        result := ComCall(13, this, "int", i1, "ptr", punk2, "int", i2, "int", dx, "int", dy, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    Clone(riid, ppv) {
        result := ComCall(14, this, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     */
    GetImageRect(i, prc) {
        result := ComCall(15, this, "int", i, "ptr", prc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} cx 
     * @param {Pointer<Int32>} cy 
     * @returns {HRESULT} 
     */
    GetIconSize(cx, cy) {
        result := ComCall(16, this, "int*", cx, "int*", cy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cx 
     * @param {Integer} cy 
     * @returns {HRESULT} 
     */
    SetIconSize(cx, cy) {
        result := ComCall(17, this, "int", cx, "int", cy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pi 
     * @returns {HRESULT} 
     */
    GetImageCount(pi) {
        result := ComCall(18, this, "int*", pi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uNewCount 
     * @returns {HRESULT} 
     */
    SetImageCount(uNewCount) {
        result := ComCall(19, this, "uint", uNewCount, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(20, this, "uint", clrBk, "ptr", pclr, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(21, this, "ptr", pclr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iTrack 
     * @param {Integer} dxHotspot 
     * @param {Integer} dyHotspot 
     * @returns {HRESULT} 
     */
    BeginDrag(iTrack, dxHotspot, dyHotspot) {
        result := ComCall(22, this, "int", iTrack, "int", dxHotspot, "int", dyHotspot, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndDrag() {
        result := ComCall(23, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndLock 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    DragEnter(hwndLock, x, y) {
        hwndLock := hwndLock is Win32Handle ? NumGet(hwndLock, "ptr") : hwndLock

        result := ComCall(24, this, "ptr", hwndLock, "int", x, "int", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndLock 
     * @returns {HRESULT} 
     */
    DragLeave(hwndLock) {
        hwndLock := hwndLock is Win32Handle ? NumGet(hwndLock, "ptr") : hwndLock

        result := ComCall(25, this, "ptr", hwndLock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    DragMove(x, y) {
        result := ComCall(26, this, "int", x, "int", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @param {Integer} iDrag 
     * @param {Integer} dxHotspot 
     * @param {Integer} dyHotspot 
     * @returns {HRESULT} 
     */
    SetDragCursorImage(punk, iDrag, dxHotspot, dyHotspot) {
        result := ComCall(27, this, "ptr", punk, "int", iDrag, "int", dxHotspot, "int", dyHotspot, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     */
    DragShowNolock(fShow) {
        result := ComCall(28, this, "int", fShow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} ppt 
     * @param {Pointer<POINT>} pptHotspot 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetDragImage(ppt, pptHotspot, riid, ppv) {
        result := ComCall(29, this, "ptr", ppt, "ptr", pptHotspot, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {Pointer<UInt32>} dwFlags 
     * @returns {HRESULT} 
     */
    GetItemFlags(i, dwFlags) {
        result := ComCall(30, this, "int", i, "uint*", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iOverlay 
     * @param {Pointer<Int32>} piIndex 
     * @returns {HRESULT} 
     */
    GetOverlayImage(iOverlay, piIndex) {
        result := ComCall(31, this, "int", iOverlay, "int*", piIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
