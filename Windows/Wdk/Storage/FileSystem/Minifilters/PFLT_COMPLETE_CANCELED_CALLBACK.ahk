#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLT_CALLBACK_DATA.ahk" { FLT_CALLBACK_DATA }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_COMPLETE_CANCELED_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_COMPLETE_CANCELED_CALLBACK) {
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
     * @returns {String} Nothing - always returns an empty string
     */
    Call(CallbackData) {
        DllCall(this.value, FLT_CALLBACK_DATA.Ptr, CallbackData)
    }

    /**
     * A PFLT_COMPLETE_CANCELED_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_COMPLETE_CANCELED_CALLBACK {
        /**
         * Creates a PFLT_COMPLETE_CANCELED_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(FLT_CALLBACK_DATA) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FLT_CALLBACK_DATA.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
