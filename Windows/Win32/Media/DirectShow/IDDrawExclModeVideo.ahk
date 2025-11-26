#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDDrawExclModeVideo interface enables video playback in DirectDraw exclusive full-screen mode.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iddrawexclmodevideo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDDrawExclModeVideo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDDrawExclModeVideo
     * @type {Guid}
     */
    static IID => Guid("{153acc21-d83b-11d1-82bf-00a0c9696c8f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDDrawObject", "GetDDrawObject", "SetDDrawSurface", "GetDDrawSurface", "SetDrawParameters", "GetNativeVideoProps", "SetCallbackInterface"]

    /**
     * The SetDDrawObject method sets the DirectDraw object to be used in subsequent drawing.
     * @param {IDirectDraw} pDDrawObject Pointer to the <b>IDirectDraw</b> interface on the object to use.
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
     * Argument is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>A DirectDraw error code</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A DirectDraw error is encountered when trying to set the specified surface on the Overlay Mixer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iddrawexclmodevideo-setddrawobject
     */
    SetDDrawObject(pDDrawObject) {
        result := ComCall(3, this, "ptr", pDDrawObject, "HRESULT")
        return result
    }

    /**
     * The GetDDrawObject method retrieves the DirectDraw object being used by the Overlay Mixer filter.
     * @param {Pointer<IDirectDraw>} ppDDrawObject Address of a pointer to the <b>IDirectDraw</b> interface that the Overlay Mixer is using.
     * @param {Pointer<BOOL>} pbUsingExternal Pointer to a variable that receives a Boolean value. It receives the value <b>TRUE</b> if the Overlay Mixer is using a DirectDraw object specified by <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iddrawexclmodevideo-setddrawobject">IDDrawExclModeVideo::SetDDrawObject</a>, or <b>FALSE</b> otherwise.
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
     * Argument is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>A DirectDraw error code</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A DirectDraw error is encountered when trying to set the specified surface on the Overlay Mixer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iddrawexclmodevideo-getddrawobject
     */
    GetDDrawObject(ppDDrawObject, pbUsingExternal) {
        pbUsingExternalMarshal := pbUsingExternal is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr*", ppDDrawObject, pbUsingExternalMarshal, pbUsingExternal, "HRESULT")
        return result
    }

    /**
     * The SetDDrawSurface method specifies the DirectDraw surface to be used in subsequent drawing.
     * @param {IDirectDrawSurface} pDDrawSurface Pointer to the <b>IDirectDrawSurface</b> interface on the surface to use.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * 
     * The current DirectShow implementation return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
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
     * <dt>E_INVALIDARG</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Argument is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>A DirectDraw error code</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A DirectDraw error is encountered when trying to set the specified surface on the Overlay Mixer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iddrawexclmodevideo-setddrawsurface
     */
    SetDDrawSurface(pDDrawSurface) {
        result := ComCall(5, this, "ptr", pDDrawSurface, "HRESULT")
        return result
    }

    /**
     * The GetDDrawSurface method retrieves the DirectDraw surface being used by the Overlay Mixer.
     * @param {Pointer<IDirectDrawSurface>} ppDDrawSurface Address of a pointer to the <b>IDirectDrawSurface</b> interface that is being used by the Overlay Mixer.
     * @param {Pointer<BOOL>} pbUsingExternal Pointer to a variable that receives a Boolean value. It receives the value <b>TRUE</b> if the Overlay Mixer is using a DirectDraw surface specified by <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iddrawexclmodevideo-setddrawsurface">IDDrawExclModeVideo::SetDDrawSurface</a>, or <b>FALSE</b> otherwise.
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
     * Argument is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>A DirectDraw error code</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A DirectDraw error is encountered when trying to set the specified surface on the Overlay Mixer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iddrawexclmodevideo-getddrawsurface
     */
    GetDDrawSurface(ppDDrawSurface, pbUsingExternal) {
        pbUsingExternalMarshal := pbUsingExternal is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr*", ppDDrawSurface, pbUsingExternalMarshal, pbUsingExternal, "HRESULT")
        return result
    }

    /**
     * The SetDrawParameters method specifies which part of the original video will appear at which position of the screen.
     * @param {Pointer<RECT>} prcSource Pointer to the <b>RECT</b> structure of the original video.
     * @param {Pointer<RECT>} prcTarget Pointer to the <b>RECT</b> that indicates where the video will appear on the screen.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iddrawexclmodevideo-setdrawparameters
     */
    SetDrawParameters(prcSource, prcTarget) {
        result := ComCall(7, this, "ptr", prcSource, "ptr", prcTarget, "HRESULT")
        return result
    }

    /**
     * The GetNativeVideoProps method retrieves the current video size and picture aspect ratio of the Overlay Mixer's primary stream.
     * @param {Pointer<Integer>} pdwVideoWidth Address of variable that receives the width of the video.
     * @param {Pointer<Integer>} pdwVideoHeight Address of variable that receives the height of the video.
     * @param {Pointer<Integer>} pdwPictAspectRatioX Address of variable that receives the x-axis aspect ratio.
     * @param {Pointer<Integer>} pdwPictAspectRatioY Address of variable that receives the y-axis aspect ratio.
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
     * Argument is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iddrawexclmodevideo-getnativevideoprops
     */
    GetNativeVideoProps(pdwVideoWidth, pdwVideoHeight, pdwPictAspectRatioX, pdwPictAspectRatioY) {
        pdwVideoWidthMarshal := pdwVideoWidth is VarRef ? "uint*" : "ptr"
        pdwVideoHeightMarshal := pdwVideoHeight is VarRef ? "uint*" : "ptr"
        pdwPictAspectRatioXMarshal := pdwPictAspectRatioX is VarRef ? "uint*" : "ptr"
        pdwPictAspectRatioYMarshal := pdwPictAspectRatioY is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pdwVideoWidthMarshal, pdwVideoWidth, pdwVideoHeightMarshal, pdwVideoHeight, pdwPictAspectRatioXMarshal, pdwPictAspectRatioX, pdwPictAspectRatioYMarshal, pdwPictAspectRatioY, "HRESULT")
        return result
    }

    /**
     * The SetCallbackInterface method retrieves a pointer to the callback interface of the Overlay Mixer so that the calling application can be notified about adjustments to the display during video playback.
     * @param {IDDrawExclModeVideoCallback} pCallback Pointer to the object that implements the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iddrawexclmodevideocallback">IDDrawExclModeVideoCallback</a> interface. If <i>pCallback</i> is <b>NULL</b>, the callback interface is set to <b>NULL</b> and no more callbacks are made. If there was a previous callback interface, it is released and no more callbacks are made to it. If <i>pCallback</i> is not <b>NULL</b> and this method returns S_OK, then the reference count of the object <i>pCallback</i> points to is incremented.
     * @param {Integer} dwFlags Must be zero.
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
     * Argument is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iddrawexclmodevideo-setcallbackinterface
     */
    SetCallbackInterface(pCallback, dwFlags) {
        result := ComCall(9, this, "ptr", pCallback, "uint", dwFlags, "HRESULT")
        return result
    }
}
