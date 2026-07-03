#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PCC_POST_DEFERRED_WRITE {
    value : IntPtr

    __value {
        set {
            if (value is PCC_POST_DEFERRED_WRITE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Context1 
     * @param {Pointer<Void>} Context2 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Context1, Context2) {
        Context1Marshal := Context1 is VarRef ? "ptr" : "ptr"
        Context2Marshal := Context2 is VarRef ? "ptr" : "ptr"

        DllCall(this.value, Context1Marshal, Context1, Context2Marshal, Context2)
    }

    /**
     * A PCC_POST_DEFERRED_WRITE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCC_POST_DEFERRED_WRITE {
        /**
         * Creates a PCC_POST_DEFERRED_WRITE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
