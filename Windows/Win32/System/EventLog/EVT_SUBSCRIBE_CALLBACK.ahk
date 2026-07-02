#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EVT_SUBSCRIBE_NOTIFY_ACTION.ahk" { EVT_SUBSCRIBE_NOTIFY_ACTION }
#Import ".\EVT_HANDLE.ahk" { EVT_HANDLE }

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
 * @see https://learn.microsoft.com/windows/win32/api/winevt/nc-winevt-evt_subscribe_callback
 * @namespace Windows.Win32.System.EventLog
 */
export default struct EVT_SUBSCRIBE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is EVT_SUBSCRIBE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {EVT_SUBSCRIBE_NOTIFY_ACTION} Action Determines whether the <i>Event</i> parameter contains an event or an error code. For possible notify action values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_subscribe_notify_action">EVT_SUBSCRIBE_NOTIFY_ACTION</a> enumeration.
     * @param {Pointer<Void>} UserContext The context that the subscriber passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsubscribe">EvtSubscribe</a> function.
     * @param {EVT_HANDLE} Event A handle to the event. The event handle is only valid for the duration of the callback function.  You can use this handle with any event log function that takes an event handle (for example, <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtrender">EvtRender</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtformatmessage">EvtFormatMessage</a>). 
     * 
     * Do not call <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> to close this handle; the service will close the handle when the callback returns.
     * 
     * If the <i>Action</i> parameter is EvtSubscribeActionError, cast <i>Event</i> to a DWORD to access the Win32 error code.
     * @returns {Integer} The service ignores the return code that you return.
     */
    Call(Action, UserContext, Event) {
        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, EVT_SUBSCRIBE_NOTIFY_ACTION, Action, UserContextMarshal, UserContext, EVT_HANDLE, Event, UInt32)
        return result
    }

    /**
     * A EVT_SUBSCRIBE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EVT_SUBSCRIBE_CALLBACK {
        /**
         * Creates a EVT_SUBSCRIBE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(EVT_SUBSCRIBE_NOTIFY_ACTION, "ptr", EVT_HANDLE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [EVT_SUBSCRIBE_NOTIFY_ACTION, "ptr", EVT_HANDLE, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
