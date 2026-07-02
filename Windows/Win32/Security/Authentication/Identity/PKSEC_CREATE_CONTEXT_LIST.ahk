#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSEC_CONTEXT_TYPE.ahk" { KSEC_CONTEXT_TYPE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PKSEC_CREATE_CONTEXT_LIST {
    value : IntPtr

    __value {
        set {
            if (value is PKSEC_CREATE_CONTEXT_LIST) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {KSEC_CONTEXT_TYPE} Type 
     * @returns {Pointer<Void>} 
     */
    Call(Type) {
        result := DllCall(this.value, KSEC_CONTEXT_TYPE, Type, IntPtr)
        return result
    }

    /**
     * A PKSEC_CREATE_CONTEXT_LIST that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PKSEC_CREATE_CONTEXT_LIST {
        /**
         * Creates a PKSEC_CREATE_CONTEXT_LIST pointer that invokes the given AHK function when called.
         * @param {Func(KSEC_CONTEXT_TYPE) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [KSEC_CONTEXT_TYPE, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
