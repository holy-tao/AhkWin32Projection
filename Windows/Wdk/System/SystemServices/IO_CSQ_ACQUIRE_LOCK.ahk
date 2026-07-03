#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IO_CSQ.ahk" { IO_CSQ }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_CSQ_ACQUIRE_LOCK {
    value : IntPtr

    __value {
        set {
            if (value is IO_CSQ_ACQUIRE_LOCK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<IO_CSQ>} Csq 
     * @param {Pointer<Integer>} Irql 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Csq, Irql) {
        IrqlMarshal := Irql is VarRef ? "char*" : "ptr"

        DllCall(this.value, IO_CSQ.Ptr, Csq, IrqlMarshal, Irql)
    }

    /**
     * A IO_CSQ_ACQUIRE_LOCK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IO_CSQ_ACQUIRE_LOCK {
        /**
         * Creates a IO_CSQ_ACQUIRE_LOCK pointer that invokes the given AHK function when called.
         * @param {Func(IO_CSQ, "char*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IO_CSQ.Ptr, "char*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
