#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct FAST_IO_DETACH_DEVICE {
    value : IntPtr

    __value {
        set {
            if (value is FAST_IO_DETACH_DEVICE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} SourceDevice 
     * @param {Pointer<DEVICE_OBJECT>} TargetDevice 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(SourceDevice, TargetDevice) {
        DllCall(this.value, DEVICE_OBJECT.Ptr, SourceDevice, DEVICE_OBJECT.Ptr, TargetDevice)
    }

    /**
     * A FAST_IO_DETACH_DEVICE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FAST_IO_DETACH_DEVICE {
        /**
         * Creates a FAST_IO_DETACH_DEVICE pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, DEVICE_OBJECT) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, DEVICE_OBJECT.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
