#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITDigitsGatheredEvent interface exposes methods that allow an application to retrieve data when the TAPI Server sends an event indicating that the Server has gathered digits required by the application.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itdigitsgatheredevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITDigitsGatheredEvent extends IDispatch{
    /**
     * The interface identifier for ITDigitsGatheredEvent
     * @type {Guid}
     */
    static IID => Guid("{e52ec4c1-cba3-441a-9e6a-93cb909e9724}")

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
     * @param {Pointer<BSTR>} ppDigits 
     * @returns {HRESULT} 
     */
    get_Digits(ppDigits) {
        result := ComCall(8, this, "ptr", ppDigits, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pGatherTermination 
     * @returns {HRESULT} 
     */
    get_GatherTermination(pGatherTermination) {
        result := ComCall(9, this, "int*", pGatherTermination, "int")
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
