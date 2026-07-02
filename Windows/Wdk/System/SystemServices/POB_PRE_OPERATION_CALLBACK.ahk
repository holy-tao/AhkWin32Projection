#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OB_PREOP_CALLBACK_STATUS.ahk" { OB_PREOP_CALLBACK_STATUS }
#Import ".\OB_PRE_OPERATION_INFORMATION.ahk" { OB_PRE_OPERATION_INFORMATION }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct POB_PRE_OPERATION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is POB_PRE_OPERATION_CALLBACK) {
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
     * @param {Pointer<OB_PRE_OPERATION_INFORMATION>} OperationInformation 
     * @returns {OB_PREOP_CALLBACK_STATUS} 
     */
    Call(RegistrationContext, OperationInformation) {
        RegistrationContextMarshal := RegistrationContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, RegistrationContextMarshal, RegistrationContext, OB_PRE_OPERATION_INFORMATION.Ptr, OperationInformation, OB_PREOP_CALLBACK_STATUS)
        return result
    }

    /**
     * A POB_PRE_OPERATION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends POB_PRE_OPERATION_CALLBACK {
        /**
         * Creates a POB_PRE_OPERATION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", OB_PRE_OPERATION_INFORMATION) => OB_PREOP_CALLBACK_STATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", OB_PRE_OPERATION_INFORMATION.Ptr, OB_PREOP_CALLBACK_STATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
