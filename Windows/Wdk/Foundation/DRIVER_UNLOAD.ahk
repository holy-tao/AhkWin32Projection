#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRIVER_OBJECT.ahk" { DRIVER_OBJECT }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct DRIVER_UNLOAD {
    value : IntPtr

    __value {
        set {
            if (value is DRIVER_UNLOAD) {
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
     * @returns {String} Nothing - always returns an empty string
     */
    Call(DriverObject) {
        DllCall(this.value, DRIVER_OBJECT.Ptr, DriverObject)
    }

    /**
     * A DRIVER_UNLOAD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DRIVER_UNLOAD {
        /**
         * Creates a DRIVER_UNLOAD pointer that invokes the given AHK function when called.
         * @param {Func(DRIVER_OBJECT) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DRIVER_OBJECT.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
