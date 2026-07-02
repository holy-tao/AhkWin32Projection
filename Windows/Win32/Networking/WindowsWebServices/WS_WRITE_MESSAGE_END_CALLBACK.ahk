#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_MESSAGE.ahk" { WS_MESSAGE }
#Import ".\WS_ASYNC_CONTEXT.ahk" { WS_ASYNC_CONTEXT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Handles the WsWriteMessageEnd call for a WS_CUSTOM_CHANNEL_BINDING.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritemessageend">WsWriteMessageEnd</a> for information about the contract
 *                 of this API.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_write_message_end_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_WRITE_MESSAGE_END_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_WRITE_MESSAGE_END_CALLBACK) {
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
     * @param {Pointer<WS_MESSAGE>} message The message to write.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint does not exist or could not be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the remote endpoint.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection with the remote endpoint was terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is not currently in service at this location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_TOO_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is unable to process the request due to being overloaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint was not reachable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_ENDPOINT_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint address URL is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the HTTP proxy server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_VERIFICATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security verification was not successful for the received data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_SYSTEM_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security operation failed in the Windows Web Services framework.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_TOKEN_EXPIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security token was rejected by the server because it has expired.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_EXPIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required certificate is not within its validity period when verifying against the current system clock or the timestamp in the signed file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_CN_NO_MATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificates CN name does not match the passed value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_UNTRUSTEDROOT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A certificate chain processed, but terminated in a root certificate which is not trusted by the trust provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_WRONG_USAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate is not valid for the requested usage.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CRYPT_E_REVOCATION_OFFLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The revocation function was unable to check revocation because the revocation server was offline.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
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
    Call(channelInstance, message, asyncContext, _error) {
        channelInstanceMarshal := channelInstance is VarRef ? "ptr" : "ptr"
        messageMarshal := message is VarRef ? "ptr*" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, channelInstanceMarshal, channelInstance, messageMarshal, message, WS_ASYNC_CONTEXT.Ptr, asyncContext, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_WRITE_MESSAGE_END_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_WRITE_MESSAGE_END_CALLBACK {
        /**
         * Creates a WS_WRITE_MESSAGE_END_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WS_MESSAGE, WS_ASYNC_CONTEXT, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WS_MESSAGE.Ptr, WS_ASYNC_CONTEXT.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
