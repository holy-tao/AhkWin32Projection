#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PDEBUG_STACK_PROVIDER_ENDTHREADSTACKRECONSTRUCTION {
    value : IntPtr

    __value {
        set {
            if (value is PDEBUG_STACK_PROVIDER_ENDTHREADSTACKRECONSTRUCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Call() {
        result := DllCall(this.value, "HRESULT")
        return result
    }

    /**
     * A PDEBUG_STACK_PROVIDER_ENDTHREADSTACKRECONSTRUCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDEBUG_STACK_PROVIDER_ENDTHREADSTACKRECONSTRUCTION {
        /**
         * Creates a PDEBUG_STACK_PROVIDER_ENDTHREADSTACKRECONSTRUCTION pointer that invokes the given AHK function when called.
         * @param {Func() => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
