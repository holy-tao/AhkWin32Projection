#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMixerOCX interface is implemented on the Overlay Mixer.
 * @see https://docs.microsoft.com/windows/win32/api//mixerocx/nn-mixerocx-imixerocx
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMixerOCX extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMixerOCX
     * @type {Guid}
     */
    static IID => Guid("{81a3bd32-dee1-11d1-8508-00a0c91f9ca0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnDisplayChange", "GetAspectRatio", "GetVideoSize", "GetStatus", "OnDraw", "SetDrawRegion", "Advise", "UnAdvise"]

    /**
     * 
     * @param {Integer} ulBitsPerPixel 
     * @param {Integer} ulScreenWidth 
     * @param {Integer} ulScreenHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mixerocx/nf-mixerocx-imixerocx-ondisplaychange
     */
    OnDisplayChange(ulBitsPerPixel, ulScreenWidth, ulScreenHeight) {
        result := ComCall(3, this, "uint", ulBitsPerPixel, "uint", ulScreenWidth, "uint", ulScreenHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwPictAspectRatioX 
     * @param {Pointer<Integer>} pdwPictAspectRatioY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mixerocx/nf-mixerocx-imixerocx-getaspectratio
     */
    GetAspectRatio(pdwPictAspectRatioX, pdwPictAspectRatioY) {
        result := ComCall(4, this, "uint*", pdwPictAspectRatioX, "uint*", pdwPictAspectRatioY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVideoWidth 
     * @param {Pointer<Integer>} pdwVideoHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mixerocx/nf-mixerocx-imixerocx-getvideosize
     */
    GetVideoSize(pdwVideoWidth, pdwVideoHeight) {
        result := ComCall(5, this, "uint*", pdwVideoWidth, "uint*", pdwVideoHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} pdwStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mixerocx/nf-mixerocx-imixerocx-getstatus
     */
    GetStatus(pdwStatus) {
        result := ComCall(6, this, "ptr*", pdwStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HDC} hdcDraw 
     * @param {Pointer<RECT>} prcDraw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mixerocx/nf-mixerocx-imixerocx-ondraw
     */
    OnDraw(hdcDraw, prcDraw) {
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw

        result := ComCall(7, this, "ptr", hdcDraw, "ptr", prcDraw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} lpptTopLeftSC 
     * @param {Pointer<RECT>} prcDrawCC 
     * @param {Pointer<RECT>} lprcClip 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mixerocx/nf-mixerocx-imixerocx-setdrawregion
     */
    SetDrawRegion(lpptTopLeftSC, prcDrawCC, lprcClip) {
        result := ComCall(8, this, "ptr", lpptTopLeftSC, "ptr", prcDrawCC, "ptr", lprcClip, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMixerOCXNotify} pmdns 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mixerocx/nf-mixerocx-imixerocx-advise
     */
    Advise(pmdns) {
        result := ComCall(9, this, "ptr", pmdns, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mixerocx/nf-mixerocx-imixerocx-unadvise
     */
    UnAdvise() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
