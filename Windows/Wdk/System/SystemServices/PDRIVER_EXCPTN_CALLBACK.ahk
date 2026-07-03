#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MCA_EXCEPTION.ahk" { MCA_EXCEPTION }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PDRIVER_EXCPTN_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PDRIVER_EXCPTN_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<MCA_EXCEPTION>} BankLog 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Context, BankLog) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _ContextMarshal, _Context, MCA_EXCEPTION.Ptr, BankLog)
    }

    /**
     * A PDRIVER_EXCPTN_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDRIVER_EXCPTN_CALLBACK {
        /**
         * Creates a PDRIVER_EXCPTN_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", MCA_EXCEPTION) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", MCA_EXCEPTION.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
