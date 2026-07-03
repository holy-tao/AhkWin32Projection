#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_REGISTER_NOTIFICATION {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_REGISTER_NOTIFICATION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LPTHREAD_START_ROUTINE>} StartFunction 
     * @param {Pointer<Void>} Parameter 
     * @param {Integer} NotificationType 
     * @param {Integer} NotificationClass 
     * @param {Integer} NotificationFlags 
     * @param {Integer} IntervalMinutes 
     * @param {HANDLE} WaitEvent 
     * @returns {HANDLE} 
     */
    Call(StartFunction, Parameter, NotificationType, NotificationClass, NotificationFlags, IntervalMinutes, WaitEvent) {
        ParameterMarshal := Parameter is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", StartFunction, ParameterMarshal, Parameter, UInt32, NotificationType, UInt32, NotificationClass, UInt32, NotificationFlags, UInt32, IntervalMinutes, HANDLE, WaitEvent, HANDLE.Owned)
        return result
    }

    /**
     * A PLSA_REGISTER_NOTIFICATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_REGISTER_NOTIFICATION {
        /**
         * Creates a PLSA_REGISTER_NOTIFICATION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", UInt32, UInt32, UInt32, UInt32, HANDLE) => HANDLE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", UInt32, UInt32, UInt32, UInt32, HANDLE, HANDLE])
        }

        __Delete() => CallbackFree(this.value)
    }
}
