#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PDEVICE_NOTIFY_CALLBACK.ahk" { PDEVICE_NOTIFY_CALLBACK }
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PUNREGISTER_FOR_DEVICE_NOTIFICATIONS {
    value : IntPtr

    __value {
        set {
            if (value is PUNREGISTER_FOR_DEVICE_NOTIFICATIONS) {
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
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1) {
        DllCall(this.value, DEVICE_OBJECT.Ptr, param0, PDEVICE_NOTIFY_CALLBACK, param1)
    }

    /**
     * A PUNREGISTER_FOR_DEVICE_NOTIFICATIONS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PUNREGISTER_FOR_DEVICE_NOTIFICATIONS {
        /**
         * Creates a PUNREGISTER_FOR_DEVICE_NOTIFICATIONS pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, PDEVICE_NOTIFY_CALLBACK) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, PDEVICE_NOTIFY_CALLBACK, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
