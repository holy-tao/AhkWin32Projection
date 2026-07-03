#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_ASYNC_CONTEXT.ahk" { WS_ASYNC_CONTEXT }
#Import ".\WS_OPERATION_CONTEXT.ahk" { WS_OPERATION_CONTEXT }

/**
 * Invoked when a channel is closed or aborted on an endpoint.
 * @remarks
 * The returned HRESULT is only used to see if the function is completing asynchronously. Failure or 
 *                 reporting failure through HRESULT does not in any way affects the service host infrastructure.
 *                 
 *             
 * 
 * Irrespective of whether <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_service_accept_channel_callback">WS_SERVICE_ACCEPT_CHANNEL_CALLBACK</a> competed successfully or not. This function 
 *                 will always be fired.
 *             
 * 
 * See also <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_service_accept_channel_callback">WS_SERVICE_ACCEPT_CHANNEL_CALLBACK</a> which can be used by the application to associate state,
 *                 and gets called when a channel gets accepted.
 *             
 * 
 * For an example implementation on how to use this callback for disassociating session state, see the session based calculator <a href="https://docs.microsoft.com/windows/desktop/wsw/sessionfullcalculatorserviceexample">sample</a>.
 *             
 * 
 * This callback is cancellable.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_service_close_channel_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SERVICE_CLOSE_CHANNEL_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_SERVICE_CLOSE_CHANNEL_CALLBACK) {
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
     * @returns {HRESULT} This callback function does not return a value.
     */
    Call(_context, asyncContext) {
        _contextMarshal := _context is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, WS_ASYNC_CONTEXT.Ptr, asyncContext, "HRESULT")
        return result
    }

    /**
     * A WS_SERVICE_CLOSE_CHANNEL_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_SERVICE_CLOSE_CHANNEL_CALLBACK {
        /**
         * Creates a WS_SERVICE_CLOSE_CHANNEL_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(WS_OPERATION_CONTEXT, WS_ASYNC_CONTEXT) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WS_OPERATION_CONTEXT.Ptr, WS_ASYNC_CONTEXT.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
