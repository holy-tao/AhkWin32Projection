#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CF_CALLBACK_INFO.ahk" { CF_CALLBACK_INFO }
#Import ".\CF_CALLBACK_PARAMETERS.ahk" { CF_CALLBACK_PARAMETERS }

/**
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is CF_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CF_CALLBACK_INFO>} CallbackInfo 
     * @param {Pointer<CF_CALLBACK_PARAMETERS>} CallbackParameters 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(CallbackInfo, CallbackParameters) {
        DllCall(this.value, CF_CALLBACK_INFO.Ptr, CallbackInfo, CF_CALLBACK_PARAMETERS.Ptr, CallbackParameters)
    }

    /**
     * A CF_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CF_CALLBACK {
        /**
         * Creates a CF_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(CF_CALLBACK_INFO, CF_CALLBACK_PARAMETERS) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CF_CALLBACK_INFO.Ptr, CF_CALLBACK_PARAMETERS.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
