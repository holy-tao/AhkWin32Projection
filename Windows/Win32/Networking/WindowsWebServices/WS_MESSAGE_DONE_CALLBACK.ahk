#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Notifies the caller that the message has completed its use of either the WS_XML_READER structure that was supplied to WsReadEnvelopeStartfunction, or of the WS_XML_WRITER structure supplied to the WsWriteEnvelopeStart function.
 * @remarks
 * This callback can be used as an indicator that the message object is no
 *                 longer using the reader or writer.
 *             
 * 
 * The callback is specified when <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadenvelopestart">WsReadEnvelopeStart</a> or
 *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswriteenvelopestart">WsWriteEnvelopeStart</a> is called.
 *             
 * 
 * The callback should assume that it is invoked as a 
 *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_callback_model">WS_SHORT_CALLBACK</a>, since it will be invoked on the same 
 *                 thread that calls <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreemessage">WsFreeMessage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsresetmessage">WsResetMessage</a>.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_message_done_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_MESSAGE_DONE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_MESSAGE_DONE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} doneCallbackState A pointer to <b>state</b> information passed to the  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadenvelopestart">WsReadEnvelopeStart</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswriteenvelopestart">WsWriteEnvelopeStart</a> function.
     *                 
     * 
     * This parameter can be used to specify a pointer to user-defined
     *                     data required by the callback.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(doneCallbackState) {
        doneCallbackStateMarshal := doneCallbackState is VarRef ? "ptr" : "ptr"

        DllCall(this.value, doneCallbackStateMarshal, doneCallbackState)
    }

    /**
     * A WS_MESSAGE_DONE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_MESSAGE_DONE_CALLBACK {
        /**
         * Creates a WS_MESSAGE_DONE_CALLBACK pointer that invokes the given AHK function when called.
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
