#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<ITCallInfo>} ppCall 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallnotificationevent-get_call
     */
    get_Call(ppCall) {
        result := ComCall(7, this, "ptr*", ppCall, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCallNotificationEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallnotificationevent-get_event
     */
    get_Event(pCallNotificationEvent) {
        result := ComCall(8, this, "int*", pCallNotificationEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCallbackInstance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallnotificationevent-get_callbackinstance
     */
    get_CallbackInstance(plCallbackInstance) {
        result := ComCall(9, this, "int*", plCallbackInstance, "HRESULT")
        return result
    }
}
