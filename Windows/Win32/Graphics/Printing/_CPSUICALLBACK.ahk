#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CPSUICBPARAM.ahk" { CPSUICBPARAM }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct _CPSUICALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is _CPSUICALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CPSUICBPARAM>} pCPSUICBParam 
     * @returns {Integer} 
     */
    Call(pCPSUICBParam) {
        result := DllCall(this.value, CPSUICBPARAM.Ptr, pCPSUICBParam, Int32)
        return result
    }

    /**
     * A _CPSUICALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends _CPSUICALLBACK {
        /**
         * Creates a _CPSUICALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(CPSUICBPARAM) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CPSUICBPARAM.Ptr, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
