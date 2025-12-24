#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITCallInfo.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITCallNotificationEvent interface contains methods that retrieve the description of call notification events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itcallnotificationevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITCallNotificationEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITCallNotificationEvent
     * @type {Guid}
     */
    static IID => Guid("{895801df-3dd6-11d1-8f30-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Call", "get_Event", "get_CallbackInstance"]

    /**
     * @type {ITCallInfo} 
     */
    Call {
        get => this.get_Call()
    }

    /**
     * @type {Integer} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * @type {Integer} 
     */
    CallbackInstance {
        get => this.get_CallbackInstance()
    }

    /**
     * The get_Call method returns the ITCallInfo interface on which a call event has occurred.
     * @returns {ITCallInfo} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface on which call event has occurred.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallnotificationevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCall := 0, "HRESULT")
        return ITCallInfo(ppCall)
    }

    /**
     * The get_Event method returns a CALL_NOTIFICATION_EVENT description of whether the application owns or is monitoring the call on which the event has occurred.
     * @returns {Integer} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_notification_event">CALL_NOTIFICATION_EVENT</a> description of the application's privilege on the call returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itcallnotificationevent-get_call">ITCallNotificationEvent::get_Call</a>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallnotificationevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pCallNotificationEvent := 0, "HRESULT")
        return pCallNotificationEvent
    }

    /**
     * The get_CallbackInstance method gets a pointer to the callback instance associated with this event.
     * @returns {Integer} Pointer to callback instance returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-registercallnotifications">ITTAPI::RegisterCallNotifications</a>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itcallnotificationevent-get_callbackinstance
     */
    get_CallbackInstance() {
        result := ComCall(9, this, "int*", &plCallbackInstance := 0, "HRESULT")
        return plCallbackInstance
    }
}
