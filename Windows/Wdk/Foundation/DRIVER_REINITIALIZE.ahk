#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRIVER_OBJECT.ahk" { DRIVER_OBJECT }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct DRIVER_REINITIALIZE {
    value : IntPtr

    __value {
        set {
            if (value is DRIVER_REINITIALIZE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<Void>} _Context 
     * @param {Integer} Count 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(DriverObject, _Context, Count) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, DRIVER_OBJECT.Ptr, DriverObject, _ContextMarshal, _Context, UInt32, Count)
    }

    /**
     * A DRIVER_REINITIALIZE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DRIVER_REINITIALIZE {
        /**
         * Creates a DRIVER_REINITIALIZE pointer that invokes the given AHK function when called.
         * @param {Func(DRIVER_OBJECT, "ptr", UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DRIVER_OBJECT.Ptr, "ptr", UInt32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
