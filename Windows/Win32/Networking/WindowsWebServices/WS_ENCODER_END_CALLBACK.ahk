#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_ASYNC_CONTEXT.ahk" { WS_ASYNC_CONTEXT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Encodes the end of a message.
 * @remarks
 * The encoder can use the callback passed to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_encoder_callback">WS_CREATE_ENCODER_CALLBACK</a> to
 *             write the encoded data of the message.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_encoder_end_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ENCODER_END_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_ENCODER_END_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} encoderContext The encoder instance returned by the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_encoder_callback">WS_CREATE_ENCODER_CALLBACK</a>.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if the function is invoked  synchronously.
     * @param {Pointer<WS_ERROR>} _error Where additional error information should be stored if the function fails.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(encoderContext, asyncContext, _error) {
        encoderContextMarshal := encoderContext is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, encoderContextMarshal, encoderContext, WS_ASYNC_CONTEXT.Ptr, asyncContext, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_ENCODER_END_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_ENCODER_END_CALLBACK {
        /**
         * Creates a WS_ENCODER_END_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WS_ASYNC_CONTEXT, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WS_ASYNC_CONTEXT.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
