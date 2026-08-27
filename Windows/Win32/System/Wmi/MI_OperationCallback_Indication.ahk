#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Instance.ahk" { MI_Instance }
#Import ".\MI_Operation.ahk" { MI_Operation }
#Import ".\MI_Result.ahk" { MI_Result }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_OperationCallback_Indication {
    value : IntPtr

    __value {
        set {
            if (value is MI_OperationCallback_Indication) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * @param {Pointer<MI_Operation>} operation 
     * @param {Pointer<Void>} callbackContext 
     * @param {Pointer<MI_Instance>} instance 
     * @param {Pointer<Integer>} bookmark 
     * @param {Pointer<Integer>} machineID 
     * @param {Integer} moreResults 
     * @param {MI_Result} resultCode 
     * @param {Pointer<Integer>} errorString 
     * @param {Pointer<MI_Instance>} errorDetails 
     * @param {Pointer} resultAcknowledgement 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(operation, callbackContext, instance, bookmark, machineID, moreResults, resultCode, errorString, errorDetails, resultAcknowledgement) {
        operationMarshal := operation == 0 ? IntPtr : MI_Operation.Ptr
        callbackContextMarshal := callbackContext is VarRef ? "ptr" : IntPtr
        instanceMarshal := instance == 0 ? IntPtr : MI_Instance.Ptr
        bookmarkMarshal := bookmark is VarRef ? "ushort*" : IntPtr
        bookmarkMarshal := bookmark == 0 ? IntPtr : "ushort*"
        machineIDMarshal := machineID is VarRef ? "ushort*" : IntPtr
        machineIDMarshal := machineID == 0 ? IntPtr : "ushort*"
        errorStringMarshal := errorString is VarRef ? "ushort*" : IntPtr
        errorStringMarshal := errorString == 0 ? IntPtr : "ushort*"
        errorDetailsMarshal := errorDetails == 0 ? IntPtr : MI_Instance.Ptr
        resultAcknowledgementMarshal := resultAcknowledgement == 0 ? IntPtr : IntPtr

        DllCall(this.value, operationMarshal, operation, callbackContextMarshal, callbackContext, instanceMarshal, instance, bookmarkMarshal, bookmark, machineIDMarshal, machineID, Int8, moreResults, MI_Result, resultCode, errorStringMarshal, errorString, errorDetailsMarshal, errorDetails, resultAcknowledgementMarshal, resultAcknowledgement)
    }

    /**
     * A MI_OperationCallback_Indication that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MI_OperationCallback_Indication {
        /**
         * Creates a MI_OperationCallback_Indication pointer that invokes the given AHK function when called.
         * @param {Func(MI_Operation, "ptr", MI_Instance, "ushort*", "ushort*", Int8, MI_Result, "ushort*", MI_Instance, IntPtr) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 10)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 10 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [MI_Operation.Ptr, "ptr", MI_Instance.Ptr, "ushort*", "ushort*", Int8, MI_Result, "ushort*", MI_Instance.Ptr, IntPtr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
