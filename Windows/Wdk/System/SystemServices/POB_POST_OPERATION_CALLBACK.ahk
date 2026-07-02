#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OB_POST_OPERATION_INFORMATION.ahk" { OB_POST_OPERATION_INFORMATION }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct POB_POST_OPERATION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is POB_POST_OPERATION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} RegistrationContext 
     * @param {Pointer<OB_POST_OPERATION_INFORMATION>} OperationInformation 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(RegistrationContext, OperationInformation) {
        RegistrationContextMarshal := RegistrationContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, RegistrationContextMarshal, RegistrationContext, OB_POST_OPERATION_INFORMATION.Ptr, OperationInformation)
    }

    /**
     * A POB_POST_OPERATION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends POB_POST_OPERATION_CALLBACK {
        /**
         * Creates a POB_POST_OPERATION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", OB_POST_OPERATION_INFORMATION) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", OB_POST_OPERATION_INFORMATION.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
