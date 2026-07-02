#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BDCB_IMAGE_INFORMATION.ahk" { BDCB_IMAGE_INFORMATION }
#Import ".\BDCB_CALLBACK_TYPE.ahk" { BDCB_CALLBACK_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct BOOT_DRIVER_CALLBACK_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is BOOT_DRIVER_CALLBACK_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} CallbackContext 
     * @param {BDCB_CALLBACK_TYPE} Classification 
     * @param {Pointer<BDCB_IMAGE_INFORMATION>} ImageInformation 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(CallbackContext, Classification, ImageInformation) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, CallbackContextMarshal, CallbackContext, BDCB_CALLBACK_TYPE, Classification, BDCB_IMAGE_INFORMATION.Ptr, ImageInformation)
    }

    /**
     * A BOOT_DRIVER_CALLBACK_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BOOT_DRIVER_CALLBACK_FUNCTION {
        /**
         * Creates a BOOT_DRIVER_CALLBACK_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", BDCB_CALLBACK_TYPE, BDCB_IMAGE_INFORMATION) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", BDCB_CALLBACK_TYPE, BDCB_IMAGE_INFORMATION.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
