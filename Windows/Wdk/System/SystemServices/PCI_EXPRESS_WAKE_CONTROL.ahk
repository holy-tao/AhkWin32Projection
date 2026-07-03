#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_WAKE_CONTROL {
    value : IntPtr

    __value {
        set {
            if (value is PCI_EXPRESS_WAKE_CONTROL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {BOOLEAN} EnableWake 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Context, EnableWake) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _ContextMarshal, _Context, BOOLEAN, EnableWake)
    }

    /**
     * A PCI_EXPRESS_WAKE_CONTROL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCI_EXPRESS_WAKE_CONTROL {
        /**
         * Creates a PCI_EXPRESS_WAKE_CONTROL pointer that invokes the given AHK function when called.
         * @param {Func("ptr", BOOLEAN) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", BOOLEAN, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
