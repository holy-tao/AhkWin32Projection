#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFLT_CONTEXT.ahk" { PFLT_CONTEXT }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_CONTEXT_CLEANUP_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_CONTEXT_CLEANUP_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PFLT_CONTEXT} _Context 
     * @param {Integer} ContextType 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Context, ContextType) {
        DllCall(this.value, PFLT_CONTEXT, _Context, UInt16, ContextType)
    }

    /**
     * A PFLT_CONTEXT_CLEANUP_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_CONTEXT_CLEANUP_CALLBACK {
        /**
         * Creates a PFLT_CONTEXT_CLEANUP_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PFLT_CONTEXT, UInt16) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PFLT_CONTEXT, UInt16, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
