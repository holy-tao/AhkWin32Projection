#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLT_CALLBACK_DATA_QUEUE.ahk" { FLT_CALLBACK_DATA_QUEUE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_CALLBACK_DATA_QUEUE_RELEASE {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_CALLBACK_DATA_QUEUE_RELEASE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FLT_CALLBACK_DATA_QUEUE>} Cbdq 
     * @param {Integer} Irql 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Cbdq, Irql) {
        DllCall(this.value, FLT_CALLBACK_DATA_QUEUE.Ptr, Cbdq, Int8, Irql)
    }

    /**
     * A PFLT_CALLBACK_DATA_QUEUE_RELEASE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_CALLBACK_DATA_QUEUE_RELEASE {
        /**
         * Creates a PFLT_CALLBACK_DATA_QUEUE_RELEASE pointer that invokes the given AHK function when called.
         * @param {Func(FLT_CALLBACK_DATA_QUEUE, Int8) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FLT_CALLBACK_DATA_QUEUE.Ptr, Int8, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
