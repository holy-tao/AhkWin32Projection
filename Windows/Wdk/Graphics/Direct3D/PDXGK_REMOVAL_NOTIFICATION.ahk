#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct PDXGK_REMOVAL_NOTIFICATION {
    value : IntPtr

    __value {
        set {
            if (value is PDXGK_REMOVAL_NOTIFICATION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} GraphicsDeviceHandle 
     * @param {Pointer<Void>} PrivateHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(GraphicsDeviceHandle, PrivateHandle) {
        GraphicsDeviceHandleMarshal := GraphicsDeviceHandle is VarRef ? "ptr" : "ptr"
        PrivateHandleMarshal := PrivateHandle is VarRef ? "ptr" : "ptr"

        DllCall(this.value, GraphicsDeviceHandleMarshal, GraphicsDeviceHandle, PrivateHandleMarshal, PrivateHandle)
    }

    /**
     * A PDXGK_REMOVAL_NOTIFICATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXGK_REMOVAL_NOTIFICATION {
        /**
         * Creates a PDXGK_REMOVAL_NOTIFICATION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
