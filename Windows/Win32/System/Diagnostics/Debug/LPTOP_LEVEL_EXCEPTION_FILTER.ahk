#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EXCEPTION_POINTERS.ahk" { EXCEPTION_POINTERS }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct LPTOP_LEVEL_EXCEPTION_FILTER {
    value : IntPtr

    __value {
        set {
            if (value is LPTOP_LEVEL_EXCEPTION_FILTER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<EXCEPTION_POINTERS>} ExceptionInfo 
     * @returns {Integer} 
     */
    Call(ExceptionInfo) {
        result := DllCall(this.value, EXCEPTION_POINTERS.Ptr, ExceptionInfo, Int32)
        return result
    }

    /**
     * A LPTOP_LEVEL_EXCEPTION_FILTER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPTOP_LEVEL_EXCEPTION_FILTER {
        /**
         * Creates a LPTOP_LEVEL_EXCEPTION_FILTER pointer that invokes the given AHK function when called.
         * @param {Func(EXCEPTION_POINTERS) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [EXCEPTION_POINTERS.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
