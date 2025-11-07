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
     * 
     * @param {Pointer<Integer>} lpLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-getdecoderlevel
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
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-getcurrentservice
     */
    GetCurrentService(lpService) {
        lpServiceMarshal := lpService is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, lpServiceMarshal, lpService, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Service 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-setcurrentservice
     */
    SetCurrentService(Service) {
        result := ComCall(5, this, "int", Service, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-getservicestate
     */
    GetServiceState(lpState) {
        lpStateMarshal := lpState is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, lpStateMarshal, lpState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-setservicestate
     */
    SetServiceState(State) {
        result := ComCall(7, this, "int", State, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BITMAPINFOHEADER>} lpbmih 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-getoutputformat
     */
    GetOutputFormat(lpbmih) {
        result := ComCall(8, this, "ptr", lpbmih, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BITMAPINFO>} lpbmi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-setoutputformat
     */
    SetOutputFormat(lpbmi) {
        result := ComCall(9, this, "ptr", lpbmi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwPhysColor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-getbackgroundcolor
     */
    GetBackgroundColor(pdwPhysColor) {
        pdwPhysColorMarshal := pdwPhysColor is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pdwPhysColorMarshal, pdwPhysColor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwPhysColor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-setbackgroundcolor
     */
    SetBackgroundColor(dwPhysColor) {
        result := ComCall(11, this, "uint", dwPhysColor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} lpbOption 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-getredrawalways
     */
    GetRedrawAlways(lpbOption) {
        lpbOptionMarshal := lpbOption is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, lpbOptionMarshal, lpbOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bOption 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-setredrawalways
     */
    SetRedrawAlways(bOption) {
        result := ComCall(13, this, "int", bOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-getdrawbackgroundmode
     */
    GetDrawBackgroundMode(lpMode) {
        lpModeMarshal := lpMode is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, lpModeMarshal, lpMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/il21dec/nf-il21dec-iamline21decoder-setdrawbackgroundmode
     */
    SetDrawBackgroundMode(Mode) {
        result := ComCall(15, this, "int", Mode, "HRESULT")
        return result
    }
}
