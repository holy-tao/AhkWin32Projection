#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Operation.ahk" { MI_Operation }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_OperationCallback_WriteProgress {
    value : IntPtr

    __value {
        set {
            if (value is MI_OperationCallback_WriteProgress) {
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
     * @param {Pointer<Integer>} activity 
     * @param {Pointer<Integer>} currentOperation 
     * @param {Pointer<Integer>} statusDescription 
     * @param {Integer} percentageComplete 
     * @param {Integer} secondsRemaining 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(operation, callbackContext, activity, currentOperation, statusDescription, percentageComplete, secondsRemaining) {
        callbackContextMarshal := callbackContext is VarRef ? "ptr" : "ptr"
        activityMarshal := activity is VarRef ? "ushort*" : "ptr"
        currentOperationMarshal := currentOperation is VarRef ? "ushort*" : "ptr"
        statusDescriptionMarshal := statusDescription is VarRef ? "ushort*" : "ptr"

        DllCall(this.value, MI_Operation.Ptr, operation, callbackContextMarshal, callbackContext, activityMarshal, activity, currentOperationMarshal, currentOperation, statusDescriptionMarshal, statusDescription, UInt32, percentageComplete, UInt32, secondsRemaining)
    }

    /**
     * A MI_OperationCallback_WriteProgress that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MI_OperationCallback_WriteProgress {
        /**
         * Creates a MI_OperationCallback_WriteProgress pointer that invokes the given AHK function when called.
         * @param {Func(MI_Operation, "ptr", "ushort*", "ushort*", "ushort*", UInt32, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [MI_Operation.Ptr, "ptr", "ushort*", "ushort*", "ushort*", UInt32, UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
