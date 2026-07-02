#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLT_CALLBACK_DATA_QUEUE.ahk" { FLT_CALLBACK_DATA_QUEUE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_CALLBACK_DATA_QUEUE_ACQUIRE {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_CALLBACK_DATA_QUEUE_ACQUIRE) {
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
     * @param {Pointer<Integer>} Irql 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Cbdq, Irql) {
        IrqlMarshal := Irql is VarRef ? "char*" : "ptr"

        DllCall(this.value, FLT_CALLBACK_DATA_QUEUE.Ptr, Cbdq, IrqlMarshal, Irql)
    }

    /**
     * A PFLT_CALLBACK_DATA_QUEUE_ACQUIRE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_CALLBACK_DATA_QUEUE_ACQUIRE {
        /**
         * Creates a PFLT_CALLBACK_DATA_QUEUE_ACQUIRE pointer that invokes the given AHK function when called.
         * @param {Func(FLT_CALLBACK_DATA_QUEUE, "char*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FLT_CALLBACK_DATA_QUEUE.Ptr, "char*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
