#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Handles the WsFreeListener call for a WS_CUSTOM_CHANNEL_BINDING.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsopenlistener">WsOpenListener</a> for information about the contract
 *                 of this API.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_free_listener_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_FREE_LISTENER_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_FREE_LISTENER_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} listenerInstance The pointer to the state specific to this listener instance,
     *                     as created by the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_listener_callback">WS_CREATE_LISTENER_CALLBACK</a>.
     *                 
     * 
     * The callback should free this pointer.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(listenerInstance) {
        listenerInstanceMarshal := listenerInstance is VarRef ? "ptr" : "ptr"

        DllCall(this.value, listenerInstanceMarshal, listenerInstance)
    }

    /**
     * A WS_FREE_LISTENER_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_FREE_LISTENER_CALLBACK {
        /**
         * Creates a WS_FREE_LISTENER_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
