#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UText.ahk" { UText }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UTextClose {
    value : IntPtr

    __value {
        set {
            if (value is UTextClose) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<UText>} ut 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(ut) {
        DllCall(this.value, UText.Ptr, ut)
    }

    /**
     * A UTextClose that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UTextClose {
        /**
         * Creates a UTextClose pointer that invokes the given AHK function when called.
         * @param {Func(UText) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [UText.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
