#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_ASYNC_CONTEXT.ahk" { WS_ASYNC_CONTEXT }
#Import ".\WS_OPERATION_CONTEXT.ahk" { WS_OPERATION_CONTEXT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Invoked when a WS_MESSAGE is received on an endpoint configured with a WS_SERVICE_CONTRACT which has defaultMessageHandlerCallback set.
 * @remarks
 * When defined, callback would disallow all concurrency on a session based channel. If concurrency on a session based channel is desirable an application should not define <i>WS_SERVICE_MESSAGE_RECEIVE_CALLBACK</i> on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_contract">WS_SERVICE_CONTRACT</a>.
 *                 
 * 
 * At the time of the invocation of the callback, service model has performed <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadmessagestart">WsReadMessageStart</a> on the receiving <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a>. It is the responsibility of the application implementing <i>WS_SERVICE_MESSAGE_RECEIVE_CALLBACK</i> to process the body and perform <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadmessageend">WsReadMessageEnd</a> operation.
 *  
 * If the callback fails, the underlying channel is aborted.
 *                 
 * See also, <a href="https://docs.microsoft.com/windows/desktop/wsw/untypedserviceexample">UnTypedServiceExample</a>
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_service_message_receive_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SERVICE_MESSAGE_RECEIVE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_SERVICE_MESSAGE_RECEIVE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WS_OPERATION_CONTEXT>} _context The <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-operation-context">context</a> within which this callback is being invoked.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Specifies whether the callback can run asynchronously.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This callback function does not return a value.
     */
    Call(_context, asyncContext, _error) {
        _contextMarshal := _context is VarRef ? "ptr*" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, WS_ASYNC_CONTEXT.Ptr, asyncContext, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_SERVICE_MESSAGE_RECEIVE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_SERVICE_MESSAGE_RECEIVE_CALLBACK {
        /**
         * Creates a WS_SERVICE_MESSAGE_RECEIVE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(WS_OPERATION_CONTEXT, WS_ASYNC_CONTEXT, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WS_OPERATION_CONTEXT.Ptr, WS_ASYNC_CONTEXT.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
