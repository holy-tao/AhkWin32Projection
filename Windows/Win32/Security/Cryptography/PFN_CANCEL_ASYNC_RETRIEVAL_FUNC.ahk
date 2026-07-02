#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\HCRYPTASYNC.ahk" { HCRYPTASYNC }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CANCEL_ASYNC_RETRIEVAL_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CANCEL_ASYNC_RETRIEVAL_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCRYPTASYNC} hAsyncRetrieve 
     * @returns {BOOL} 
     */
    Call(hAsyncRetrieve) {
        result := DllCall(this.value, HCRYPTASYNC, hAsyncRetrieve, BOOL)
        return result
    }

    /**
     * A PFN_CANCEL_ASYNC_RETRIEVAL_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CANCEL_ASYNC_RETRIEVAL_FUNC {
        /**
         * Creates a PFN_CANCEL_ASYNC_RETRIEVAL_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(HCRYPTASYNC) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCRYPTASYNC, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
