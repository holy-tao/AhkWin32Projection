#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\COLORKEY.ahk
#Include ..\..\Foundation\HWND.ahk
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
     * The GetPalette method retrieves the current system palette.
     * @param {Pointer<Integer>} pdwColors Pointer to a variable that receives the number of colors present.
     * @returns {Pointer<PALETTEENTRY>} Receives a pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structure describing the palette.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ioverlay-getpalette
     */
    GetPalette(pdwColors) {
        pdwColorsMarshal := pdwColors is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwColorsMarshal, pdwColors, "ptr*", &ppPalette := 0, "HRESULT")
        return ppPalette
    }

    /**
     * The SetPalette method sets the palette.
     * @param {Integer} dwColors Number of colors present.
     * @param {Pointer<PALETTEENTRY>} pPalette Pointer to colors to use for the palette.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ioverlay-setpalette
     */
    SetPalette(dwColors, pPalette) {
        result := ComCall(4, this, "uint", dwColors, "ptr", pPalette, "HRESULT")
        return result
    }

    /**
     * The GetDefaultColorKey method retrieves the default color key used for a chroma key overlay.
     * @returns {COLORKEY} Pointer to a variable that receives the default color key.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ioverlay-getdefaultcolorkey
     */
    GetDefaultColorKey() {
        pColorKey := COLORKEY()
        result := ComCall(5, this, "ptr", pColorKey, "HRESULT")
        return pColorKey
    }

    /**
     * The GetColorKey method retrieves the current color key used for chroma keying.
     * @returns {COLORKEY} Pointer to a variable that receives the current color key for chroma keying.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ioverlay-getcolorkey
     */
    GetColorKey() {
        pColorKey := COLORKEY()
        result := ComCall(6, this, "ptr", pColorKey, "HRESULT")
        return pColorKey
    }

    /**
     * The SetColorKey method changes the color key.
     * @param {Pointer<COLORKEY>} pColorKey Pointer to the color key value to be set. If successful, the actual color key value selected is copied to this parameter.
     * @returns {HRESULT} Returns S_OK if successful, E_POINTER if <i>pColorKey</i> is <b>NULL</b>, or E_INVALIDARG if the value of <i>pColorKey</i> is invalid for the current palette or pixel format.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ioverlay-setcolorkey
     */
    SetColorKey(pColorKey) {
        result := ComCall(7, this, "ptr", pColorKey, "HRESULT")
        return result
    }

    /**
     * The GetWindowHandle method retrieves the current window handle.
     * @returns {HWND} Receives the window handle.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ioverlay-getwindowhandle
     */
    GetWindowHandle() {
        pHwnd := HWND()
        result := ComCall(8, this, "ptr", pHwnd, "HRESULT")
        return pHwnd
    }

    /**
     * The GetClipList method retrieves the clipping list.
     * @param {Pointer<RECT>} pSourceRect Pointer to the bounding client rectangle.
     * @param {Pointer<RECT>} pDestinationRect Pointer to the destination rectangle.
     * @param {Pointer<Pointer<RGNDATA>>} ppRgnData Address of a pointer to the header and data describing clipping. If successful, free the allocated memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ioverlay-getcliplist
     */
    GetClipList(pSourceRect, pDestinationRect, ppRgnData) {
        ppRgnDataMarshal := ppRgnData is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", pSourceRect, "ptr", pDestinationRect, ppRgnDataMarshal, ppRgnData, "HRESULT")
        return result
    }

    /**
     * The GetVideoPosition method retrieves the current video source and destination rectangles.
     * @param {Pointer<RECT>} pSourceRect Pointer to a <b>RECT</b> structure that receives the source rectangle.
     * @param {Pointer<RECT>} pDestinationRect Pointer to to a <b>RECT</b> structure that receives the destination rectangle.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ioverlay-getvideoposition
     */
    GetVideoPosition(pSourceRect, pDestinationRect) {
        result := ComCall(10, this, "ptr", pSourceRect, "ptr", pDestinationRect, "HRESULT")
        return result
    }

    /**
     * The Advise method sets up an advise link for the overlay events specified by the dwInterests parameter.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ioverlay-advise
     */
    Advise(pOverlayNotify, dwInterests) {
        result := ComCall(11, this, "ptr", pOverlayNotify, "uint", dwInterests, "HRESULT")
        return result
    }

    /**
     * The Unadvise method terminates the advise link established with the IOverlayNotify interface.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ioverlay-unadvise
     */
    Unadvise() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
