#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EXT_API_VERSION.ahk" { EXT_API_VERSION }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PWINDBG_EXTENSION_API_VERSION {
    value : IntPtr

    __value {
        set {
            if (value is PWINDBG_EXTENSION_API_VERSION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {Pointer<EXT_API_VERSION>} 
     */
    Call() {
        result := DllCall(this.value, EXT_API_VERSION.Ptr)
        return result
    }

    /**
     * A PWINDBG_EXTENSION_API_VERSION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINDBG_EXTENSION_API_VERSION {
        /**
         * Creates a PWINDBG_EXTENSION_API_VERSION pointer that invokes the given AHK function when called.
         * @param {Func() => EXT_API_VERSION.Ptr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [EXT_API_VERSION.Ptr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
