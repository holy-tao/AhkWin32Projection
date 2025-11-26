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
     * The OnDisplayChange method informs the Overlay Mixer that the monitor's display settings have changed. (Not implemented.).
     * @param {Integer} ulBitsPerPixel Specifies the new bits per pixel setting.
     * @param {Integer} ulScreenWidth Specifies the new screen width in pixels.
     * @param {Integer} ulScreenHeight Specifies the new screen height in pixels.
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//mixerocx/nf-mixerocx-imixerocx-ondisplaychange
     */
    OnDisplayChange(ulBitsPerPixel, ulScreenWidth, ulScreenHeight) {
        result := ComCall(3, this, "uint", ulBitsPerPixel, "uint", ulScreenWidth, "uint", ulScreenHeight, "HRESULT")
        return result
    }

    /**
     * The GetAspectRatio method returns the current aspect ratio setting on the Overlay Mixer. (Currently not implemented.).
     * @param {Pointer<Integer>} pdwPictAspectRatioX Pointer that receives the value of the X dimension.
     * @param {Pointer<Integer>} pdwPictAspectRatioY Pointer that receives the value of the Y dimension.
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//mixerocx/nf-mixerocx-imixerocx-getaspectratio
     */
    GetAspectRatio(pdwPictAspectRatioX, pdwPictAspectRatioY) {
        pdwPictAspectRatioXMarshal := pdwPictAspectRatioX is VarRef ? "uint*" : "ptr"
        pdwPictAspectRatioYMarshal := pdwPictAspectRatioY is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwPictAspectRatioXMarshal, pdwPictAspectRatioX, pdwPictAspectRatioYMarshal, pdwPictAspectRatioY, "HRESULT")
        return result
    }

    /**
     * The GetVideoSize method retrieves the current size of the video rectangle.
     * @param {Pointer<Integer>} pdwVideoWidth Pointer that receives the video width in pixels.
     * @param {Pointer<Integer>} pdwVideoHeight Pointer that receives the video height in pixels.
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//mixerocx/nf-mixerocx-imixerocx-getvideosize
     */
    GetVideoSize(pdwVideoWidth, pdwVideoHeight) {
        pdwVideoWidthMarshal := pdwVideoWidth is VarRef ? "uint*" : "ptr"
        pdwVideoHeightMarshal := pdwVideoHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwVideoWidthMarshal, pdwVideoWidth, pdwVideoHeightMarshal, pdwVideoHeight, "HRESULT")
        return result
    }

    /**
     * The GetStatus method returns the current status of the Overlay Mixer. (Not implemented.).
     * @returns {Pointer<Integer>} Pointer that receives the current status of the Overlay Mixer.
     * @see https://docs.microsoft.com/windows/win32/api//mixerocx/nf-mixerocx-imixerocx-getstatus
     */
    GetStatus() {
        result := ComCall(6, this, "ptr*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * The OnDraw method instructs the Overlay Mixer to draw the video rectangle.
     * @param {HDC} hdcDraw Specifies the device context associated with the parent window.
     * @param {Pointer<RECT>} prcDraw Specifies the rectangle coordinates of the video rectangle.
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//mixerocx/nf-mixerocx-imixerocx-ondraw
     */
    OnDraw(hdcDraw, prcDraw) {
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw

        result := ComCall(7, this, "ptr", hdcDraw, "ptr", prcDraw, "HRESULT")
        return result
    }

    /**
     * The SetDrawRegion method specifies the location and dimensions of the video and clipping rectangles in screen coordinates.
     * @param {Pointer<POINT>} lpptTopLeftSC Specifies the top left of the video rectangle in screen coordinates. (The Overlay Mixer filter ignores this parameter. This parameter should be set to <b>NULL</b>.)
     * @param {Pointer<RECT>} prcDrawCC Specifies the video rectangle in screen coordinates. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<RECT>} lprcClip Specifies the clipping rectangle in screen coordinates. This parameter cannot be <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b> value. Possible values include those in the following table.
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
     * The method succeeded.
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
     * Either <i>prcDrawCC</i> or <i>lprcClip</i> are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mixerocx/nf-mixerocx-imixerocx-setdrawregion
     */
    SetDrawRegion(lpptTopLeftSC, prcDrawCC, lprcClip) {
        result := ComCall(8, this, "ptr", lpptTopLeftSC, "ptr", prcDrawCC, "ptr", lprcClip, "HRESULT")
        return result
    }

    /**
     * The Advise method provides the Overlay Mixer with a pointer to the client's IMixerOCXNotify interface for callback notifications.
     * @param {IMixerOCXNotify} pmdns Specifies the client's <a href="https://docs.microsoft.com/windows/desktop/api/mixerocx/nn-mixerocx-imixerocxnotify">IMixerOCXNotify</a> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//mixerocx/nf-mixerocx-imixerocx-advise
     */
    Advise(pmdns) {
        result := ComCall(9, this, "ptr", pmdns, "HRESULT")
        return result
    }

    /**
     * The UnAdvise method instructs the Overlay Mixer to release its pointer to the client's IMixerOCXNotify interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//mixerocx/nf-mixerocx-imixerocx-unadvise
     */
    UnAdvise() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
