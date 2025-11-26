#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITCallInfo.ahk
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
     * @type {ITCallInfo} 
     */
    Call {
        get => this.get_Call()
    }

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {Integer} 
     */
    Cause {
        get => this.get_Cause()
    }

    /**
     * @type {Integer} 
     */
    CallbackInstance {
        get => this.get_CallbackInstance()
    }

    /**
     * The get_Call method gets a pointer to the call information interface for the call on which the event has occurred.
     * @returns {ITCallInfo} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallstateevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCallInfo := 0, "HRESULT")
        return ITCallInfo(ppCallInfo)
    }

    /**
     * The get_State method gets information on the new call state.
     * @returns {Integer} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_state">CALL_STATE</a> constant.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallstateevent-get_state
     */
    get_State() {
        result := ComCall(8, this, "int*", &pCallState := 0, "HRESULT")
        return pCallState
    }

    /**
     * The get_Cause method gets the cause associated with this event.
     * @returns {Integer} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_state_event_cause">CALL_STATE_EVENT_CAUSE</a> indicator.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallstateevent-get_cause
     */
    get_Cause() {
        result := ComCall(9, this, "int*", &pCEC := 0, "HRESULT")
        return pCEC
    }

    /**
     * The get_CallbackInstance method gets a pointer to the callback instance associated with this event.
     * @returns {Integer} Pointer to callback instance returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-registercallnotifications">ITTAPI::RegisterCallNotifications</a>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallstateevent-get_callbackinstance
     */
    get_CallbackInstance() {
        result := ComCall(10, this, "int*", &plCallbackInstance := 0, "HRESULT")
        return plCallbackInstance
    }
}
