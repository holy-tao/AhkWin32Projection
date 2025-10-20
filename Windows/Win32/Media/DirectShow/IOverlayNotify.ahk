#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IOverlayNotify interface provides an upstream filter, such as a decoder, with notifications of changes to the rendering window.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ioverlaynotify
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IOverlayNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOverlayNotify
     * @type {Guid}
     */
    static IID => Guid("{56a868a0-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnPaletteChange", "OnClipChange", "OnColorKeyChange", "OnPositionChange"]

    /**
     * 
     * @param {Integer} dwColors 
     * @param {Pointer<PALETTEENTRY>} pPalette 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ioverlaynotify-onpalettechange
     */
    OnPaletteChange(dwColors, pPalette) {
        result := ComCall(3, this, "uint", dwColors, "ptr", pPalette, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pSourceRect 
     * @param {Pointer<RECT>} pDestinationRect 
     * @param {Pointer<RGNDATA>} pRgnData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ioverlaynotify-onclipchange
     */
    OnClipChange(pSourceRect, pDestinationRect, pRgnData) {
        result := ComCall(4, this, "ptr", pSourceRect, "ptr", pDestinationRect, "ptr", pRgnData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COLORKEY>} pColorKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ioverlaynotify-oncolorkeychange
     */
    OnColorKeyChange(pColorKey) {
        result := ComCall(5, this, "ptr", pColorKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pSourceRect 
     * @param {Pointer<RECT>} pDestinationRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ioverlaynotify-onpositionchange
     */
    OnPositionChange(pSourceRect, pDestinationRect) {
        result := ComCall(6, this, "ptr", pSourceRect, "ptr", pDestinationRect, "HRESULT")
        return result
    }
}
