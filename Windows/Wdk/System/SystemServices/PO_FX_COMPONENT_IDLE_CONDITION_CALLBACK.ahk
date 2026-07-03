#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PO_FX_COMPONENT_IDLE_CONDITION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PO_FX_COMPONENT_IDLE_CONDITION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Integer} _Component 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Context, _Component) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _ContextMarshal, _Context, UInt32, _Component)
    }

    /**
     * A PO_FX_COMPONENT_IDLE_CONDITION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PO_FX_COMPONENT_IDLE_CONDITION_CALLBACK {
        /**
         * Creates a PO_FX_COMPONENT_IDLE_CONDITION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
