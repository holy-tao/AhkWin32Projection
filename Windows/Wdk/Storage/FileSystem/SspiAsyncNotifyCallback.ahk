#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\SspiAsyncContext.ahk" { SspiAsyncContext }

/**
 * Callback used for notifying completion of an async SSPI call.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/nc-sspi-sspiasyncnotifycallback
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct SspiAsyncNotifyCallback {
    value : IntPtr

    __value {
        set {
            if (value is SspiAsyncNotifyCallback) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SspiAsyncContext>} _Handle The async context handle.
     * @param {Pointer<Void>} CallbackData Receives the callback data passed by the [SspiSetAsyncNotifyCallback](nf-sspi-sspisetasyncnotifycallback.md) function as "PVOID CallbackData".
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Handle, CallbackData) {
        _HandleMarshal := _Handle is VarRef ? "ptr*" : "ptr"
        CallbackDataMarshal := CallbackData is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _HandleMarshal, _Handle, CallbackDataMarshal, CallbackData)
    }

    /**
     * A SspiAsyncNotifyCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SspiAsyncNotifyCallback {
        /**
         * Creates a SspiAsyncNotifyCallback pointer that invokes the given AHK function when called.
         * @param {Func(SspiAsyncContext, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SspiAsyncContext.Ptr, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
