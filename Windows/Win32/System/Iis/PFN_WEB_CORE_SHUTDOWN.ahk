#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct PFN_WEB_CORE_SHUTDOWN {
    value : IntPtr

    __value {
        set {
            if (value is PFN_WEB_CORE_SHUTDOWN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} fImmediate 
     * @returns {HRESULT} 
     */
    Call(fImmediate) {
        result := DllCall(this.value, UInt32, fImmediate, "HRESULT")
        return result
    }

    /**
     * A PFN_WEB_CORE_SHUTDOWN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_WEB_CORE_SHUTDOWN {
        /**
         * Creates a PFN_WEB_CORE_SHUTDOWN pointer that invokes the given AHK function when called.
         * @param {Func(UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
