#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIDL_STUB_MESSAGE.ahk" { MIDL_STUB_MESSAGE }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct EXPR_EVAL {
    value : IntPtr

    __value {
        set {
            if (value is EXPR_EVAL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<MIDL_STUB_MESSAGE>} param0 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0) {
        DllCall(this.value, MIDL_STUB_MESSAGE.Ptr, param0)
    }

    /**
     * A EXPR_EVAL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXPR_EVAL {
        /**
         * Creates a EXPR_EVAL pointer that invokes the given AHK function when called.
         * @param {Func(MIDL_STUB_MESSAGE) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [MIDL_STUB_MESSAGE.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
