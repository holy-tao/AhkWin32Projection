#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KMESSAGE_SERVICE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is KMESSAGE_SERVICE_ROUTINE) {
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
     * @param {Integer} MessageID 
     * @returns {BOOLEAN} 
     */
    Call(Interrupt, ServiceContext, MessageID) {
        InterruptMarshal := Interrupt is VarRef ? "ptr*" : "ptr"
        ServiceContextMarshal := ServiceContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, InterruptMarshal, Interrupt, ServiceContextMarshal, ServiceContext, UInt32, MessageID, BOOLEAN)
        return result
    }

    /**
     * A KMESSAGE_SERVICE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KMESSAGE_SERVICE_ROUTINE {
        /**
         * Creates a KMESSAGE_SERVICE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", "ptr", UInt32) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", "ptr", UInt32, BOOLEAN])
        }

        __Delete() => CallbackFree(this.value)
    }
}
