#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import ".\WS_HEAP.ahk" { WS_HEAP }
#Import ".\WS_MESSAGE.ahk" { WS_MESSAGE }

/**
 * Invoked when the headers of the input message are about to be sent, or when output message headers are just received.
 * @remarks
 * See also, <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_proxy_message_callback_context">WS_PROXY_MESSAGE_CALLBACK_CONTEXT</a>.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_proxy_message_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_PROXY_MESSAGE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_PROXY_MESSAGE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WS_MESSAGE>} message The input or output message.
     * @param {Pointer<WS_HEAP>} heap The heap associated with the call. This is the heap which is passed to call for which this 
     *                     callback is being called.
     * @param {Pointer<Void>} state The 'state' as specified as part of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_proxy_message_callback_context">WS_PROXY_MESSAGE_CALLBACK_CONTEXT</a> 'state' field.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} If this callback function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     */
    Call(message, heap, state, _error) {
        messageMarshal := message is VarRef ? "ptr*" : "ptr"
        heapMarshal := heap is VarRef ? "ptr*" : "ptr"
        stateMarshal := state is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, messageMarshal, message, heapMarshal, heap, stateMarshal, state, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_PROXY_MESSAGE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_PROXY_MESSAGE_CALLBACK {
        /**
         * Creates a WS_PROXY_MESSAGE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(WS_MESSAGE, WS_HEAP, "ptr", WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WS_MESSAGE.Ptr, WS_HEAP.Ptr, "ptr", WS_ERROR.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
