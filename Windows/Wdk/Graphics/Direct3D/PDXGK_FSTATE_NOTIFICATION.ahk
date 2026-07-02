#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct PDXGK_FSTATE_NOTIFICATION {
    value : IntPtr

    __value {
        set {
            if (value is PDXGK_FSTATE_NOTIFICATION) {
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
     * @param {Integer} ComponentIndex 
     * @param {Integer} NewFState 
     * @param {BOOLEAN} PreNotification 
     * @param {Pointer<Void>} PrivateHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(GraphicsDeviceHandle, ComponentIndex, NewFState, PreNotification, PrivateHandle) {
        GraphicsDeviceHandleMarshal := GraphicsDeviceHandle is VarRef ? "ptr" : "ptr"
        PrivateHandleMarshal := PrivateHandle is VarRef ? "ptr" : "ptr"

        DllCall(this.value, GraphicsDeviceHandleMarshal, GraphicsDeviceHandle, UInt32, ComponentIndex, UInt32, NewFState, BOOLEAN, PreNotification, PrivateHandleMarshal, PrivateHandle)
    }

    /**
     * A PDXGK_FSTATE_NOTIFICATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXGK_FSTATE_NOTIFICATION {
        /**
         * Creates a PDXGK_FSTATE_NOTIFICATION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, UInt32, BOOLEAN, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, UInt32, BOOLEAN, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
