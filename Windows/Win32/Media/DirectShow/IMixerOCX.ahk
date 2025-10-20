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
     * 
     * @param {Integer} ulBitsPerPixel 
     * @param {Integer} ulScreenWidth 
     * @param {Integer} ulScreenHeight 
     * @returns {HRESULT} 
     */
    OnDisplayChange(ulBitsPerPixel, ulScreenWidth, ulScreenHeight) {
        result := ComCall(3, this, "uint", ulBitsPerPixel, "uint", ulScreenWidth, "uint", ulScreenHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwPictAspectRatioX 
     * @param {Pointer<UInt32>} pdwPictAspectRatioY 
     * @returns {HRESULT} 
     */
    GetAspectRatio(pdwPictAspectRatioX, pdwPictAspectRatioY) {
        result := ComCall(4, this, "uint*", pdwPictAspectRatioX, "uint*", pdwPictAspectRatioY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwVideoWidth 
     * @param {Pointer<UInt32>} pdwVideoHeight 
     * @returns {HRESULT} 
     */
    GetVideoSize(pdwVideoWidth, pdwVideoHeight) {
        result := ComCall(5, this, "uint*", pdwVideoWidth, "uint*", pdwVideoHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pdwStatus) {
        result := ComCall(6, this, "uint*", pdwStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HDC} hdcDraw 
     * @param {Pointer<RECT>} prcDraw 
     * @returns {HRESULT} 
     */
    OnDraw(hdcDraw, prcDraw) {
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw

        result := ComCall(7, this, "ptr", hdcDraw, "ptr", prcDraw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} lpptTopLeftSC 
     * @param {Pointer<RECT>} prcDrawCC 
     * @param {Pointer<RECT>} lprcClip 
     * @returns {HRESULT} 
     */
    SetDrawRegion(lpptTopLeftSC, prcDrawCC, lprcClip) {
        result := ComCall(8, this, "ptr", lpptTopLeftSC, "ptr", prcDrawCC, "ptr", lprcClip, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMixerOCXNotify>} pmdns 
     * @returns {HRESULT} 
     */
    Advise(pmdns) {
        result := ComCall(9, this, "ptr", pmdns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnAdvise() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
