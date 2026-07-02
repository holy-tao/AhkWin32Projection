#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Operation.ahk" { MI_Operation }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_OperationCallback_WriteMessage {
    value : IntPtr

    __value {
        set {
            if (value is MI_OperationCallback_WriteMessage) {
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
     * @param {Integer} channel 
     * @param {Pointer<Integer>} message 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(operation, callbackContext, channel, message) {
        callbackContextMarshal := callbackContext is VarRef ? "ptr" : "ptr"
        messageMarshal := message is VarRef ? "ushort*" : "ptr"

        DllCall(this.value, MI_Operation.Ptr, operation, callbackContextMarshal, callbackContext, UInt32, channel, messageMarshal, message)
    }

    /**
     * A MI_OperationCallback_WriteMessage that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MI_OperationCallback_WriteMessage {
        /**
         * Creates a MI_OperationCallback_WriteMessage pointer that invokes the given AHK function when called.
         * @param {Func(MI_Operation, "ptr", UInt32, "ushort*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [MI_Operation.Ptr, "ptr", UInt32, "ushort*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
