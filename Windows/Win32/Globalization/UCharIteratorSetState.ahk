#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UCharIterator.ahk" { UCharIterator }
#Import ".\UErrorCode.ahk" { UErrorCode }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UCharIteratorSetState {
    value : IntPtr

    __value {
        set {
            if (value is UCharIteratorSetState) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<UCharIterator>} iter 
     * @param {Integer} state 
     * @param {Pointer<UErrorCode>} pErrorCode 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(iter, state, pErrorCode) {
        pErrorCodeMarshal := pErrorCode is VarRef ? "int*" : "ptr"

        DllCall(this.value, UCharIterator.Ptr, iter, UInt32, state, pErrorCodeMarshal, pErrorCode)
    }

    /**
     * A UCharIteratorSetState that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UCharIteratorSetState {
        /**
         * Creates a UCharIteratorSetState pointer that invokes the given AHK function when called.
         * @param {Func(UCharIterator, UInt32, "int*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [UCharIterator.Ptr, UInt32, "int*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
