#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DHPDEV.ahk" { DHPDEV }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvIcmSetDeviceGammaRamp {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvIcmSetDeviceGammaRamp) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {DHPDEV} param0 
     * @param {Integer} param1 
     * @param {Pointer<Void>} param2 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DHPDEV, param0, UInt32, param1, param2Marshal, param2, BOOL)
        return result
    }

    /**
     * A PFN_DrvIcmSetDeviceGammaRamp that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvIcmSetDeviceGammaRamp {
        /**
         * Creates a PFN_DrvIcmSetDeviceGammaRamp pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, UInt32, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, UInt32, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
