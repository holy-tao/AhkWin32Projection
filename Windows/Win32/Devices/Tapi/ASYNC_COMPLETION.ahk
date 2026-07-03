#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Completion_Proc is a callback function implemented by TAPI and supplied to the service provider as a parameter to TSPI_providerInit.
 * @remarks
 * The call state when calling this function can be any state.
 * 
 * This procedure is supplied by TAPI at the time a service provider is initialized with the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nf-tspi-tspi_providerinit">TSPI_providerInit</a> function. Some of the TSPI procedures that operate on line, call, and phone devices specify asynchronous operation. These procedures include a <i>dwRequestID</i> parameter to identify the request. When such a procedure is called, the service provider can return a negative number for an error if one is detected immediately, or the positive <i>dwRequestID</i> if the operation continues asynchronously. The service provider must report completion exactly once for each request it executes asynchronously. It does so by calling this procedure. The service provider is not permitted to call this procedure or the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nc-tspi-lineevent">Line_Event</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nc-tspi-phoneevent">Phone_Event</a> procedure again until this procedure returns.
 * 
 * The service provider is permitted to call the 
 * <i>Completion_Proc</i> function before it returns from the first request. TAPI guarantees not to call the service provider from within the 
 * <i>Completion_Proc</i> context except where noted.
 * 
 * This does not have any direct correspondence at the TAPI level because at that level asynchronous function completions are reported as a message passed through the same callback interface that is used for spontaneous event messages. At the TSPI level, spontaneous events are reported through the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nc-tspi-lineevent">Line_Event</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tspi/nc-tspi-phoneevent">Phone_Event</a> callback procedures.
 * @see https://learn.microsoft.com/windows/win32/api/tspi/nc-tspi-async_completion
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ASYNC_COMPLETION {
    value : IntPtr

    __value {
        set {
            if (value is ASYNC_COMPLETION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwRequestID The identifier passed in the original request that the service provider executed asynchronously.
     * @param {Integer} _lResult The outcome of the operation. This can be zero to indicate success or a negative number to indicate an error. The possible specific error values that can result from a function are the same for asynchronous or synchronous execution.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(dwRequestID, _lResult) {
        DllCall(this.value, UInt32, dwRequestID, Int32, _lResult)
    }

    /**
     * A ASYNC_COMPLETION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ASYNC_COMPLETION {
        /**
         * Creates a ASYNC_COMPLETION pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, Int32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, Int32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
