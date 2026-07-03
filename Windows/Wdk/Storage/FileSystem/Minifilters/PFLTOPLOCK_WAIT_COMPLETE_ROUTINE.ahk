#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLT_CALLBACK_DATA.ahk" { FLT_CALLBACK_DATA }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLTOPLOCK_WAIT_COMPLETE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PFLTOPLOCK_WAIT_COMPLETE_ROUTINE) {
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
     * @param {Pointer<Void>} _Context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(CallbackData, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, FLT_CALLBACK_DATA.Ptr, CallbackData, _ContextMarshal, _Context)
    }

    /**
     * A PFLTOPLOCK_WAIT_COMPLETE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLTOPLOCK_WAIT_COMPLETE_ROUTINE {
        /**
         * Creates a PFLTOPLOCK_WAIT_COMPLETE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(FLT_CALLBACK_DATA, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FLT_CALLBACK_DATA.Ptr, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
