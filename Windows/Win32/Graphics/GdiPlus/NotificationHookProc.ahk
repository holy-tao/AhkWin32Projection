#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Status.ahk" { Status }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct NotificationHookProc {
    value : IntPtr

    __value {
        set {
            if (value is NotificationHookProc) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer>} token 
     * @returns {Status} 
     */
    Call(token) {
        tokenMarshal := token is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, tokenMarshal, token, Status)
        return result
    }

    /**
     * A NotificationHookProc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NotificationHookProc {
        /**
         * Creates a NotificationHookProc pointer that invokes the given AHK function when called.
         * @param {Func("ptr*") => Status} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", Status])
        }

        __Delete() => CallbackFree(this.value)
    }
}
