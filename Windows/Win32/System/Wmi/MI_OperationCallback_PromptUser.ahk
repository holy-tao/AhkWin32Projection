#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Operation.ahk" { MI_Operation }
#Import ".\MI_PromptType.ahk" { MI_PromptType }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_OperationCallback_PromptUser {
    value : IntPtr

    __value {
        set {
            if (value is MI_OperationCallback_PromptUser) {
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
     * @param {Pointer<Integer>} message 
     * @param {MI_PromptType} promptType 
     * @param {Pointer} promptUserResult 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(operation, callbackContext, message, promptType, promptUserResult) {
        callbackContextMarshal := callbackContext is VarRef ? "ptr" : "ptr"
        messageMarshal := message is VarRef ? "ushort*" : "ptr"

        DllCall(this.value, MI_Operation.Ptr, operation, callbackContextMarshal, callbackContext, messageMarshal, message, MI_PromptType, promptType, IntPtr, promptUserResult)
    }

    /**
     * A MI_OperationCallback_PromptUser that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MI_OperationCallback_PromptUser {
        /**
         * Creates a MI_OperationCallback_PromptUser pointer that invokes the given AHK function when called.
         * @param {Func(MI_Operation, "ptr", "ushort*", MI_PromptType, IntPtr) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [MI_Operation.Ptr, "ptr", "ushort*", MI_PromptType, IntPtr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
