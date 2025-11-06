#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITCallInfo.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITDigitDetectionEvent interface contains methods that retrieve the description of DTMF digit events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itdigitdetectionevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITDigitDetectionEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITDigitDetectionEvent
     * @type {Guid}
     */
    static IID => Guid("{80d3bfac-57d9-11d2-a04a-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Call", "get_Digit", "get_DigitMode", "get_TickCount", "get_CallbackInstance"]

    /**
     * 
     * @returns {ITCallInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitdetectionevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCallInfo := 0, "HRESULT")
        return ITCallInfo(ppCallInfo)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitdetectionevent-get_digit
     */
    get_Digit() {
        result := ComCall(8, this, "char*", &pucDigit := 0, "HRESULT")
        return pucDigit
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitdetectionevent-get_digitmode
     */
    get_DigitMode() {
        result := ComCall(9, this, "int*", &pDigitMode := 0, "HRESULT")
        return pDigitMode
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitdetectionevent-get_tickcount
     */
    get_TickCount() {
        result := ComCall(10, this, "int*", &plTickCount := 0, "HRESULT")
        return plTickCount
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitdetectionevent-get_callbackinstance
     */
    get_CallbackInstance() {
        result := ComCall(11, this, "int*", &plCallbackInstance := 0, "HRESULT")
        return plCallbackInstance
    }
}
