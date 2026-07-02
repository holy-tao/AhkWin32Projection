#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\System\Power\DEVICE_POWER_STATE.ahk" { DEVICE_POWER_STATE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct PDXGK_POWER_NOTIFICATION {
    value : IntPtr

    __value {
        set {
            if (value is PDXGK_POWER_NOTIFICATION) {
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
     * @param {DEVICE_POWER_STATE} NewGrfxPowerState 
     * @param {BOOLEAN} PreNotification 
     * @param {Pointer<Void>} PrivateHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(GraphicsDeviceHandle, NewGrfxPowerState, PreNotification, PrivateHandle) {
        GraphicsDeviceHandleMarshal := GraphicsDeviceHandle is VarRef ? "ptr" : "ptr"
        PrivateHandleMarshal := PrivateHandle is VarRef ? "ptr" : "ptr"

        DllCall(this.value, GraphicsDeviceHandleMarshal, GraphicsDeviceHandle, DEVICE_POWER_STATE, NewGrfxPowerState, BOOLEAN, PreNotification, PrivateHandleMarshal, PrivateHandle)
    }

    /**
     * A PDXGK_POWER_NOTIFICATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXGK_POWER_NOTIFICATION {
        /**
         * Creates a PDXGK_POWER_NOTIFICATION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DEVICE_POWER_STATE, BOOLEAN, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DEVICE_POWER_STATE, BOOLEAN, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
