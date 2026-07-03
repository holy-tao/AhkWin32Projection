#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Operation.ahk" { MI_Operation }
#Import ".\MI_Type.ahk" { MI_Type }
#Import ".\MI_Value.ahk" { MI_Value }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_OperationCallback_StreamedParameter {
    value : IntPtr

    __value {
        set {
            if (value is MI_OperationCallback_StreamedParameter) {
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
     * @param {Pointer<Integer>} parameterName 
     * @param {MI_Type} resultType 
     * @param {Pointer<MI_Value>} result 
     * @param {Pointer} resultAcknowledgement 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(operation, callbackContext, parameterName, resultType, result, resultAcknowledgement) {
        callbackContextMarshal := callbackContext is VarRef ? "ptr" : "ptr"
        parameterNameMarshal := parameterName is VarRef ? "ushort*" : "ptr"

        DllCall(this.value, MI_Operation.Ptr, operation, callbackContextMarshal, callbackContext, parameterNameMarshal, parameterName, MI_Type, resultType, MI_Value.Ptr, result, IntPtr, resultAcknowledgement)
    }

    /**
     * A MI_OperationCallback_StreamedParameter that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MI_OperationCallback_StreamedParameter {
        /**
         * Creates a MI_OperationCallback_StreamedParameter pointer that invokes the given AHK function when called.
         * @param {Func(MI_Operation, "ptr", "ushort*", MI_Type, MI_Value, IntPtr) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [MI_Operation.Ptr, "ptr", "ushort*", MI_Type, MI_Value.Ptr, IntPtr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
