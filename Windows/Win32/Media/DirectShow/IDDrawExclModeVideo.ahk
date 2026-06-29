#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Graphics\DirectDraw\IDirectDrawSurface.ahk" { IDirectDrawSurface }
#Import "..\..\Graphics\DirectDraw\IDirectDraw.ahk" { IDirectDraw }
#Import ".\IDDrawExclModeVideoCallback.ahk" { IDDrawExclModeVideoCallback }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDDrawExclModeVideo interface enables video playback in DirectDraw exclusive full-screen mode.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iddrawexclmodevideo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IDDrawExclModeVideo extends IUnknown {
    /**
     * The interface identifier for IDDrawExclModeVideo
     * @type {Guid}
     */
    static IID := Guid("{153acc21-d83b-11d1-82bf-00a0c9696c8f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDDrawExclModeVideo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDDrawObject       : IntPtr
        GetDDrawObject       : IntPtr
        SetDDrawSurface      : IntPtr
        GetDDrawSurface      : IntPtr
        SetDrawParameters    : IntPtr
        GetNativeVideoProps  : IntPtr
        SetCallbackInterface : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDDrawExclModeVideo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetDDrawObject method sets the DirectDraw object to be used in subsequent drawing.
     * @remarks
     * A game application can use this method to share its DirectDraw object with the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/overlay-mixer-filter">Overlay Mixer</a> filter, so that the video can be drawn in a specified surface, as set in <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iddrawexclmodevideo-setddrawsurface">IDDrawExclModeVideo::SetDDrawSurface</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iddrawexclmodevideo-setddrawobject
     */
    SetDDrawObject(pDDrawObject) {
        result := ComCall(3, this, "ptr", pDDrawObject, "HRESULT")
        return result
    }

    /**
     * The GetDDrawObject method retrieves the DirectDraw object being used by the Overlay Mixer filter.
     * @remarks
     * If the filter graph has not set a DirectDraw object and the Overlay Mixer has not yet allocated one, then <i>pDDrawObject</i> will be set to <b>NULL</b> and <i>pbUsingExternal</i> will be set to <b>FALSE</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iddrawexclmodevideo-getddrawobject
     */
    GetDDrawObject(ppDDrawObject, pbUsingExternal) {
        pbUsingExternalMarshal := pbUsingExternal is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, IDirectDraw.Ptr, ppDDrawObject, pbUsingExternalMarshal, pbUsingExternal, "HRESULT")
        return result
    }

    /**
     * The SetDDrawSurface method specifies the DirectDraw surface to be used in subsequent drawing.
     * @remarks
     * A game application can use this to share its DirectDraw surface with the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/overlay-mixer-filter">Overlay Mixer</a> filter so that the video can be drawn in a specified surface. This surface must be associated with the object specified in <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iddrawexclmodevideo-setddrawobject">IDDrawExclModeVideo::SetDDrawObject</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iddrawexclmodevideo-setddrawsurface
     */
    SetDDrawSurface(pDDrawSurface) {
        result := ComCall(5, this, "ptr", pDDrawSurface, "HRESULT")
        return result
    }

    /**
     * The GetDDrawSurface method retrieves the DirectDraw surface being used by the Overlay Mixer.
     * @remarks
     * If the filter graph has not set a DirectDraw surface and the Overlay Mixer has not yet allocated one, then <i>pDDrawSurface</i> will be set to <b>NULL</b> and <i>pdUsingExternal</i> will be set to <b>FALSE</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iddrawexclmodevideo-getddrawsurface
     */
    GetDDrawSurface(ppDDrawSurface, pbUsingExternal) {
        pbUsingExternalMarshal := pbUsingExternal is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, IDirectDrawSurface.Ptr, ppDDrawSurface, pbUsingExternalMarshal, pbUsingExternal, "HRESULT")
        return result
    }

    /**
     * The SetDrawParameters method specifies which part of the original video will appear at which position of the screen.
     * @param {Pointer<RECT>} prcSource Pointer to the <b>RECT</b> structure of the original video.
     * @param {Pointer<RECT>} prcTarget Pointer to the <b>RECT</b> that indicates where the video will appear on the screen.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iddrawexclmodevideo-setdrawparameters
     */
    SetDrawParameters(prcSource, prcTarget) {
        result := ComCall(7, this, RECT.Ptr, prcSource, RECT.Ptr, prcTarget, "HRESULT")
        return result
    }

    /**
     * The GetNativeVideoProps method retrieves the current video size and picture aspect ratio of the Overlay Mixer's primary stream.
     * @remarks
     * The filter graph should look for the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-video-size-changed">EC_VIDEO_SIZE_CHANGED</a> event, and on its receipt call this method to adjust the aspect ratio and position.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iddrawexclmodevideo-getnativevideoprops
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
     * @remarks
     * An application should use this method to get notification about the overlay size, position, or color key change happening, so that it can hide or show the video, or adjust the video at the start, end, or during playback. By calling this method, an application can access the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iddrawexclmodevideocallback">IDDrawExclModeVideoCallback</a> interface and pass the pointer to that interface to the Overlay Mixer.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iddrawexclmodevideo-setcallbackinterface
     */
    SetCallbackInterface(pCallback, dwFlags) {
        result := ComCall(9, this, "ptr", pCallback, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDDrawExclModeVideo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDDrawObject := CallbackCreate(GetMethod(implObj, "SetDDrawObject"), flags, 2)
        this.vtbl.GetDDrawObject := CallbackCreate(GetMethod(implObj, "GetDDrawObject"), flags, 3)
        this.vtbl.SetDDrawSurface := CallbackCreate(GetMethod(implObj, "SetDDrawSurface"), flags, 2)
        this.vtbl.GetDDrawSurface := CallbackCreate(GetMethod(implObj, "GetDDrawSurface"), flags, 3)
        this.vtbl.SetDrawParameters := CallbackCreate(GetMethod(implObj, "SetDrawParameters"), flags, 3)
        this.vtbl.GetNativeVideoProps := CallbackCreate(GetMethod(implObj, "GetNativeVideoProps"), flags, 5)
        this.vtbl.SetCallbackInterface := CallbackCreate(GetMethod(implObj, "SetCallbackInterface"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDDrawObject)
        CallbackFree(this.vtbl.GetDDrawObject)
        CallbackFree(this.vtbl.SetDDrawSurface)
        CallbackFree(this.vtbl.GetDDrawSurface)
        CallbackFree(this.vtbl.SetDrawParameters)
        CallbackFree(this.vtbl.GetNativeVideoProps)
        CallbackFree(this.vtbl.SetCallbackInterface)
    }
}
