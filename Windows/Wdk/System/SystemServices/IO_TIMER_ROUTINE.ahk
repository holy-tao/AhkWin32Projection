#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_TIMER_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is IO_TIMER_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<Void>} _Context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(DeviceObject, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, DEVICE_OBJECT.Ptr, DeviceObject, _ContextMarshal, _Context)
    }

    /**
     * A IO_TIMER_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IO_TIMER_ROUTINE {
        /**
         * Creates a IO_TIMER_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
