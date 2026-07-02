#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JsMemoryEventType.ahk" { JsMemoryEventType }

/**
 * @namespace Windows.Win32.System.Js
 */
export default struct JsMemoryAllocationCallback {
    value : IntPtr

    __value {
        set {
            if (value is JsMemoryAllocationCallback) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} callbackState 
     * @param {JsMemoryEventType} allocationEvent 
     * @param {Pointer} allocationSize 
     * @returns {Boolean} 
     */
    Call(callbackState, allocationEvent, allocationSize) {
        callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, callbackStateMarshal, callbackState, JsMemoryEventType, allocationEvent, IntPtr, allocationSize, Int32)
        return result
    }

    /**
     * A JsMemoryAllocationCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends JsMemoryAllocationCallback {
        /**
         * Creates a JsMemoryAllocationCallback pointer that invokes the given AHK function when called.
         * @param {Func("ptr", JsMemoryEventType, IntPtr) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", JsMemoryEventType, IntPtr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
