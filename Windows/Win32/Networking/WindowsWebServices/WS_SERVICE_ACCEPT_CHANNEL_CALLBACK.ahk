#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_ASYNC_CONTEXT.ahk" { WS_ASYNC_CONTEXT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import ".\WS_OPERATION_CONTEXT.ahk" { WS_OPERATION_CONTEXT }

/**
 * Invoked when a channel is accepted on an endpoint listener by service host.
 * @remarks
 * See also <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_service_close_channel_callback">WS_SERVICE_CLOSE_CHANNEL_CALLBACK</a> which can be used by the application to disassociate state,
 *                 and gets called on channel closure.
 *             
 * 
 * This callback is cancellable.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_service_accept_channel_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SERVICE_ACCEPT_CHANNEL_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_SERVICE_ACCEPT_CHANNEL_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WS_OPERATION_CONTEXT>} _context The operation context.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on whether the function is getting invoked asynchronously.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {Pointer<Void>} The callback may provide channel state through this parameter. This channel state is
     *                     made available to the service operation as part of <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-operation-context">WS_OPERATION_CONTEXT</a> through
     *                     the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_operation_context_property_id">WS_OPERATION_CONTEXT_PROPERTY_CHANNEL_USER_STATE</a>.
     */
    Call(_context, asyncContext, _error) {
        _contextMarshal := _context is VarRef ? "ptr*" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, "ptr*", &channelState := 0, WS_ASYNC_CONTEXT.Ptr, asyncContext, _errorMarshal, _error, "HRESULT")
        return channelState
    }

    /**
     * A WS_SERVICE_ACCEPT_CHANNEL_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_SERVICE_ACCEPT_CHANNEL_CALLBACK {
        /**
         * Creates a WS_SERVICE_ACCEPT_CHANNEL_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(WS_OPERATION_CONTEXT, WS_ASYNC_CONTEXT, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WS_OPERATION_CONTEXT.Ptr, WS_ASYNC_CONTEXT.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
