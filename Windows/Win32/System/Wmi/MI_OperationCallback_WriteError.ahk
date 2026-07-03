#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Instance.ahk" { MI_Instance }
#Import ".\MI_Operation.ahk" { MI_Operation }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_OperationCallback_WriteError {
    value : IntPtr

    __value {
        set {
            if (value is MI_OperationCallback_WriteError) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<MI_Operation>} operation 
     * @param {Pointer<Void>} callbackContext 
     * @param {Pointer<MI_Instance>} instance 
     * @param {Pointer} writeErrorResult 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(operation, callbackContext, instance, writeErrorResult) {
        callbackContextMarshal := callbackContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, MI_Operation.Ptr, operation, callbackContextMarshal, callbackContext, MI_Instance.Ptr, instance, IntPtr, writeErrorResult)
    }

    /**
     * A MI_OperationCallback_WriteError that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MI_OperationCallback_WriteError {
        /**
         * Creates a MI_OperationCallback_WriteError pointer that invokes the given AHK function when called.
         * @param {Func(MI_Operation, "ptr", MI_Instance, IntPtr) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [MI_Operation.Ptr, "ptr", MI_Instance.Ptr, IntPtr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
