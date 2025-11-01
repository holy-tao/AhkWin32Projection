#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<ITCallInfo>} ppCallInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitdetectionevent-get_call
     */
    get_Call(ppCallInfo) {
        result := ComCall(7, this, "ptr*", ppCallInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pucDigit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitdetectionevent-get_digit
     */
    get_Digit(pucDigit) {
        pucDigitMarshal := pucDigit is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, pucDigitMarshal, pucDigit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDigitMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitdetectionevent-get_digitmode
     */
    get_DigitMode(pDigitMode) {
        pDigitModeMarshal := pDigitMode is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pDigitModeMarshal, pDigitMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plTickCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitdetectionevent-get_tickcount
     */
    get_TickCount(plTickCount) {
        plTickCountMarshal := plTickCount is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plTickCountMarshal, plTickCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCallbackInstance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitdetectionevent-get_callbackinstance
     */
    get_CallbackInstance(plCallbackInstance) {
        plCallbackInstanceMarshal := plCallbackInstance is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, plCallbackInstanceMarshal, plCallbackInstance, "HRESULT")
        return result
    }
}
