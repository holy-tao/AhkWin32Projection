#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_CALLBACK_MODEL.ahk" { WS_CALLBACK_MODEL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The callback function parameter used with the asynchronous model.
 * @remarks
 * All error return codes of an operation are represented as HRESULTs. This API defines a set of HRESULTs in the FACILITY_WS range, but also returns errors defined elsewhere in the Windows API.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_async_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ASYNC_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_ASYNC_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HRESULT} errorCode The result of the operation.   If the operation fails
     *                     and a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object is supplied, the object is filled with rich error information 
     *                     before the callback is invoked.
     * @param {WS_CALLBACK_MODEL} callbackModel A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_callback_model">WS_CALLBACK_MODEL</a> value that determines whether the callback is being invoked as a long or short term callback.
     * @param {Pointer<Void>} callbackState A void pointer that corresponds to the value of the <b>callbackState</b> field of 
     *                     the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> structure. This parameter is used to pass user-defined data to the callback function if the operation completes asynchronously.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(errorCode, callbackModel, callbackState) {
        callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"

        DllCall(this.value, "int", errorCode, WS_CALLBACK_MODEL, callbackModel, callbackStateMarshal, callbackState)
    }

    /**
     * A WS_ASYNC_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_ASYNC_CALLBACK {
        /**
         * Creates a WS_ASYNC_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("int", WS_CALLBACK_MODEL, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["int", WS_CALLBACK_MODEL, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
