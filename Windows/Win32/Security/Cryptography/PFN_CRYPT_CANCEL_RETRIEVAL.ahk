#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_CANCEL_RETRIEVAL {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_CANCEL_RETRIEVAL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<Void>} pvArg 
     * @returns {BOOL} 
     */
    Call(dwFlags, pvArg) {
        pvArgMarshal := pvArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, dwFlags, pvArgMarshal, pvArg, BOOL)
        return result
    }

    /**
     * A PFN_CRYPT_CANCEL_RETRIEVAL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_CANCEL_RETRIEVAL {
        /**
         * Creates a PFN_CRYPT_CANCEL_RETRIEVAL pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
