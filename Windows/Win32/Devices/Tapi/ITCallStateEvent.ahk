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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Call", "get_State", "get_Cause", "get_CallbackInstance"]

    /**
     * 
     * @param {Pointer<ITCallInfo>} ppCallInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallstateevent-get_call
     */
    get_Call(ppCallInfo) {
        result := ComCall(7, this, "ptr*", ppCallInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCallState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallstateevent-get_state
     */
    get_State(pCallState) {
        pCallStateMarshal := pCallState is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pCallStateMarshal, pCallState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCEC 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallstateevent-get_cause
     */
    get_Cause(pCEC) {
        pCECMarshal := pCEC is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pCECMarshal, pCEC, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCallbackInstance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallstateevent-get_callbackinstance
     */
    get_CallbackInstance(plCallbackInstance) {
        plCallbackInstanceMarshal := plCallbackInstance is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plCallbackInstanceMarshal, plCallbackInstance, "HRESULT")
        return result
    }
}
