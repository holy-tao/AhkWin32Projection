#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import ".\WS_STRING.ahk" { WS_STRING }

/**
 * Gets the content type of the message. (WS_ENCODER_GET_CONTENT_TYPE_CALLBACK)
 * @remarks
 * The callback may inspect the content type provided, and then should return the 
 *               content type to use for the encoded message.
 *             
 * 
 * The content type and content encoding returned must remain valid until the 
 *               callback is invoked again, or the encoder is freed.
 *             
 * 
 * For <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_HTTP_CHANNEL_BINDING</a>, if a non-zero length content encoding
 *               is returned, the HTTP header "Content-Encoding" will be added to the message
 *               with this value.
 *             
 * 
 * For other channel bindings, it is an error to return a non-zero length 
 *               content encoding.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_encoder_get_content_type_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ENCODER_GET_CONTENT_TYPE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_ENCODER_GET_CONTENT_TYPE_CALLBACK) {
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
     * @param {Pointer<WS_STRING>} contentType The content type of the encoded message.
     * @param {Pointer<WS_STRING>} newContentType The callback should return the content type for the newly encoded message here.
     * @param {Pointer<WS_STRING>} contentEncoding The callback should return the content encoding for the encoded message here.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
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
    Call(encoderContext, contentType, newContentType, contentEncoding, _error) {
        encoderContextMarshal := encoderContext is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, encoderContextMarshal, encoderContext, WS_STRING.Ptr, contentType, WS_STRING.Ptr, newContentType, WS_STRING.Ptr, contentEncoding, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_ENCODER_GET_CONTENT_TYPE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_ENCODER_GET_CONTENT_TYPE_CALLBACK {
        /**
         * Creates a WS_ENCODER_GET_CONTENT_TYPE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WS_STRING, WS_STRING, WS_STRING, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WS_STRING.Ptr, WS_STRING.Ptr, WS_STRING.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
