#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct DRIVER_NOTIFICATION_CALLBACK_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is DRIVER_NOTIFICATION_CALLBACK_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} NotificationStructure 
     * @param {Pointer<Void>} _Context 
     * @returns {NTSTATUS} 
     */
    Call(NotificationStructure, _Context) {
        NotificationStructureMarshal := NotificationStructure is VarRef ? "ptr" : "ptr"
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, NotificationStructureMarshal, NotificationStructure, _ContextMarshal, _Context, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A DRIVER_NOTIFICATION_CALLBACK_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DRIVER_NOTIFICATION_CALLBACK_ROUTINE {
        /**
         * Creates a DRIVER_NOTIFICATION_CALLBACK_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
