#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMLine21Decoder interface sets and retrieves information about closed captions.The Line 21 Decoder filter exposes this interface.
 * @see https://docs.microsoft.com/windows/win32/api//il21dec/nn-il21dec-iamline21decoder
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMLine21Decoder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMLine21Decoder
     * @type {Guid}
     */
    static IID => Guid("{6e8d4a21-310c-11d0-b79a-00aa003767a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDecoderLevel", "GetCurrentService", "SetCurrentService", "GetServiceState", "SetServiceState", "GetOutputFormat", "SetOutputFormat", "GetBackgroundColor", "SetBackgroundColor", "GetRedrawAlways", "SetRedrawAlways", "GetDrawBackgroundMode", "SetDrawBackgroundMode"]

    /**
     * The GetDecoderLevel method retrieves the closed-captioned decoder level.
     * @param {Pointer<Integer>} lpLevel Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/il21dec/ne-il21dec-am_line21_cclevel">AM_LINE21_CCLEVEL</a> enumeration. The returned value is always <b>AM_L21_CCLEVEL_TC2</b> (TeleCaption II).
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument
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
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//il21dec/nf-il21dec-iamline21decoder-getdecoderlevel
     */
    GetDecoderLevel(lpLevel) {
        lpLevelMarshal := lpLevel is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, lpLevelMarshal, lpLevel, "HRESULT")
        return result
    }

    /**
     * The GetCurrentService method retrieves the current closed captioning service.
     * @param {Pointer<Integer>} lpService Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/il21dec/ne-il21dec-am_line21_ccservice">AM_LINE21_CCSERVICE</a> enumeration. The default service is CC1.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument
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
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//il21dec/nf-il21dec-iamline21decoder-getcurrentservice
     */
    GetCurrentService(lpService) {
        lpServiceMarshal := lpService is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, lpServiceMarshal, lpService, "HRESULT")
        return result
    }

    /**
     * The SetCurrentService method sets the closed captioning service.
     * @param {Integer} Service Member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/il21dec/ne-il21dec-am_line21_ccservice">AM_LINE21_CCSERVICE</a> enumeration that specifies the closed captioning service. The default service is CC1.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>Invalid argument</td>
     * </tr>
     * <tr>
     * <td>E_NOTIMPL</td>
     * <td>The requested service is not implemented.</td>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>Success</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//il21dec/nf-il21dec-iamline21decoder-setcurrentservice
     */
    SetCurrentService(Service) {
        result := ComCall(5, this, "int", Service, "HRESULT")
        return result
    }

    /**
     * The GetServiceState method indicates whether closed captioning is on or off.
     * @param {Pointer<Integer>} lpState Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/il21dec/ne-il21dec-am_line21_ccstate">AM_LINE21_CCSTATE</a> enumeration.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument
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
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//il21dec/nf-il21dec-iamline21decoder-getservicestate
     */
    GetServiceState(lpState) {
        lpStateMarshal := lpState is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, lpStateMarshal, lpState, "HRESULT")
        return result
    }

    /**
     * The SetServiceState method enables or disables closed captions.
     * @param {Integer} State Member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/il21dec/ne-il21dec-am_line21_ccstate">AM_LINE21_CCSTATE</a> enumeration, specify whether to enable or disable closed captions.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument
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
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//il21dec/nf-il21dec-iamline21decoder-setservicestate
     */
    SetServiceState(State) {
        result := ComCall(7, this, "int", State, "HRESULT")
        return result
    }

    /**
     * The GetOutputFormat method retrieves the Line 21 Decoder filter's output format.
     * @param {Pointer<BITMAPINFOHEADER>} lpbmih Pointer to a caller-allocated <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument
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
     * Success
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output format has not been set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//il21dec/nf-il21dec-iamline21decoder-getoutputformat
     */
    GetOutputFormat(lpbmih) {
        result := ComCall(8, this, "ptr", lpbmih, "HRESULT")
        return result
    }

    /**
     * The SetOutputFormat method sets the Line 21 Decoder filter's output format.
     * @param {Pointer<BITMAPINFO>} lpbmi Pointer to a <b>BITMAPINFO</b> structure that describes the output format.
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//il21dec/nf-il21dec-iamline21decoder-setoutputformat
     */
    SetOutputFormat(lpbmi) {
        result := ComCall(9, this, "ptr", lpbmi, "HRESULT")
        return result
    }

    /**
     * The GetBackgroundColor method retrieves the background color used by the Line 21 Decoder filter for overlay. The default background color is magenta.
     * @param {Pointer<Integer>} pdwPhysColor Pointer to a variable that receives the background color as a pixel color value. The meaning of the pixel value is defined by the bit depth of the filter's current output format.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument
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
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//il21dec/nf-il21dec-iamline21decoder-getbackgroundcolor
     */
    GetBackgroundColor(pdwPhysColor) {
        pdwPhysColorMarshal := pdwPhysColor is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pdwPhysColorMarshal, pdwPhysColor, "HRESULT")
        return result
    }

    /**
     * The SetBackgroundColor method sets the background color that the Line 21 Decoder filter uses for overlay. The default background color is magenta.
     * @param {Integer} dwPhysColor Sets the background color as a pixel color value. The meaning of the pixel value is defined by the bit depth of the filter's current output format.
     * @returns {HRESULT} Returns S_OK if successful, or an error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//il21dec/nf-il21dec-iamline21decoder-setbackgroundcolor
     */
    SetBackgroundColor(dwPhysColor) {
        result := ComCall(11, this, "uint", dwPhysColor, "HRESULT")
        return result
    }

    /**
     * The GetRedrawAlways method indicates whether the Line 21 Decoder filter redraws the entire output bitmap for each sample.
     * @param {Pointer<BOOL>} lpbOption 
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument
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
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//il21dec/nf-il21dec-iamline21decoder-getredrawalways
     */
    GetRedrawAlways(lpbOption) {
        lpbOptionMarshal := lpbOption is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, lpbOptionMarshal, lpbOption, "HRESULT")
        return result
    }

    /**
     * The SetRedrawAlways method specifies whether the Line 21 Decoder filter redraws the entire output bitmap for each sample.
     * @param {BOOL} bOption 
     * @returns {HRESULT} Returns S_OK if successful, or an error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//il21dec/nf-il21dec-iamline21decoder-setredrawalways
     */
    SetRedrawAlways(bOption) {
        result := ComCall(13, this, "int", bOption, "HRESULT")
        return result
    }

    /**
     * The GetDrawBackgroundMode method indicates whether the Line 21 Decoder filter draws the captions on a transparent background or an opaque background. By default, the caption background is opaque.
     * @param {Pointer<Integer>} lpMode Pointer a variable that receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/il21dec/ne-il21dec-am_line21_drawbgmode">AM_LINE21_DRAWBGMODE</a> enumeration.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument
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
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//il21dec/nf-il21dec-iamline21decoder-getdrawbackgroundmode
     */
    GetDrawBackgroundMode(lpMode) {
        lpModeMarshal := lpMode is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, lpModeMarshal, lpMode, "HRESULT")
        return result
    }

    /**
     * The SetDrawBackgroundMode method specifies whether the Line 21 Decoder filter draws the captions on a transparent background or an opaque background. By default, the caption background is opaque.
     * @param {Integer} Mode Specifies a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/il21dec/ne-il21dec-am_line21_drawbgmode">AM_LINE21_DRAWBGMODE</a> enumeration.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument
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
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//il21dec/nf-il21dec-iamline21decoder-setdrawbackgroundmode
     */
    SetDrawBackgroundMode(Mode) {
        result := ComCall(15, this, "int", Mode, "HRESULT")
        return result
    }
}
