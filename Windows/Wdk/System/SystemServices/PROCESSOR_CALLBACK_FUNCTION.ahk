#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KE_PROCESSOR_CHANGE_NOTIFY_CONTEXT.ahk" { KE_PROCESSOR_CHANGE_NOTIFY_CONTEXT }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PROCESSOR_CALLBACK_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is PROCESSOR_CALLBACK_FUNCTION) {
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
     * @param {Pointer<KE_PROCESSOR_CHANGE_NOTIFY_CONTEXT>} ChangeContext 
     * @param {Pointer<Integer>} OperationStatus 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(CallbackContext, ChangeContext, OperationStatus) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"
        OperationStatusMarshal := OperationStatus is VarRef ? "int*" : "ptr"

        DllCall(this.value, CallbackContextMarshal, CallbackContext, KE_PROCESSOR_CHANGE_NOTIFY_CONTEXT.Ptr, ChangeContext, OperationStatusMarshal, OperationStatus)
    }

    /**
     * A PROCESSOR_CALLBACK_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PROCESSOR_CALLBACK_FUNCTION {
        /**
         * Creates a PROCESSOR_CALLBACK_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", KE_PROCESSOR_CHANGE_NOTIFY_CONTEXT, "int*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", KE_PROCESSOR_CHANGE_NOTIFY_CONTEXT.Ptr, "int*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
