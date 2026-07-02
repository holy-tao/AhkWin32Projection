#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Services
 */
export default struct HANDLER_FUNCTION_EX {
    value : IntPtr

    __value {
        set {
            if (value is HANDLER_FUNCTION_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwControl 
     * @param {Integer} dwEventType 
     * @param {Pointer<Void>} lpEventData 
     * @param {Pointer<Void>} lpContext 
     * @returns {Integer} 
     */
    Call(dwControl, dwEventType, lpEventData, lpContext) {
        lpEventDataMarshal := lpEventData is VarRef ? "ptr" : "ptr"
        lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, dwControl, UInt32, dwEventType, lpEventDataMarshal, lpEventData, lpContextMarshal, lpContext, UInt32)
        return result
    }

    /**
     * A HANDLER_FUNCTION_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends HANDLER_FUNCTION_EX {
        /**
         * Creates a HANDLER_FUNCTION_EX pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, "ptr", "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, "ptr", "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
