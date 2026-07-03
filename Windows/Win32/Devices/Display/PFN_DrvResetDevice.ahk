#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvResetDevice {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvResetDevice) {
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
     * @param {Pointer<Void>} param1 
     * @returns {Integer} 
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DHPDEV, param0, param1Marshal, param1, UInt32)
        return result
    }

    /**
     * A PFN_DrvResetDevice that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvResetDevice {
        /**
         * Creates a PFN_DrvResetDevice pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
