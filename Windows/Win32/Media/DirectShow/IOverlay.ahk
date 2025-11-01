#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IOverlay interface provides information so that a filter can write directly to video memory while placing the video in the correct window position.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ioverlay
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IOverlay extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOverlay
     * @type {Guid}
     */
    static IID => Guid("{56a868a1-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPalette", "SetPalette", "GetDefaultColorKey", "GetColorKey", "SetColorKey", "GetWindowHandle", "GetClipList", "GetVideoPosition", "Advise", "Unadvise"]

    /**
     * 
     * @param {Pointer<Integer>} pdwColors 
     * @param {Pointer<Pointer<PALETTEENTRY>>} ppPalette 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ioverlay-getpalette
     */
    GetPalette(pdwColors, ppPalette) {
        pdwColorsMarshal := pdwColors is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwColorsMarshal, pdwColors, "ptr*", ppPalette, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwColors 
     * @param {Pointer<PALETTEENTRY>} pPalette 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ioverlay-setpalette
     */
    SetPalette(dwColors, pPalette) {
        result := ComCall(4, this, "uint", dwColors, "ptr", pPalette, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COLORKEY>} pColorKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ioverlay-getdefaultcolorkey
     */
    GetDefaultColorKey(pColorKey) {
        result := ComCall(5, this, "ptr", pColorKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COLORKEY>} pColorKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ioverlay-getcolorkey
     */
    GetColorKey(pColorKey) {
        result := ComCall(6, this, "ptr", pColorKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COLORKEY>} pColorKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ioverlay-setcolorkey
     */
    SetColorKey(pColorKey) {
        result := ComCall(7, this, "ptr", pColorKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} pHwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ioverlay-getwindowhandle
     */
    GetWindowHandle(pHwnd) {
        result := ComCall(8, this, "ptr", pHwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pSourceRect 
     * @param {Pointer<RECT>} pDestinationRect 
     * @param {Pointer<Pointer<RGNDATA>>} ppRgnData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ioverlay-getcliplist
     */
    GetClipList(pSourceRect, pDestinationRect, ppRgnData) {
        result := ComCall(9, this, "ptr", pSourceRect, "ptr", pDestinationRect, "ptr*", ppRgnData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pSourceRect 
     * @param {Pointer<RECT>} pDestinationRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ioverlay-getvideoposition
     */
    GetVideoPosition(pSourceRect, pDestinationRect) {
        result := ComCall(10, this, "ptr", pSourceRect, "ptr", pDestinationRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOverlayNotify} pOverlayNotify 
     * @param {Integer} dwInterests 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ioverlay-advise
     */
    Advise(pOverlayNotify, dwInterests) {
        result := ComCall(11, this, "ptr", pOverlayNotify, "uint", dwInterests, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ioverlay-unadvise
     */
    Unadvise() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
