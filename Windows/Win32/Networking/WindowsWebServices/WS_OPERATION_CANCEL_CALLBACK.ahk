#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SERVICE_CANCEL_REASON.ahk" { WS_SERVICE_CANCEL_REASON }

/**
 * Gives notification of the cancellation of an asynchronous service operation call as a result of an aborted shutdown of service host.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsregisteroperationforcancel">WsRegisterOperationForCancel</a> for details.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_operation_cancel_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_OPERATION_CANCEL_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_OPERATION_CANCEL_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {WS_SERVICE_CANCEL_REASON} reason Specifies the reason for which the call back is called.
     * @param {Pointer<Void>} state A reference to the application defined state registered with the callback.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(reason, state) {
        stateMarshal := state is VarRef ? "ptr" : "ptr"

        DllCall(this.value, WS_SERVICE_CANCEL_REASON, reason, stateMarshal, state)
    }

    /**
     * A WS_OPERATION_CANCEL_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_OPERATION_CANCEL_CALLBACK {
        /**
         * Creates a WS_OPERATION_CANCEL_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(WS_SERVICE_CANCEL_REASON, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WS_SERVICE_CANCEL_REASON, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
