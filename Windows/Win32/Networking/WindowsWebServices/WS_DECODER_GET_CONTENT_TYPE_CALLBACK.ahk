#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import ".\WS_STRING.ahk" { WS_STRING }

/**
 * Gets the content type of the message. (WS_DECODER_GET_CONTENT_TYPE_CALLBACK)
 * @remarks
 * The callback should verify that the content type provided matches what is expected,
 *               and then should return the content type of the decoded message.
 *             
 * 
 * The content type returned must remain valid until the next time the callback is
 *               invoked, or the decoder is freed.
 *             
 * 
 * The callback has to set newContentType to one that is supported by underlying channel.
 *                 For example, with TCP session channel using SOAP 1.2 and binary encoding, 
 *                 the new content type should always be application/soap+msbinsession1.
 *             
 * 
 * For <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_HTTP_CHANNEL_BINDING</a> the content encoding parameter will
 *               be set to the value of the "Content-Encoding" HTTP header.  If this header does
 *               not exist, then <b>NULL</b> will be passed.
 *             
 * 
 * For all other channel bindings, <b>NULL</b> will be passed for the content encoding.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_decoder_get_content_type_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_DECODER_GET_CONTENT_TYPE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_DECODER_GET_CONTENT_TYPE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} decoderContext The encoder instance returned by the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_create_decoder_callback">WS_CREATE_DECODER_CALLBACK</a>.
     * @param {Pointer<WS_STRING>} contentType The content type of the encoded message.
     * @param {Pointer<WS_STRING>} contentEncoding The content encoding for the encoded message.
     * @param {Pointer<WS_STRING>} newContentType The callback should return the content type for the newly decoded message here.
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
    Call(decoderContext, contentType, contentEncoding, newContentType, _error) {
        decoderContextMarshal := decoderContext is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, decoderContextMarshal, decoderContext, WS_STRING.Ptr, contentType, WS_STRING.Ptr, contentEncoding, WS_STRING.Ptr, newContentType, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_DECODER_GET_CONTENT_TYPE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_DECODER_GET_CONTENT_TYPE_CALLBACK {
        /**
         * Creates a WS_DECODER_GET_CONTENT_TYPE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WS_STRING, WS_STRING, WS_STRING, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WS_STRING.Ptr, WS_STRING.Ptr, WS_STRING.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
