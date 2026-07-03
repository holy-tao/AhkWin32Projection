#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Handles freeing a decoder instance.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_free_decoder_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_FREE_DECODER_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_FREE_DECODER_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} decoderContext Frees an instance of a decoder.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(decoderContext) {
        decoderContextMarshal := decoderContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, decoderContextMarshal, decoderContext)
    }

    /**
     * A WS_FREE_DECODER_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_FREE_DECODER_CALLBACK {
        /**
         * Creates a WS_FREE_DECODER_CALLBACK pointer that invokes the given AHK function when called.
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
