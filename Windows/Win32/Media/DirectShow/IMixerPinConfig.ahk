#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMixerPinConfig interface is exposed on the input pins of the Overlay Mixer filter and contains methods that manipulate video streams in various ways.
 * @see https://learn.microsoft.com/windows/win32/api//content/mpconfig/nn-mpconfig-imixerpinconfig
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMixerPinConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMixerPinConfig
     * @type {Guid}
     */
    static IID => Guid("{593cdde1-0759-11d1-9e69-00c04fd7c15b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRelativePosition", "GetRelativePosition", "SetZOrder", "GetZOrder", "SetColorKey", "GetColorKey", "SetBlendingParameter", "GetBlendingParameter", "SetAspectRatioMode", "GetAspectRatioMode", "SetStreamTransparent", "GetStreamTransparent"]

    /**
     * The SetRelativePosition method sets the position of the stream in the display window.
     * @remarks
     * This method assumes window coordinates of {0, 0, 10,000, 10,000}. Therefore, if you want your video stream to be rendered in the bottom right quarter of the display window, you would call this method with the parameters {5,000, 5,000, 10,000, 10,000}.
     * 
     * <div class="alert"><b>Note</b>  Values greater than 10,000 are invalid and will cause an error.</div>
     * <div> </div>
     * @param {Integer} dwLeft Value specifying the x-coordinate in the upper-left corner of the display window.
     * @param {Integer} dwTop Value specifying the y-coordinate in the upper-left corner of the display window.
     * @param {Integer} dwRight Value specifying the x-coordinate in the bottom-right corner of the display window.
     * @param {Integer} dwBottom Value specifying the y-coordinate in the bottom-right corner of the display window.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Coordinates not in the {0, 0, 10,000, 10,000} range.
     * 
     * </td>
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mpconfig/nf-mpconfig-imixerpinconfig-setrelativeposition
     */
    SetRelativePosition(dwLeft, dwTop, dwRight, dwBottom) {
        result := ComCall(3, this, "uint", dwLeft, "uint", dwTop, "uint", dwRight, "uint", dwBottom, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetRelativePosition method retrieves the position of the stream in the display window.
     * @remarks
     * This method assumes window coordinates of {0, 0, 10,000, 10,000}. If the video stream is being rendered in the bottom right quarter of the display window, this method would return {5,000, 5,000, 10,000, 10,000}.
     * @param {Pointer<Integer>} pdwLeft Pointer to a value indicating the x-coordinate in the top-left corner of the display window.
     * @param {Pointer<Integer>} pdwTop Pointer to a value indicating the y-coordinate in the top-left corner of the display window.
     * @param {Pointer<Integer>} pdwRight Pointer to a value indicating the x-coordinate in the bottom-right corner of the display window.
     * @param {Pointer<Integer>} pdwBottom Pointer to a value indicating the y-coordinate in the bottom-right corner of the display window.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Coordinates not in the {0, 0, 10,000, 10,000} range.
     * 
     * </td>
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mpconfig/nf-mpconfig-imixerpinconfig-getrelativeposition
     */
    GetRelativePosition(pdwLeft, pdwTop, pdwRight, pdwBottom) {
        pdwLeftMarshal := pdwLeft is VarRef ? "uint*" : "ptr"
        pdwTopMarshal := pdwTop is VarRef ? "uint*" : "ptr"
        pdwRightMarshal := pdwRight is VarRef ? "uint*" : "ptr"
        pdwBottomMarshal := pdwBottom is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwLeftMarshal, pdwLeft, pdwTopMarshal, pdwTop, pdwRightMarshal, pdwRight, pdwBottomMarshal, pdwBottom, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetZOrder method sets the z-order of a particular video stream.
     * @remarks
     * The z-order indicates which streams can clip other streams. Images with larger z-values are always in front of images with smaller z-values.
     * 
     * The relative order of multiple streams is significant only if the video images overlap.
     * 
     * Specifying the same z-order for two overlapping streams can cause strange video artifacts.
     * @param {Integer} dwZOrder Value indicating the order in which streams will clip each other.
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api//content/mpconfig/nf-mpconfig-imixerpinconfig-setzorder
     */
    SetZOrder(dwZOrder) {
        result := ComCall(5, this, "uint", dwZOrder, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetZOrder method retrieves the z-order of a particular video stream.
     * @remarks
     * Images with larger z-values are always in front of images with smaller z-values.
     * @param {Pointer<Integer>} pdwZOrder Pointer to a value indicating the order in which streams will clip each other.
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api//content/mpconfig/nf-mpconfig-imixerpinconfig-getzorder
     */
    GetZOrder(pdwZOrder) {
        pdwZOrderMarshal := pdwZOrder is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwZOrderMarshal, pdwZOrder, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetColorKey method sets the color key being used by a video stream.
     * @remarks
     * The term <i>color key</i> has different meanings depending on which stream it is referring to. The color key of the primary stream refers to the destination color key being used by the overlay surface. The color key of the secondary stream refers to the source color key used, when blitting from an offscreen surface to the primary surface.
     * 
     * Applications should set the color key of the primary pin to an obscure color (some color which, in all probability, will not be present on the desktop). Overlay mixer filters will try to pick an obscure color, but if the application knows that the specified color is part of some other content, then the application should change it.
     * 
     * Setting the color key on the secondary stream can be used to make the stream transparent and enable nonrectangular images. For example, if the secondary stream is closed-captioned text, then the closed-captioned text decoder should paint a solid color in the background and then set the color key on the corresponding pin to that color. This ensures that all pixels are transferred except those specified by the color key. If possible, applications should set the color key of the secondary stream to the same as that of the primary stream to give a slight performance advantage.
     * 
     * Setting this value on the primary stream sets the destination color key being used by the overlay surface. By default, the destination color key is used as the color key for all transparent (secondary) streams.
     * 
     * Valid arguments for the <i>pColorKey</i> parameter include CK_INDEX when video display mode is set to 256 colors, and CK_RGB when video display mode is set to a higher color depth such as hi-color, 24-bit, or 32-bit. The CK_RGB flag must be specified along with the CK_INDEX. If CK_INDEX flag is set then the index will be used as palette index in 256 color mode. But you must provide a <b>COLORREF</b> with a valid true color so that if the display mode is changed on the fly, DirectShow can switch to using the specified true color. This is because a number of true colors can be mapped to a single palette index, but going the other way from the palette index to a true color is not one-to-one.
     * 
     * <div class="alert"><b>Note</b>  Currently, this method is implemented only for the primary input pin.</div>
     * <div> </div>
     * @param {Pointer<COLORKEY>} pColorKey Pointer to a [COLORKEY](../strmif/ns-strmif-colorkey.md) structure.
     * @returns {HRESULT} Returns an <c>HRESULT</c> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/mpconfig/nf-mpconfig-imixerpinconfig-setcolorkey
     */
    SetColorKey(pColorKey) {
        result := ComCall(7, this, "ptr", pColorKey, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetColorKey method retrieves the color key being used by a video stream.
     * @remarks
     * Getting the value on the primary stream will retrieve the destination color key being used by the overlay surface. Getting this value on the secondary pin returns the color key being used by that particular stream.
     * 
     * Current DirectShow implementation of this interface can return <b>NULL</b> for either the <i>pColorKey</i> or the <i>pColor</i> parameters; however, the method will fail and return E_INVALIDARG if both parameters are <b>NULL</b>.
     * 
     * <div class="alert"><b>Note</b>  The <b>DWORD</b> value returned by the <i>pColor</i> parameter is the actual color being used. So, if the bit depth of the display is 8, 16, 24, 32 the last 8, 16, 24 or 32 bits of the <b>DWORD</b> specify the actual value of the color key.</div>
     * <div> </div>
     * @param {Pointer<COLORKEY>} pColorKey Pointer to a [COLORKEY](../strmif/ns-strmif-colorkey.md) structure that contains the key type and a palette index.
     * @param {Pointer<Integer>} pColor Pointer to a value indicating the 8-bit palette index of the [COLORKEY](../strmif/ns-strmif-colorkey.md) returned if the current display mode is 8-bit palettized. Otherwise it is a value representing the color key in the pixel format of the current display mode.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid arguments, both parameters are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <c>GetColorKey</c> failed because the color key isn't known.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NOERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mpconfig/nf-mpconfig-imixerpinconfig-getcolorkey
     */
    GetColorKey(pColorKey, pColor) {
        pColorMarshal := pColor is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pColorKey, pColorMarshal, pColor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetBlendingParameter method sets the blending parameter that defines how a secondary stream is blended with a primary stream.
     * @remarks
     * The value of the <i>dwBlendingParameter</i> parameter must be between 0 and 255, where 0 makes the secondary stream invisible and 255 makes the primary stream invisible in the area that the secondary stream occupies. If no value is set the default is 255.
     * 
     * This method is not intended to be called on the primary stream.
     * 
     * <div class="alert"><b>Note</b>  Current DirectShow implementation of this interface allows only values of 0 or 255 for the <i>dwBlendingParameter</i> parameter. Any other values are invalid.</div>
     * <div> </div>
     * @param {Integer} dwBlendingParameter Value between 0 and 255 that indicates the amount of blending between a primary stream and a secondary stream.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method called on primary stream.
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
     * Value outside of possible range (0 to 255).
     * 
     * </td>
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mpconfig/nf-mpconfig-imixerpinconfig-setblendingparameter
     */
    SetBlendingParameter(dwBlendingParameter) {
        result := ComCall(9, this, "uint", dwBlendingParameter, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetBlendingParameter method retrieves the value of the blending parameter that defines how a secondary stream is blended with a primary stream.
     * @remarks
     * A value of zero indicates that the secondary stream is invisible; a value of 255 indicates the primary stream is invisible in the area that the secondary stream occupies.
     * @param {Pointer<Integer>} pdwBlendingParameter Pointer to a value between 0 and 255 that indicates the amount of blending between a primary stream and a secondary stream.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method called on primary stream.
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
     * Value outside of possible range (0-255).
     * 
     * </td>
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mpconfig/nf-mpconfig-imixerpinconfig-getblendingparameter
     */
    GetBlendingParameter(pdwBlendingParameter) {
        pdwBlendingParameterMarshal := pdwBlendingParameter is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pdwBlendingParameterMarshal, pdwBlendingParameter, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetAspectRatioMode method sets the aspect ratio correction mode for window resizing.
     * @remarks
     * Currently this function is implemented only on the primary pin of the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/overlay-mixer-filter">Overlay Mixer</a> filter. Calling it on a secondary pin will result in an error.
     * @param {Integer} amAspectRatioMode Value specifying one of the <a href="https://docs.microsoft.com/windows/desktop/api/mpconfig/ne-mpconfig-am_aspect_ratio_mode">AM_ASPECT_RATIO_MODE</a> enumerated type members.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method called on secondary stream.
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
     * Invalid argument.
     * 
     * </td>
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mpconfig/nf-mpconfig-imixerpinconfig-setaspectratiomode
     */
    SetAspectRatioMode(amAspectRatioMode) {
        result := ComCall(11, this, "int", amAspectRatioMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetAspectRatioMode method retrieves the aspect ratio correction mode for window resizing.
     * @param {Pointer<Integer>} pamAspectRatioMode Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mpconfig/ne-mpconfig-am_aspect_ratio_mode">AM_ASPECT_RATIO_MODE</a> enumerated type member.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method called on secondary stream.
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
     * Value invalid or <b>NULL</b>.
     * 
     * </td>
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mpconfig/nf-mpconfig-imixerpinconfig-getaspectratiomode
     */
    GetAspectRatioMode(pamAspectRatioMode) {
        pamAspectRatioModeMarshal := pamAspectRatioMode is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pamAspectRatioModeMarshal, pamAspectRatioMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetStreamTransparent method sets the stream to transparent.
     * @param {BOOL} bStreamTransparent Value specifying the transparency of the stream. Pass in <b>TRUE</b> to indicate stream is transparent; <b>FALSE</b> to indicate not a transparent stream.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/mpconfig/nf-mpconfig-imixerpinconfig-setstreamtransparent
     */
    SetStreamTransparent(bStreamTransparent) {
        result := ComCall(13, this, "int", bStreamTransparent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetStreamTransparent method determines whether a stream is transparent.
     * @param {Pointer<BOOL>} pbStreamTransparent Pointer to a value indicating whether the stream is transparent. <b>TRUE</b> indicates transparent stream; <b>FALSE</b> indicates not a transparent stream.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method is not supported.
     * 
     * </td>
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mpconfig/nf-mpconfig-imixerpinconfig-getstreamtransparent
     */
    GetStreamTransparent(pbStreamTransparent) {
        pbStreamTransparentMarshal := pbStreamTransparent is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, pbStreamTransparentMarshal, pbStreamTransparent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
