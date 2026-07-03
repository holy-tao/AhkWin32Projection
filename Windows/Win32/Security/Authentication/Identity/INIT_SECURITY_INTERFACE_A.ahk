#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecurityFunctionTableA.ahk" { SecurityFunctionTableA }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset ANSI
 */
export default struct INIT_SECURITY_INTERFACE_A {
    value : IntPtr

    __value {
        set {
            if (value is INIT_SECURITY_INTERFACE_A) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {Pointer<SecurityFunctionTableA>} 
     */
    Call() {
        result := DllCall(this.value, SecurityFunctionTableA.Ptr)
        return result
    }

    /**
     * A INIT_SECURITY_INTERFACE_A that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends INIT_SECURITY_INTERFACE_A {
        /**
         * Creates a INIT_SECURITY_INTERFACE_A pointer that invokes the given AHK function when called.
         * @param {Func() => SecurityFunctionTableA.Ptr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SecurityFunctionTableA.Ptr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
