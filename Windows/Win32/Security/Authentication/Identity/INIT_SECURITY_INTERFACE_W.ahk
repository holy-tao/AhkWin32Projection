#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecurityFunctionTableW.ahk" { SecurityFunctionTableW }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset Unicode
 */
export default struct INIT_SECURITY_INTERFACE_W {
    value : IntPtr

    __value {
        set {
            if (value is INIT_SECURITY_INTERFACE_W) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {Pointer<SecurityFunctionTableW>} 
     */
    Call() {
        result := DllCall(this.value, SecurityFunctionTableW.Ptr)
        return result
    }

    /**
     * A INIT_SECURITY_INTERFACE_W that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends INIT_SECURITY_INTERFACE_W {
        /**
         * Creates a INIT_SECURITY_INTERFACE_W pointer that invokes the given AHK function when called.
         * @param {Func() => SecurityFunctionTableW.Ptr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SecurityFunctionTableW.Ptr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
