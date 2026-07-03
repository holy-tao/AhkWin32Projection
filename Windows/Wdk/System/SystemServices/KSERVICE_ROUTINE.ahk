#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KSERVICE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is KSERVICE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer>} Interrupt 
     * @param {Pointer<Void>} ServiceContext 
     * @returns {BOOLEAN} 
     */
    Call(Interrupt, ServiceContext) {
        InterruptMarshal := Interrupt is VarRef ? "ptr*" : "ptr"
        ServiceContextMarshal := ServiceContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, InterruptMarshal, Interrupt, ServiceContextMarshal, ServiceContext, BOOLEAN)
        return result
    }

    /**
     * A KSERVICE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KSERVICE_ROUTINE {
        /**
         * Creates a KSERVICE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", "ptr") => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", "ptr", BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
