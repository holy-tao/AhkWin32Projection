#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLT_CALLBACK_DATA.ahk" { FLT_CALLBACK_DATA }
#Import ".\PFLT_CONTEXT.ahk" { PFLT_CONTEXT }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_COMPLETED_ASYNC_IO_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_COMPLETED_ASYNC_IO_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {PFLT_CONTEXT} _Context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(CallbackData, _Context) {
        DllCall(this.value, FLT_CALLBACK_DATA.Ptr, CallbackData, PFLT_CONTEXT, _Context)
    }

    /**
     * A PFLT_COMPLETED_ASYNC_IO_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_COMPLETED_ASYNC_IO_CALLBACK {
        /**
         * Creates a PFLT_COMPLETED_ASYNC_IO_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(FLT_CALLBACK_DATA, PFLT_CONTEXT) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FLT_CALLBACK_DATA.Ptr, PFLT_CONTEXT, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
