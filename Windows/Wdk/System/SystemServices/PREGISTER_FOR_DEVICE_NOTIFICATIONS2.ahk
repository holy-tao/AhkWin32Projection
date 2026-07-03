#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PDEVICE_NOTIFY_CALLBACK2.ahk" { PDEVICE_NOTIFY_CALLBACK2 }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PREGISTER_FOR_DEVICE_NOTIFICATIONS2 {
    value : IntPtr

    __value {
        set {
            if (value is PREGISTER_FOR_DEVICE_NOTIFICATIONS2) {
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
     * @param {Pointer<PDEVICE_NOTIFY_CALLBACK2>} _NotificationHandler 
     * @param {Pointer<Void>} NotificationContext 
     * @returns {NTSTATUS} 
     */
    Call(_Context, _NotificationHandler, NotificationContext) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        NotificationContextMarshal := NotificationContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, PDEVICE_NOTIFY_CALLBACK2, _NotificationHandler, NotificationContextMarshal, NotificationContext, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PREGISTER_FOR_DEVICE_NOTIFICATIONS2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PREGISTER_FOR_DEVICE_NOTIFICATIONS2 {
        /**
         * Creates a PREGISTER_FOR_DEVICE_NOTIFICATIONS2 pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PDEVICE_NOTIFY_CALLBACK2, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PDEVICE_NOTIFY_CALLBACK2, "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
