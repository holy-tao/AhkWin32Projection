#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IOverlayNotify interface provides an upstream filter, such as a decoder, with notifications of changes to the rendering window.
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-ioverlaynotify
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
     * The OnPaletteChange method provides notification that the palette of the window has changed.
     * @remarks
     * Before returning, the filter should copy the array of <b>RGBQUAD</b> values, if necessary.
     * @param {Integer} dwColors Number of colors present.
     * @param {Pointer<PALETTEENTRY>} pPalette Pointer to the array of palette colors.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ioverlaynotify-onpalettechange
     */
    OnPaletteChange(dwColors, pPalette) {
        result := ComCall(3, this, "uint", dwColors, "ptr", pPalette, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The OnClipChange method provides notification that the window's visible region has changed. It is essential that any overlay hardware be updated to reflect the change to the visible region before returning from this method.
     * @remarks
     * The calls to <c>OnClipChange</c> happen in synchronization with the window. It is called with an empty clip list to freeze the video before the window moves, and then called again when the window has stabilized with the new clip list.
     * 
     * If the window rectangle is all zeros, the window is invisible. As is the case for AVI decoders, the decoder should save the image if it relies on the current image to decode the next one.
     * @param {Pointer<RECT>} pSourceRect Pointer to the region of the video to use.
     * @param {Pointer<RECT>} pDestinationRect Pointer to the video destination.
     * @param {Pointer<RGNDATA>} pRgnData Pointer to the clipping information.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ioverlaynotify-onclipchange
     */
    OnClipChange(pSourceRect, pDestinationRect, pRgnData) {
        result := ComCall(4, this, "ptr", pSourceRect, "ptr", pDestinationRect, "ptr", pRgnData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The OnColorKeyChange method provides notification that the window's color key has changed.
     * @param {Pointer<COLORKEY>} pColorKey Pointer to the new chroma key.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ioverlaynotify-oncolorkeychange
     */
    OnColorKeyChange(pColorKey) {
        result := ComCall(5, this, "ptr", pColorKey, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The OnPositionChange method provides notification that the position has changed.
     * @remarks
     * This method is a callback intended for use by hardware overlay cards that do not want the expense of synchronous clipping updates, and just want to know when the source or destination video positions change.
     * 
     * Unlike the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ioverlaynotify-onclipchange">IOverlayNotify::OnClipChange</a> method, this method is not called in synchronization with the window changing but, rather, at some point after the window has changed (basically in time with WM_SIZE messages received). This is therefore suitable for overlay cards that do not inlay their data to the frame buffer.
     * @param {Pointer<RECT>} pSourceRect Pointer to the source video rectangle.
     * @param {Pointer<RECT>} pDestinationRect Pointer to the destination video rectangle. Note that this is not clipped to the visible display area.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ioverlaynotify-onpositionchange
     */
    OnPositionChange(pSourceRect, pDestinationRect) {
        result := ComCall(6, this, "ptr", pSourceRect, "ptr", pDestinationRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
