#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Gdi\BITMAPINFO.ahk" { BITMAPINFO }
#Import "..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk" { BITMAPINFOHEADER }
#Import ".\AM_LINE21_CCSERVICE.ahk" { AM_LINE21_CCSERVICE }
#Import ".\AM_LINE21_CCLEVEL.ahk" { AM_LINE21_CCLEVEL }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\AM_LINE21_CCSTATE.ahk" { AM_LINE21_CCSTATE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\AM_LINE21_DRAWBGMODE.ahk" { AM_LINE21_DRAWBGMODE }

/**
 * The IAMLine21Decoder interface sets and retrieves information about closed captions.The Line 21 Decoder filter exposes this interface.
 * @see https://learn.microsoft.com/windows/win32/api/il21dec/nn-il21dec-iamline21decoder
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMLine21Decoder extends IUnknown {
    /**
     * The interface identifier for IAMLine21Decoder
     * @type {Guid}
     */
    static IID := Guid("{6e8d4a21-310c-11d0-b79a-00aa003767a7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMLine21Decoder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDecoderLevel       : IntPtr
        GetCurrentService     : IntPtr
        SetCurrentService     : IntPtr
        GetServiceState       : IntPtr
        SetServiceState       : IntPtr
        GetOutputFormat       : IntPtr
        SetOutputFormat       : IntPtr
        GetBackgroundColor    : IntPtr
        SetBackgroundColor    : IntPtr
        GetRedrawAlways       : IntPtr
        SetRedrawAlways       : IntPtr
        GetDrawBackgroundMode : IntPtr
        SetDrawBackgroundMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMLine21Decoder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetDecoderLevel method retrieves the closed-captioned decoder level.
     * @remarks
     * TeleCaption I and TeleCaption II are standards for closed caption decoders. The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/line-21-decoder-filter">Line 21 Decoder</a> filter supports TeleCaption II, which is backward compatible with TeleCaption I.
     * @param {Pointer<AM_LINE21_CCLEVEL>} lpLevel Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/il21dec/ne-il21dec-am_line21_cclevel">AM_LINE21_CCLEVEL</a> enumeration. The returned value is always <b>AM_L21_CCLEVEL_TC2</b> (TeleCaption II).
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
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-getdecoderlevel
     */
    GetDecoderLevel(lpLevel) {
        lpLevelMarshal := lpLevel is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, lpLevelMarshal, lpLevel, "HRESULT")
        return result
    }

    /**
     * The GetCurrentService method retrieves the current closed captioning service.
     * @param {Pointer<AM_LINE21_CCSERVICE>} lpService Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/il21dec/ne-il21dec-am_line21_ccservice">AM_LINE21_CCSERVICE</a> enumeration. The default service is CC1.
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
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-getcurrentservice
     */
    GetCurrentService(lpService) {
        lpServiceMarshal := lpService is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, lpServiceMarshal, lpService, "HRESULT")
        return result
    }

    /**
     * The SetCurrentService method sets the closed captioning service.
     * @param {AM_LINE21_CCSERVICE} Service Member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/il21dec/ne-il21dec-am_line21_ccservice">AM_LINE21_CCSERVICE</a> enumeration that specifies the closed captioning service. The default service is CC1.
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
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-setcurrentservice
     */
    SetCurrentService(Service) {
        result := ComCall(5, this, AM_LINE21_CCSERVICE, Service, "HRESULT")
        return result
    }

    /**
     * The GetServiceState method indicates whether closed captioning is on or off.
     * @remarks
     * By default, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/line-21-decoder-filter">Line 21 Decoder</a> enables closed captioning.
     * @param {Pointer<AM_LINE21_CCSTATE>} lpState Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/il21dec/ne-il21dec-am_line21_ccstate">AM_LINE21_CCSTATE</a> enumeration.
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
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-getservicestate
     */
    GetServiceState(lpState) {
        lpStateMarshal := lpState is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, lpStateMarshal, lpState, "HRESULT")
        return result
    }

    /**
     * The SetServiceState method enables or disables closed captions.
     * @param {AM_LINE21_CCSTATE} State Member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/il21dec/ne-il21dec-am_line21_ccstate">AM_LINE21_CCSTATE</a> enumeration, specify whether to enable or disable closed captions.
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
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-setservicestate
     */
    SetServiceState(State) {
        result := ComCall(7, this, AM_LINE21_CCSTATE, State, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-getoutputformat
     */
    GetOutputFormat(lpbmih) {
        result := ComCall(8, this, BITMAPINFOHEADER.Ptr, lpbmih, "HRESULT")
        return result
    }

    /**
     * The SetOutputFormat method sets the Line 21 Decoder filter's output format.
     * @param {Pointer<BITMAPINFO>} lpbmi Pointer to a <b>BITMAPINFO</b> structure that describes the output format.
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-setoutputformat
     */
    SetOutputFormat(lpbmi) {
        result := ComCall(9, this, BITMAPINFO.Ptr, lpbmi, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-getbackgroundcolor
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
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-setbackgroundcolor
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
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-getredrawalways
     */
    GetRedrawAlways(lpbOption) {
        lpbOptionMarshal := lpbOption is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, lpbOptionMarshal, lpbOption, "HRESULT")
        return result
    }

    /**
     * The SetRedrawAlways method specifies whether the Line 21 Decoder filter redraws the entire output bitmap for each sample.
     * @remarks
     * Generally, applications should not call this method. The downstream mixer or renderer filter should call this method with the value <b>TRUE</b> if it writes into the buffers that it receives from the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/line-21-decoder-filter">Line 21 Decoder</a> filter. Redrawing degrades performance and increases CPU load, because it negates any potential optimizations.
     * @param {BOOL} bOption 
     * @returns {HRESULT} Returns S_OK if successful, or an error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-setredrawalways
     */
    SetRedrawAlways(bOption) {
        result := ComCall(13, this, BOOL, bOption, "HRESULT")
        return result
    }

    /**
     * The GetDrawBackgroundMode method indicates whether the Line 21 Decoder filter draws the captions on a transparent background or an opaque background. By default, the caption background is opaque.
     * @param {Pointer<AM_LINE21_DRAWBGMODE>} lpMode Pointer a variable that receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/il21dec/ne-il21dec-am_line21_drawbgmode">AM_LINE21_DRAWBGMODE</a> enumeration.
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
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-getdrawbackgroundmode
     */
    GetDrawBackgroundMode(lpMode) {
        lpModeMarshal := lpMode is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, lpModeMarshal, lpMode, "HRESULT")
        return result
    }

    /**
     * The SetDrawBackgroundMode method specifies whether the Line 21 Decoder filter draws the captions on a transparent background or an opaque background. By default, the caption background is opaque.
     * @param {AM_LINE21_DRAWBGMODE} _Mode Specifies a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/il21dec/ne-il21dec-am_line21_drawbgmode">AM_LINE21_DRAWBGMODE</a> enumeration.
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
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-setdrawbackgroundmode
     */
    SetDrawBackgroundMode(_Mode) {
        result := ComCall(15, this, AM_LINE21_DRAWBGMODE, _Mode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMLine21Decoder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDecoderLevel := CallbackCreate(GetMethod(implObj, "GetDecoderLevel"), flags, 2)
        this.vtbl.GetCurrentService := CallbackCreate(GetMethod(implObj, "GetCurrentService"), flags, 2)
        this.vtbl.SetCurrentService := CallbackCreate(GetMethod(implObj, "SetCurrentService"), flags, 2)
        this.vtbl.GetServiceState := CallbackCreate(GetMethod(implObj, "GetServiceState"), flags, 2)
        this.vtbl.SetServiceState := CallbackCreate(GetMethod(implObj, "SetServiceState"), flags, 2)
        this.vtbl.GetOutputFormat := CallbackCreate(GetMethod(implObj, "GetOutputFormat"), flags, 2)
        this.vtbl.SetOutputFormat := CallbackCreate(GetMethod(implObj, "SetOutputFormat"), flags, 2)
        this.vtbl.GetBackgroundColor := CallbackCreate(GetMethod(implObj, "GetBackgroundColor"), flags, 2)
        this.vtbl.SetBackgroundColor := CallbackCreate(GetMethod(implObj, "SetBackgroundColor"), flags, 2)
        this.vtbl.GetRedrawAlways := CallbackCreate(GetMethod(implObj, "GetRedrawAlways"), flags, 2)
        this.vtbl.SetRedrawAlways := CallbackCreate(GetMethod(implObj, "SetRedrawAlways"), flags, 2)
        this.vtbl.GetDrawBackgroundMode := CallbackCreate(GetMethod(implObj, "GetDrawBackgroundMode"), flags, 2)
        this.vtbl.SetDrawBackgroundMode := CallbackCreate(GetMethod(implObj, "SetDrawBackgroundMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDecoderLevel)
        CallbackFree(this.vtbl.GetCurrentService)
        CallbackFree(this.vtbl.SetCurrentService)
        CallbackFree(this.vtbl.GetServiceState)
        CallbackFree(this.vtbl.SetServiceState)
        CallbackFree(this.vtbl.GetOutputFormat)
        CallbackFree(this.vtbl.SetOutputFormat)
        CallbackFree(this.vtbl.GetBackgroundColor)
        CallbackFree(this.vtbl.SetBackgroundColor)
        CallbackFree(this.vtbl.GetRedrawAlways)
        CallbackFree(this.vtbl.SetRedrawAlways)
        CallbackFree(this.vtbl.GetDrawBackgroundMode)
        CallbackFree(this.vtbl.SetDrawBackgroundMode)
    }
}
