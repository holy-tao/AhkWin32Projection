#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Allows an application to cleanup state information that was registered with cancellation callback.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsregisteroperationforcancel">WsRegisterOperationForCancel</a> for details.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_operation_free_state_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_OPERATION_FREE_STATE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_OPERATION_FREE_STATE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} state A reference to the application defined state registered with the callback.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(state) {
        stateMarshal := state is VarRef ? "ptr" : "ptr"

        DllCall(this.value, stateMarshal, state)
    }

    /**
     * A WS_OPERATION_FREE_STATE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_OPERATION_FREE_STATE_CALLBACK {
        /**
         * Creates a WS_OPERATION_FREE_STATE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
