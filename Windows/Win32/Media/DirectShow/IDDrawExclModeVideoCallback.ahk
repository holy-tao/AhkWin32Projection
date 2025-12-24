#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDDrawExclModeVideoCallback interface is a callback interface for the IDDrawExclModeVideo interface.This callback interface enables applications to get synchronous notification about changes to the overlay position, size, visibility, and so on, so that the application can adjust its video visibility, size, and position. This avoids any color key flash at the beginning, end, or during playback. The application must implement the interface. It is important that none of the methods block or slow down the video processing, because this will cause problems with playback.Use this interface if you are writing a filter that supports IDDrawExclModeVideo or needs to generate callbacks to enable an application to draw color keys at the right time.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iddrawexclmodevideocallback
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDDrawExclModeVideoCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDDrawExclModeVideoCallback
     * @type {Guid}
     */
    static IID => Guid("{913c24a0-20ab-11d2-9038-00a0c9697298}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnUpdateOverlay", "OnUpdateColorKey", "OnUpdateSize"]

    /**
     * The OnUpdateOverlay method informs the application when the overlay surface for the video is about to become visible, invisible, change size, or change position, so that the application can repaint its window appropriately.
     * @param {BOOL} bBefore Boolean value specifying whether the call is being made before or after the overlay-related change. <b>TRUE</b> specifies before, <b>FALSE</b> specifies after.
     * @param {Integer} dwFlags Value from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_am_overlay_notify_flags">AM_OVERLAY_NOTIFY_FLAGS</a> enumeration that specifies what is about to change or what changed.
     * @param {BOOL} bOldVisible Boolean value specifying whether the old window is visible. <b>TRUE</b> means the old window is visible.
     * @param {Pointer<RECT>} prcOldSrc Pointer to the rectangle representing the old source position of the DirectDraw surface.
     * @param {Pointer<RECT>} prcOldDest Pointer to the rectangle representing the old destination position of the rectangle in the overlay surface.
     * @param {BOOL} bNewVisible Boolean specifying whether the new window is visible. <b>TRUE</b> means the new window is visible.
     * @param {Pointer<RECT>} prcNewSrc Pointer to the rectangle representing the new source position of the DirectDraw surface.
     * @param {Pointer<RECT>} prcNewDest Pointer to the rectangle representing the new destination position of the rectangle in the overlay surface.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iddrawexclmodevideocallback-onupdateoverlay
     */
    OnUpdateOverlay(bBefore, dwFlags, bOldVisible, prcOldSrc, prcOldDest, bNewVisible, prcNewSrc, prcNewDest) {
        result := ComCall(3, this, "int", bBefore, "uint", dwFlags, "int", bOldVisible, "ptr", prcOldSrc, "ptr", prcOldDest, "int", bNewVisible, "ptr", prcNewSrc, "ptr", prcNewDest, "HRESULT")
        return result
    }

    /**
     * The OnUpdateColorKey method informs the application that the color key has changed so that the application can use the new color key to overlay graphics on the video.
     * @param {Pointer<COLORKEY>} pKey Pointer to a [COLORKEY](/windows/desktop/api/strmif/ns-strmif-colorkey) structure that contains the key type and a palette index.
     * @param {Integer} dwColor Value indicating the 8-bit palette index of the <b>COLORKEY</b> returned in <i>pKey</i>, if the current display mode is 8-bit palettized. Otherwise, it is a value representing the color key in the pixel format of the current display mode.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iddrawexclmodevideocallback-onupdatecolorkey
     */
    OnUpdateColorKey(pKey, dwColor) {
        result := ComCall(4, this, "ptr", pKey, "uint", dwColor, "HRESULT")
        return result
    }

    /**
     * The OnUpdateSize method informs the application that the size of the video rectangle is about to change.
     * @param {Integer} dwWidth The new width, in pixels, of the video stream.
     * @param {Integer} dwHeight The new height, in pixels, of the video stream.
     * @param {Integer} dwARWidth The new horizontal value of the aspect ratio.
     * @param {Integer} dwARHeight The new vertical value of the aspect ratio.
     * @returns {HRESULT} Returns an HRESULT value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iddrawexclmodevideocallback-onupdatesize
     */
    OnUpdateSize(dwWidth, dwHeight, dwARWidth, dwARHeight) {
        result := ComCall(5, this, "uint", dwWidth, "uint", dwHeight, "uint", dwARWidth, "uint", dwARHeight, "HRESULT")
        return result
    }
}
