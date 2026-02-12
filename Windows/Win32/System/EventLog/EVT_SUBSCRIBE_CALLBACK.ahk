#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Implement this callback if you call the EvtSubscribe function to receive events that match your query.
 * @remarks
 * This callback will block other events from being delivered to your callback, so keep your implementation as short as possible.
 * 
 * If the service encounters an error while setting up the subscription, your callback will not receive any notification that an error occurred.
 * 
 * If the <i>Flags</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsubscribe">EvtSubscribe</a> includes EvtSubscribeStrict, your callback will receive notification when event records are missing. In this case, the value of <i>Event</i> will be ERROR_EVT_QUERY_RESULT_STALE.
 * 
 * To cancel the subscription, you must close the subscription handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsubscribe">EvtSubscribe</a> function returns.
 * @see https://learn.microsoft.com/windows/win32/api//content/winevt/nc-winevt-evt_subscribe_callback
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_SUBSCRIBE_CALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} Action 
     * @param {Pointer<Void>} UserContext 
     * @param {EVT_HANDLE} Event 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Action, UserContext, Event) {
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "int", Action, UserContextMarshal, UserContext, "ptr", Event, "uint")
        return result
    }
}
