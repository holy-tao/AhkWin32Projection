#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMixerPinConfig interface is exposed on the input pins of the Overlay Mixer filter and contains methods that manipulate video streams in various ways.
 * @see https://docs.microsoft.com/windows/win32/api//mpconfig/nn-mpconfig-imixerpinconfig
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
     * @see https://docs.microsoft.com/windows/win32/api//mpconfig/nf-mpconfig-imixerpinconfig-setrelativeposition
     */
    SetRelativePosition(dwLeft, dwTop, dwRight, dwBottom) {
        result := ComCall(3, this, "uint", dwLeft, "uint", dwTop, "uint", dwRight, "uint", dwBottom, "HRESULT")
        return result
    }

    /**
     * The GetRelativePosition method retrieves the position of the stream in the display window.
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
     * @see https://docs.microsoft.com/windows/win32/api//mpconfig/nf-mpconfig-imixerpinconfig-getrelativeposition
     */
    GetRelativePosition(pdwLeft, pdwTop, pdwRight, pdwBottom) {
        pdwLeftMarshal := pdwLeft is VarRef ? "uint*" : "ptr"
        pdwTopMarshal := pdwTop is VarRef ? "uint*" : "ptr"
        pdwRightMarshal := pdwRight is VarRef ? "uint*" : "ptr"
        pdwBottomMarshal := pdwBottom is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwLeftMarshal, pdwLeft, pdwTopMarshal, pdwTop, pdwRightMarshal, pdwRight, pdwBottomMarshal, pdwBottom, "HRESULT")
        return result
    }

    /**
     * The SetZOrder method sets the z-order of a particular video stream.
     * @param {Integer} dwZOrder Value indicating the order in which streams will clip each other.
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//mpconfig/nf-mpconfig-imixerpinconfig-setzorder
     */
    SetZOrder(dwZOrder) {
        result := ComCall(5, this, "uint", dwZOrder, "HRESULT")
        return result
    }

    /**
     * The GetZOrder method retrieves the z-order of a particular video stream.
     * @param {Pointer<Integer>} pdwZOrder Pointer to a value indicating the order in which streams will clip each other.
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//mpconfig/nf-mpconfig-imixerpinconfig-getzorder
     */
    GetZOrder(pdwZOrder) {
        pdwZOrderMarshal := pdwZOrder is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwZOrderMarshal, pdwZOrder, "HRESULT")
        return result
    }

    /**
     * The SetColorKey method sets the color key being used by a video stream.
     * @param {Pointer<COLORKEY>} pColorKey Pointer to a [COLORKEY](../strmif/ns-strmif-colorkey.md) structure.
     * @returns {HRESULT} Returns an <code>HRESULT</code> value.
     * @see https://docs.microsoft.com/windows/win32/api//mpconfig/nf-mpconfig-imixerpinconfig-setcolorkey
     */
    SetColorKey(pColorKey) {
        result := ComCall(7, this, "ptr", pColorKey, "HRESULT")
        return result
    }

    /**
     * The GetColorKey method retrieves the color key being used by a video stream.
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
     * <code>GetColorKey</code> failed because the color key isn't known.
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
     * @see https://docs.microsoft.com/windows/win32/api//mpconfig/nf-mpconfig-imixerpinconfig-getcolorkey
     */
    GetColorKey(pColorKey, pColor) {
        pColorMarshal := pColor is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pColorKey, pColorMarshal, pColor, "HRESULT")
        return result
    }

    /**
     * The SetBlendingParameter method sets the blending parameter that defines how a secondary stream is blended with a primary stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//mpconfig/nf-mpconfig-imixerpinconfig-setblendingparameter
     */
    SetBlendingParameter(dwBlendingParameter) {
        result := ComCall(9, this, "uint", dwBlendingParameter, "HRESULT")
        return result
    }

    /**
     * The GetBlendingParameter method retrieves the value of the blending parameter that defines how a secondary stream is blended with a primary stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//mpconfig/nf-mpconfig-imixerpinconfig-getblendingparameter
     */
    GetBlendingParameter(pdwBlendingParameter) {
        pdwBlendingParameterMarshal := pdwBlendingParameter is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pdwBlendingParameterMarshal, pdwBlendingParameter, "HRESULT")
        return result
    }

    /**
     * The SetAspectRatioMode method sets the aspect ratio correction mode for window resizing.
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
     * @see https://docs.microsoft.com/windows/win32/api//mpconfig/nf-mpconfig-imixerpinconfig-setaspectratiomode
     */
    SetAspectRatioMode(amAspectRatioMode) {
        result := ComCall(11, this, "int", amAspectRatioMode, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//mpconfig/nf-mpconfig-imixerpinconfig-getaspectratiomode
     */
    GetAspectRatioMode(pamAspectRatioMode) {
        pamAspectRatioModeMarshal := pamAspectRatioMode is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pamAspectRatioModeMarshal, pamAspectRatioMode, "HRESULT")
        return result
    }

    /**
     * The SetStreamTransparent method sets the stream to transparent.
     * @param {BOOL} bStreamTransparent Value specifying the transparency of the stream. Pass in <b>TRUE</b> to indicate stream is transparent; <b>FALSE</b> to indicate not a transparent stream.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//mpconfig/nf-mpconfig-imixerpinconfig-setstreamtransparent
     */
    SetStreamTransparent(bStreamTransparent) {
        result := ComCall(13, this, "int", bStreamTransparent, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//mpconfig/nf-mpconfig-imixerpinconfig-getstreamtransparent
     */
    GetStreamTransparent(pbStreamTransparent) {
        pbStreamTransparentMarshal := pbStreamTransparent is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, pbStreamTransparentMarshal, pbStreamTransparent, "HRESULT")
        return result
    }
}
