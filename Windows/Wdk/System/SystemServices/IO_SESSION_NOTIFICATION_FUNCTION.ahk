#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_SESSION_NOTIFICATION_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is IO_SESSION_NOTIFICATION_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} SessionObject 
     * @param {Pointer<Void>} IoObject 
     * @param {Integer} Event 
     * @param {Pointer<Void>} _Context 
     * @param {Integer} NotificationPayload 
     * @param {Integer} PayloadLength 
     * @returns {NTSTATUS} 
     */
    Call(SessionObject, IoObject, Event, _Context, NotificationPayload, PayloadLength) {
        SessionObjectMarshal := SessionObject is VarRef ? "ptr" : "ptr"
        IoObjectMarshal := IoObject is VarRef ? "ptr" : "ptr"
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, SessionObjectMarshal, SessionObject, IoObjectMarshal, IoObject, UInt32, Event, _ContextMarshal, _Context, IntPtr, NotificationPayload, UInt32, PayloadLength, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A IO_SESSION_NOTIFICATION_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IO_SESSION_NOTIFICATION_FUNCTION {
        /**
         * Creates a IO_SESSION_NOTIFICATION_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", UInt32, "ptr", IntPtr, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", UInt32, "ptr", IntPtr, UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
