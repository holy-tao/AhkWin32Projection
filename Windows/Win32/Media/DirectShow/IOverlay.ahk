#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\COLORKEY.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IOverlay interface provides information so that a filter can write directly to video memory while placing the video in the correct window position.
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-ioverlay
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
     * The GetPalette method retrieves the current system palette.
     * @param {Pointer<Integer>} pdwColors Pointer to a variable that receives the number of colors present.
     * @returns {Pointer<PALETTEENTRY>} Receives a pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structure describing the palette.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ioverlay-getpalette
     */
    GetPalette(pdwColors) {
        pdwColorsMarshal := pdwColors is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwColorsMarshal, pdwColors, "ptr*", &ppPalette := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppPalette
    }

    /**
     * The SetPalette method sets the palette.
     * @remarks
     * This method sets a logical palette for the window. The window is not guaranteed to always have the colors requested in the actual system device palette. The Microsoft® Windows® operating system only guarantees those colors when the window is the foreground active window. The current device palette can be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ioverlay-getpalette">IOverlay::GetPalette</a>.
     * 
     * If the device does not have a palette, it returns VFW_E_NO_DISPLAY_PALETTE.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/overlay-mixer-filter">Overlay Mixer</a> filter returns E_NOTIMPL.
     * @param {Integer} dwColors Number of colors present.
     * @param {Pointer<PALETTEENTRY>} pPalette Pointer to colors to use for the palette.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ioverlay-setpalette
     */
    SetPalette(dwColors, pPalette) {
        result := ComCall(4, this, "uint", dwColors, "ptr", pPalette, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetDefaultColorKey method retrieves the default color key used for a chroma key overlay.
     * @remarks
     * A filter using color keys can get a default color from the video renderer. The default color key can then be installed into the window using <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ioverlay-setcolorkey">IOverlay::SetColorKey</a>. The colors returned through this method vary depending on the current display mode. If the colors are 8-bit palettized, they will be bright system colors (such as magenta). If the display is in a true-color mode, they will be shades of black.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ioverlay">IOverlay</a> interface is used to ensure that separate instances of the renderer on the same computer get different color keys so that overlays do not conflict.
     * @returns {COLORKEY} Pointer to a variable that receives the default color key.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ioverlay-getdefaultcolorkey
     */
    GetDefaultColorKey() {
        pColorKey := COLORKEY()
        result := ComCall(5, this, "ptr", pColorKey, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pColorKey
    }

    /**
     * The GetColorKey method retrieves the current color key used for chroma keying.
     * @remarks
     * If you change the color key by using the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ioverlay-setcolorkey">IOverlay::SetColorKey</a> method, all the advise links receive an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ioverlaynotify-oncolorkeychange">IOverlayNotify::OnColorKeyChange</a> callback method with the new color.
     * 
     * If no color key is currently being used, this method returns VFW_E_NO_COLOR_KEY_SET.
     * @returns {COLORKEY} Pointer to a variable that receives the current color key for chroma keying.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ioverlay-getcolorkey
     */
    GetColorKey() {
        pColorKey := COLORKEY()
        result := ComCall(6, this, "ptr", pColorKey, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pColorKey
    }

    /**
     * The SetColorKey method changes the color key.
     * @remarks
     * If you change the color key using the <c>SetColorKey</c> method, all the advise links will receive an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ioverlaynotify-oncolorkeychange">IOverlayNotify::OnColorKeyChange</a> callback method with the new color.
     * 
     * When using <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ioverlay-advise">IOverlay::Advise</a> on a palettized display, a filter can either install a color key (using <c>SetColorKey</c>) or install a palette (using <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ioverlay-setpalette">IOverlay::SetPalette</a>), but not both. This is because color keys in this mode require a palette to be realized that would conflict with <b>SetPalette</b>. Color keys can be uninstalled by requesting a color key with the CK_NOCOLORKEY flag. Likewise, any palette installed through <b>SetPalette</b> can be uninstalled by calling <b>SetPalette</b> and passing in <b>NULL</b> parameters (that is, SetPalette(0,<b>NULL</b>)).
     * 
     * Trying to set a palette when a color key is installed returns a VFW_E_PALETTE_SET error. Trying to set a color key when a palette is installed returns VFW_E_COLOR_KEY_SET.
     * @param {Pointer<COLORKEY>} pColorKey Pointer to the color key value to be set. If successful, the actual color key value selected is copied to this parameter.
     * @returns {HRESULT} Returns S_OK if successful, E_POINTER if <i>pColorKey</i> is <b>NULL</b>, or E_INVALIDARG if the value of <i>pColorKey</i> is invalid for the current palette or pixel format.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ioverlay-setcolorkey
     */
    SetColorKey(pColorKey) {
        result := ComCall(7, this, "ptr", pColorKey, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetWindowHandle method retrieves the current window handle.
     * @returns {HWND} Receives the window handle.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ioverlay-getwindowhandle
     */
    GetWindowHandle() {
        pHwnd := HWND()
        result := ComCall(8, this, "ptr", pHwnd, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pHwnd
    }

    /**
     * The GetClipList method retrieves the clipping list.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ioverlay">IOverlay</a> implementation allocates the memory for the clipping rectangles, because it can vary in length. The filter calling this method should free the memory (using <b>CoTaskMemFree</b>) when it is finished with it.
     * @param {Pointer<RECT>} pSourceRect Pointer to the bounding client rectangle.
     * @param {Pointer<RECT>} pDestinationRect Pointer to the destination rectangle.
     * @param {Pointer<Pointer<RGNDATA>>} ppRgnData Address of a pointer to the header and data describing clipping. If successful, free the allocated memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ioverlay-getcliplist
     */
    GetClipList(pSourceRect, pDestinationRect, ppRgnData) {
        ppRgnDataMarshal := ppRgnData is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", pSourceRect, "ptr", pDestinationRect, ppRgnDataMarshal, ppRgnData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetVideoPosition method retrieves the current video source and destination rectangles.
     * @param {Pointer<RECT>} pSourceRect Pointer to a <b>RECT</b> structure that receives the source rectangle.
     * @param {Pointer<RECT>} pDestinationRect Pointer to to a <b>RECT</b> structure that receives the destination rectangle.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ioverlay-getvideoposition
     */
    GetVideoPosition(pSourceRect, pDestinationRect) {
        result := ComCall(10, this, "ptr", pSourceRect, "ptr", pDestinationRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Advise method sets up an advise link for the overlay events specified by the dwInterests parameter.
     * @remarks
     * This method sets up an advise link for the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ioverlaynotify">IOverlayNotify</a> interface to receive notifications. If one of these events occurs, the appropriate entry point in the <i>pOverlayNotify</i> parameter passed in is called (<a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ioverlaynotify-onclipchange">IOverlayNotify::OnClipChange</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ioverlaynotify-oncolorkeychange">IOverlayNotify::OnColorKeyChange</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ioverlaynotify-onpalettechange">IOverlayNotify::OnPaletteChange</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ioverlaynotify-onpositionchange">IOverlayNotify::OnPositionChange</a>).
     * 
     * Only one advise link can be set on any given <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ioverlay">IOverlay</a> interface. Trying to set another notification interface on second and subsequent calls returns VFW_E_ADVISE_ALREADY_SET. You can cancel an advise link by using <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ioverlay-unadvise">IOverlay::Unadvise</a>.
     * @param {IOverlayNotify} pOverlayNotify Pointer to the notification interface.
     * @param {Integer} dwInterests Callbacks of interest, which can be any subset of the following events.
     * 
     * <table>
     * <tr>
     * <th>Event
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ADVISE_NONE</td>
     * <td>No changes.</td>
     * </tr>
     * <tr>
     * <td>ADVISE_CLIPPING</td>
     * <td>Change in clipping region (synchronized with the window).</td>
     * </tr>
     * <tr>
     * <td>ADVISE_PALETTE</td>
     * <td>Change in palette.</td>
     * </tr>
     * <tr>
     * <td>ADVISE_COLORKEY</td>
     * <td>Change of chroma key value.</td>
     * </tr>
     * <tr>
     * <td>ADVISE_POSITION</td>
     * <td>Change in position of video window (not synchronized with the window).</td>
     * </tr>
     * <tr>
     * <td>ADVISE_DISPLAY_CHANGE</td>
     * <td>Called on <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-displaychange">WM_DISPLAYCHANGE</a>. The <b>WM_DISPLAYCHANGE</b> message is sent to all windows when the display resolution has changed.</td>
     * </tr>
     * <tr>
     * <td>ADVISE_ALL2</td>
     * <td>All of the above.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ioverlay-advise
     */
    Advise(pOverlayNotify, dwInterests) {
        result := ComCall(11, this, "ptr", pOverlayNotify, "uint", dwInterests, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Unadvise method terminates the advise link established with the IOverlayNotify interface.
     * @remarks
     * This method terminates the advise link established by using the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ioverlay-advise">IOverlay::Advise</a> method. Only one advise link can be maintained at any one time.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ioverlay-unadvise
     */
    Unadvise() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
