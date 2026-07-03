#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PREGISTER_FOR_DEVICE_NOTIFICATIONS {
    value : IntPtr

    __value {
        set {
            if (value is PREGISTER_FOR_DEVICE_NOTIFICATIONS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} param0 
     * @param {Pointer<PDEVICE_NOTIFY_CALLBACK>} param1 
     * @param {Pointer<Void>} param2 
     * @returns {NTSTATUS} 
     */
    Call(param0, param1, param2) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DEVICE_OBJECT.Ptr, param0, "ptr", param1, param2Marshal, param2, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PREGISTER_FOR_DEVICE_NOTIFICATIONS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PREGISTER_FOR_DEVICE_NOTIFICATIONS {
        /**
         * Creates a PREGISTER_FOR_DEVICE_NOTIFICATIONS pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, "ptr", "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, "ptr", "ptr", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
