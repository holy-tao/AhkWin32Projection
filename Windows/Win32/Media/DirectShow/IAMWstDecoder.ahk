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
     * 
     * @param {Pointer<Integer>} lpLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iwstdec/nf-iwstdec-iamwstdecoder-getdecoderlevel
     */
    GetDecoderLevel(lpLevel) {
        lpLevelMarshal := lpLevel is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, lpLevelMarshal, lpLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpService 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iwstdec/nf-iwstdec-iamwstdecoder-getcurrentservice
     */
    GetCurrentService(lpService) {
        lpServiceMarshal := lpService is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, lpServiceMarshal, lpService, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iwstdec/nf-iwstdec-iamwstdecoder-getservicestate
     */
    GetServiceState(lpState) {
        lpStateMarshal := lpState is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, lpStateMarshal, lpState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iwstdec/nf-iwstdec-iamwstdecoder-setservicestate
     */
    SetServiceState(State) {
        result := ComCall(6, this, "int", State, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BITMAPINFOHEADER>} lpbmih 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iwstdec/nf-iwstdec-iamwstdecoder-getoutputformat
     */
    GetOutputFormat(lpbmih) {
        result := ComCall(7, this, "ptr", lpbmih, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BITMAPINFO>} lpbmi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iwstdec/nf-iwstdec-iamwstdecoder-setoutputformat
     */
    SetOutputFormat(lpbmi) {
        result := ComCall(8, this, "ptr", lpbmi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwPhysColor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iwstdec/nf-iwstdec-iamwstdecoder-getbackgroundcolor
     */
    GetBackgroundColor(pdwPhysColor) {
        pdwPhysColorMarshal := pdwPhysColor is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pdwPhysColorMarshal, pdwPhysColor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwPhysColor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iwstdec/nf-iwstdec-iamwstdecoder-setbackgroundcolor
     */
    SetBackgroundColor(dwPhysColor) {
        result := ComCall(10, this, "uint", dwPhysColor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} lpbOption 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iwstdec/nf-iwstdec-iamwstdecoder-getredrawalways
     */
    GetRedrawAlways(lpbOption) {
        result := ComCall(11, this, "ptr", lpbOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bOption 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iwstdec/nf-iwstdec-iamwstdecoder-setredrawalways
     */
    SetRedrawAlways(bOption) {
        result := ComCall(12, this, "int", bOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iwstdec/nf-iwstdec-iamwstdecoder-getdrawbackgroundmode
     */
    GetDrawBackgroundMode(lpMode) {
        lpModeMarshal := lpMode is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, lpModeMarshal, lpMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iwstdec/nf-iwstdec-iamwstdecoder-setdrawbackgroundmode
     */
    SetDrawBackgroundMode(Mode) {
        result := ComCall(14, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bAnswer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iwstdec/nf-iwstdec-iamwstdecoder-setanswermode
     */
    SetAnswerMode(bAnswer) {
        result := ComCall(15, this, "int", bAnswer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbAnswer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iwstdec/nf-iwstdec-iamwstdecoder-getanswermode
     */
    GetAnswerMode(pbAnswer) {
        result := ComCall(16, this, "ptr", pbAnswer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bHoldPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iwstdec/nf-iwstdec-iamwstdecoder-setholdpage
     */
    SetHoldPage(bHoldPage) {
        result := ComCall(17, this, "int", bHoldPage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbHoldPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iwstdec/nf-iwstdec-iamwstdecoder-getholdpage
     */
    GetHoldPage(pbHoldPage) {
        result := ComCall(18, this, "ptr", pbHoldPage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<AM_WST_PAGE>} pWstPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iwstdec/nf-iwstdec-iamwstdecoder-getcurrentpage
     */
    GetCurrentPage(pWstPage) {
        result := ComCall(19, this, "ptr", pWstPage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {AM_WST_PAGE} WstPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iwstdec/nf-iwstdec-iamwstdecoder-setcurrentpage
     */
    SetCurrentPage(WstPage) {
        result := ComCall(20, this, "ptr", WstPage, "HRESULT")
        return result
    }
}
