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
     * 
     * @param {Pointer<UInt32>} pdwColors 
     * @param {Pointer<PALETTEENTRY>} ppPalette 
     * @returns {HRESULT} 
     */
    GetPalette(pdwColors, ppPalette) {
        result := ComCall(3, this, "uint*", pdwColors, "ptr", ppPalette, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwColors 
     * @param {Pointer<PALETTEENTRY>} pPalette 
     * @returns {HRESULT} 
     */
    SetPalette(dwColors, pPalette) {
        result := ComCall(4, this, "uint", dwColors, "ptr", pPalette, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COLORKEY>} pColorKey 
     * @returns {HRESULT} 
     */
    GetDefaultColorKey(pColorKey) {
        result := ComCall(5, this, "ptr", pColorKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COLORKEY>} pColorKey 
     * @returns {HRESULT} 
     */
    GetColorKey(pColorKey) {
        result := ComCall(6, this, "ptr", pColorKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COLORKEY>} pColorKey 
     * @returns {HRESULT} 
     */
    SetColorKey(pColorKey) {
        result := ComCall(7, this, "ptr", pColorKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} pHwnd 
     * @returns {HRESULT} 
     */
    GetWindowHandle(pHwnd) {
        result := ComCall(8, this, "ptr", pHwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pSourceRect 
     * @param {Pointer<RECT>} pDestinationRect 
     * @param {Pointer<RGNDATA>} ppRgnData 
     * @returns {HRESULT} 
     */
    GetClipList(pSourceRect, pDestinationRect, ppRgnData) {
        result := ComCall(9, this, "ptr", pSourceRect, "ptr", pDestinationRect, "ptr", ppRgnData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pSourceRect 
     * @param {Pointer<RECT>} pDestinationRect 
     * @returns {HRESULT} 
     */
    GetVideoPosition(pSourceRect, pDestinationRect) {
        result := ComCall(10, this, "ptr", pSourceRect, "ptr", pDestinationRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOverlayNotify>} pOverlayNotify 
     * @param {Integer} dwInterests 
     * @returns {HRESULT} 
     */
    Advise(pOverlayNotify, dwInterests) {
        result := ComCall(11, this, "ptr", pOverlayNotify, "uint", dwInterests, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unadvise() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
