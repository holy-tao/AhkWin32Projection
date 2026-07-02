#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SE_IMAGE_TYPE.ahk" { SE_IMAGE_TYPE }
#Import ".\BDCB_IMAGE_INFORMATION.ahk" { BDCB_IMAGE_INFORMATION }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SE_IMAGE_VERIFICATION_CALLBACK_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is SE_IMAGE_VERIFICATION_CALLBACK_FUNCTION) {
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
     * @param {SE_IMAGE_TYPE} _ImageType 
     * @param {Pointer<BDCB_IMAGE_INFORMATION>} ImageInformation 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(CallbackContext, _ImageType, ImageInformation) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, CallbackContextMarshal, CallbackContext, SE_IMAGE_TYPE, _ImageType, BDCB_IMAGE_INFORMATION.Ptr, ImageInformation)
    }

    /**
     * A SE_IMAGE_VERIFICATION_CALLBACK_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SE_IMAGE_VERIFICATION_CALLBACK_FUNCTION {
        /**
         * Creates a SE_IMAGE_VERIFICATION_CALLBACK_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", SE_IMAGE_TYPE, BDCB_IMAGE_INFORMATION) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", SE_IMAGE_TYPE, BDCB_IMAGE_INFORMATION.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
