#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITCallStateEvent interface contains methods that retrieve the description of call state events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itcallstateevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITCallStateEvent extends IDispatch{
    /**
     * The interface identifier for ITCallStateEvent
     * @type {Guid}
     */
    static IID => Guid("{62f47097-95c9-11d0-835d-00aa003ccabd}")

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
     * @param {Pointer<Int32>} pCallState 
     * @returns {HRESULT} 
     */
    get_State(pCallState) {
        result := ComCall(8, this, "int*", pCallState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCEC 
     * @returns {HRESULT} 
     */
    get_Cause(pCEC) {
        result := ComCall(9, this, "int*", pCEC, "int")
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
