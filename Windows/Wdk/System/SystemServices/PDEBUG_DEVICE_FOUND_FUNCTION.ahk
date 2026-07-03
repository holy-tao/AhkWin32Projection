#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEBUG_DEVICE_DESCRIPTOR.ahk" { DEBUG_DEVICE_DESCRIPTOR }
#Import ".\KD_CALLBACK_ACTION.ahk" { KD_CALLBACK_ACTION }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PDEBUG_DEVICE_FOUND_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is PDEBUG_DEVICE_FOUND_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DEBUG_DEVICE_DESCRIPTOR>} Device 
     * @returns {KD_CALLBACK_ACTION} 
     */
    Call(Device) {
        result := DllCall(this.value, DEBUG_DEVICE_DESCRIPTOR.Ptr, Device, KD_CALLBACK_ACTION)
        return result
    }

    /**
     * A PDEBUG_DEVICE_FOUND_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDEBUG_DEVICE_FOUND_FUNCTION {
        /**
         * Creates a PDEBUG_DEVICE_FOUND_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func(DEBUG_DEVICE_DESCRIPTOR) => KD_CALLBACK_ACTION} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEBUG_DEVICE_DESCRIPTOR.Ptr, KD_CALLBACK_ACTION])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
