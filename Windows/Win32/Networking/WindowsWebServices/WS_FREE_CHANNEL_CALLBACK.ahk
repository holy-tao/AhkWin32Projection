#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Handles the WsFreeChannel call for a WS_CUSTOM_CHANNEL_BINDING.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsopenchannel">WsOpenChannel</a> for information about the contract
 *                 of this API.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_free_channel_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_FREE_CHANNEL_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_FREE_CHANNEL_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} channelInstance The pointer to the state specific to this channel instance,
     *                     as created by the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_channel_callback">WS_CREATE_CHANNEL_CALLBACK</a>.
     *                 
     * 
     * The callback should free this pointer.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(channelInstance) {
        channelInstanceMarshal := channelInstance is VarRef ? "ptr" : "ptr"

        DllCall(this.value, channelInstanceMarshal, channelInstance)
    }

    /**
     * A WS_FREE_CHANNEL_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_FREE_CHANNEL_CALLBACK {
        /**
         * Creates a WS_FREE_CHANNEL_CALLBACK pointer that invokes the given AHK function when called.
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
