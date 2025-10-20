#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITDigitGenerationEvent interface contains methods that describe digit generation events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itdigitgenerationevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITDigitGenerationEvent extends IDispatch{
    /**
     * The interface identifier for ITDigitGenerationEvent
     * @type {Guid}
     */
    static IID => Guid("{80d3bfad-57d9-11d2-a04a-00c04fb6809f}")

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
     * @param {Pointer<Int32>} plGenerationTermination 
     * @returns {HRESULT} 
     */
    get_GenerationTermination(plGenerationTermination) {
        result := ComCall(8, this, "int*", plGenerationTermination, "int")
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
        result := ComCall(9, this, "int*", plTickCount, "int")
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
        result := ComCall(10, this, "int*", plCallbackInstance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
