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
     * 
     * @param {Pointer<ITCallInfo>} ppCallInfo 
     * @returns {HRESULT} 
     */
    get_Call(ppCallInfo) {
        result := ComCall(7, this, "ptr", ppCallInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pucDigit 
     * @returns {HRESULT} 
     */
    get_Digit(pucDigit) {
        result := ComCall(8, this, "char*", pucDigit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pDigitMode 
     * @returns {HRESULT} 
     */
    get_DigitMode(pDigitMode) {
        result := ComCall(9, this, "int*", pDigitMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plTickCount 
     * @returns {HRESULT} 
     */
    get_TickCount(plTickCount) {
        result := ComCall(10, this, "int*", plTickCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCallbackInstance 
     * @returns {HRESULT} 
     */
    get_CallbackInstance(plCallbackInstance) {
        result := ComCall(11, this, "int*", plCallbackInstance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
