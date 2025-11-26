#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMWstDecoder interface sets and retrieves information about World Standard Teletext (WST). The WST Decoder filter implements this interface.
 * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nn-iwstdec-iamwstdecoder
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMWstDecoder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMWstDecoder
     * @type {Guid}
     */
    static IID => Guid("{c056de21-75c2-11d3-a184-00105aef9f33}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDecoderLevel", "GetCurrentService", "GetServiceState", "SetServiceState", "GetOutputFormat", "SetOutputFormat", "GetBackgroundColor", "SetBackgroundColor", "GetRedrawAlways", "SetRedrawAlways", "GetDrawBackgroundMode", "SetDrawBackgroundMode", "SetAnswerMode", "GetAnswerMode", "SetHoldPage", "GetHoldPage", "GetCurrentPage", "SetCurrentPage"]

    /**
     * Applications use the GetDecoderLevel method to retrieve the WST decoder level. This method is not implemented and always returns AM_WST_LEVEL_1_5.
     * @param {Pointer<Integer>} lpLevel Receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iwstdec/ne-iwstdec-am_wst_level">AM_WST_LEVEL</a> enumeration, indicting the decoder level.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nf-iwstdec-iamwstdecoder-getdecoderlevel
     */
    GetDecoderLevel(lpLevel) {
        lpLevelMarshal := lpLevel is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, lpLevelMarshal, lpLevel, "HRESULT")
        return result
    }

    /**
     * Applications use the GetCurrentService method to retrieve the current WST service.
     * @param {Pointer<Integer>} lpService Specifies a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iwstdec/ne-iwstdec-am_wst_service">AM_WST_SERVICE</a> enumeration to receive the service currently being used.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>AM_WST_SERVICE_None</td>
     * <td>No service is currently available.</td>
     * </tr>
     * <tr>
     * <td>AM_WST_SERVICE_Text</td>
     * <td>The service is providing text.</td>
     * </tr>
     * <tr>
     * <td>AM_WST_SERVICE_IDS</td>
     * <td>The service is providing IDS data.</td>
     * </tr>
     * <tr>
     * <td>AM_WST_SERVICE_Invalid</td>
     * <td>The service is invalid.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nf-iwstdec-iamwstdecoder-getcurrentservice
     */
    GetCurrentService(lpService) {
        lpServiceMarshal := lpService is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, lpServiceMarshal, lpService, "HRESULT")
        return result
    }

    /**
     * Applications use the GetServiceState method to retrieve the current service state.
     * @param {Pointer<Integer>} lpState Pointer to a variable that receives the state, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iwstdec/ne-iwstdec-am_wst_state">AM_WST_STATE</a> enumeration. The following values are possible.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>AM_WST_STATE_On</td>
     * <td>The WST service is on.</td>
     * </tr>
     * <tr>
     * <td>AM_WST_STATE_Off</td>
     * <td>The WST service is off.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nf-iwstdec-iamwstdecoder-getservicestate
     */
    GetServiceState(lpState) {
        lpStateMarshal := lpState is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, lpStateMarshal, lpState, "HRESULT")
        return result
    }

    /**
     * Applications use the SetServiceState method to assign the service state.
     * @param {Integer} State Specifies a member of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iwstdec/ne-iwstdec-am_wst_state">AM_WST_STATE</a> enumeration to assign the service state.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>AM_WST_STATE_On</td>
     * <td>Closed captioning on.</td>
     * </tr>
     * <tr>
     * <td>AM_WST_STATE_Off</td>
     * <td>Closed captioning off.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise, it returns an <code>HRESULT</code> error code.
     * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nf-iwstdec-iamwstdecoder-setservicestate
     */
    SetServiceState(State) {
        result := ComCall(6, this, "int", State, "HRESULT")
        return result
    }

    /**
     * Downstream filters use the GetOutputFormat method to retrieve the size, bit depth, and other parameters of the output video.
     * @param {Pointer<BITMAPINFOHEADER>} lpbmih A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure that receives the size, bit depth, and other properties of the output video.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nf-iwstdec-iamwstdecoder-getoutputformat
     */
    GetOutputFormat(lpbmih) {
        result := ComCall(7, this, "ptr", lpbmih, "HRESULT")
        return result
    }

    /**
     * Downstream filters use the SetOutputFormat method to define an output video format.
     * @param {Pointer<BITMAPINFO>} lpbmi A pointer to a  <b>BITMAPINFO</b> structure that describes the output video format, such as size, bit depth, and other properties.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * So far, downstream filters have defined no output format.
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
     * Downstream filters have already defined an output format.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nf-iwstdec-iamwstdecoder-setoutputformat
     */
    SetOutputFormat(lpbmi) {
        result := ComCall(8, this, "ptr", lpbmi, "HRESULT")
        return result
    }

    /**
     * Downstream filters use the GetBackgroundColor method to retrieve the current physical color used in color keying the background for overlay mixing.
     * @param {Pointer<Integer>} pdwPhysColor Receives the physical color as an RGB value.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nf-iwstdec-iamwstdecoder-getbackgroundcolor
     */
    GetBackgroundColor(pdwPhysColor) {
        pdwPhysColorMarshal := pdwPhysColor is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pdwPhysColorMarshal, pdwPhysColor, "HRESULT")
        return result
    }

    /**
     * Downstream filters use the SetBackgroundColor method to assign the physical color to be used in color keying the background for overlay mixing.
     * @param {Integer} dwPhysColor Specifies a <b>DWORD</b> containing the physical color.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nf-iwstdec-iamwstdecoder-setbackgroundcolor
     */
    SetBackgroundColor(dwPhysColor) {
        result := ComCall(10, this, "uint", dwPhysColor, "HRESULT")
        return result
    }

    /**
     * Downstream filters use the GetRedrawAlways method to retrieve a value that indicates whether the whole output bitmap is redrawn for each sample.
     * @param {Pointer<BOOL>} lpbOption Pointer to a <b>BOOL</b> to receive the redraw-always value.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td><b>TRUE</b></td>
     * <td>Redraw the whole output bitmap for each sample.</td>
     * </tr>
     * <tr>
     * <td><b>FALSE</b></td>
     * <td>Do not redraw the whole output bitmap for each sample.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nf-iwstdec-iamwstdecoder-getredrawalways
     */
    GetRedrawAlways(lpbOption) {
        lpbOptionMarshal := lpbOption is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, lpbOptionMarshal, lpbOption, "HRESULT")
        return result
    }

    /**
     * Downstream filters use the SetRedrawAlways method to determine whether the whole output bitmap should be redrawn for each sample.
     * @param {BOOL} bOption Specifies a <b>BOOL</b> to assign whether the whole output bitmap should be redrawn for each sample.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td><b>TRUE</b></td>
     * <td>Redraw the whole output bitmap for each sample.</td>
     * </tr>
     * <tr>
     * <td><b>FALSE</b></td>
     * <td>Do not redraw the whole output bitmap for each sample.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nf-iwstdec-iamwstdecoder-setredrawalways
     */
    SetRedrawAlways(bOption) {
        result := ComCall(12, this, "int", bOption, "HRESULT")
        return result
    }

    /**
     * Downstream filters use the GetDrawBackgroundMode method to determine whether the caption text background is opaque or transparent.
     * @param {Pointer<Integer>} lpMode 
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nf-iwstdec-iamwstdecoder-getdrawbackgroundmode
     */
    GetDrawBackgroundMode(lpMode) {
        lpModeMarshal := lpMode is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, lpModeMarshal, lpMode, "HRESULT")
        return result
    }

    /**
     * Downstream filters use the SetDrawBackgroundMode method to assign whether the caption text background is to be opaque or transparent.
     * @param {Integer} Mode A member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iwstdec/ne-iwstdec-am_wst_drawbgmode">AM_WST_DRAWBGMODE</a> enumeration that specifies whether the caption text background is to be opaque or transparent.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>AM_WST_DRAWBGMODE_Opaque</td>
     * <td>Caption text background is opaque.</td>
     * </tr>
     * <tr>
     * <td>AM_WST_DRAWBGMODE_Transparent</td>
     * <td>Caption text background is transparent.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nf-iwstdec-iamwstdecoder-setdrawbackgroundmode
     */
    SetDrawBackgroundMode(Mode) {
        result := ComCall(14, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * Downstream filters use the SetAnswerMode method to assign the current answer mode.
     * @param {BOOL} bAnswer Specifies the current answer mode.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td><b>TRUE</b></td>
     * <td>Hidden text exposed.</td>
     * </tr>
     * <tr>
     * <td><b>FALSE</b></td>
     * <td>Hidden text not exposed.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nf-iwstdec-iamwstdecoder-setanswermode
     */
    SetAnswerMode(bAnswer) {
        result := ComCall(15, this, "int", bAnswer, "HRESULT")
        return result
    }

    /**
     * Downstream filters use the GetAnswerMode method to retrieve the current answer mode.
     * @param {Pointer<BOOL>} pbAnswer Receives the current answer mode.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td><b>TRUE</b></td>
     * <td>Hidden text exposed.</td>
     * </tr>
     * <tr>
     * <td><b>FALSE</b></td>
     * <td>Hidden text not exposed.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> code.
     * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nf-iwstdec-iamwstdecoder-getanswermode
     */
    GetAnswerMode(pbAnswer) {
        pbAnswerMarshal := pbAnswer is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, pbAnswerMarshal, pbAnswer, "HRESULT")
        return result
    }

    /**
     * Downstream filters use the SetHoldPage method to tell the WST decoder to hold the current WST page. When the WST decoder holds a page, any updates from the TV stream are turned off. It is as though the page was paused in real time.
     * @param {BOOL} bHoldPage Specifies whether to hold the current page.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td><b>TRUE</b></td>
     * <td>Hold the current page</td>
     * </tr>
     * <tr>
     * <td><b>FALSE</b></td>
     * <td>Release the current page.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nf-iwstdec-iamwstdecoder-setholdpage
     */
    SetHoldPage(bHoldPage) {
        result := ComCall(17, this, "int", bHoldPage, "HRESULT")
        return result
    }

    /**
     * Downstream filters use the GetHoldPage method to determine whether the current WST page is held. When the WST decoder holds a page, any updates from the TV stream are turned off. It is though the page was paused in real time.
     * @param {Pointer<BOOL>} pbHoldPage Pointer to a <b>BOOL</b> to receive the status of the WST page.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td><b>TRUE</b></td>
     * <td>The current page is held.</td>
     * </tr>
     * <tr>
     * <td><b>FALSE</b></td>
     * <td>The current page is not held.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nf-iwstdec-iamwstdecoder-getholdpage
     */
    GetHoldPage(pbHoldPage) {
        pbHoldPageMarshal := pbHoldPage is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, pbHoldPageMarshal, pbHoldPage, "HRESULT")
        return result
    }

    /**
     * Downstream filters use the GetCurrentPage method to retrieve the current WST page.
     * @param {Pointer<AM_WST_PAGE>} pWstPage A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iwstdec/ns-iwstdec-am_wst_page">AM_WST_PAGE</a> structure to receive the current page.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nf-iwstdec-iamwstdecoder-getcurrentpage
     */
    GetCurrentPage(pWstPage) {
        result := ComCall(19, this, "ptr", pWstPage, "HRESULT")
        return result
    }

    /**
     * Downstream filters use the SetCurrentPage method to assign the current page.
     * @param {AM_WST_PAGE} WstPage Specifies an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iwstdec/ns-iwstdec-am_wst_page">AM_WST_PAGE</a> structure that is used to assign the current page.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nf-iwstdec-iamwstdecoder-setcurrentpage
     */
    SetCurrentPage(WstPage) {
        result := ComCall(20, this, "ptr", WstPage, "HRESULT")
        return result
    }
}
