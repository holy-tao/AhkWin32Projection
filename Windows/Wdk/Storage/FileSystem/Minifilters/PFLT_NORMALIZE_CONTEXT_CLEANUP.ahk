#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_NORMALIZE_CONTEXT_CLEANUP {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_NORMALIZE_CONTEXT_CLEANUP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} NormalizationContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(NormalizationContext) {
        NormalizationContextMarshal := NormalizationContext is VarRef ? "ptr*" : "ptr"

        DllCall(this.value, NormalizationContextMarshal, NormalizationContext)
    }

    /**
     * A PFLT_NORMALIZE_CONTEXT_CLEANUP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_NORMALIZE_CONTEXT_CLEANUP {
        /**
         * Creates a PFLT_NORMALIZE_CONTEXT_CLEANUP pointer that invokes the given AHK function when called.
         * @param {Func("ptr*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
