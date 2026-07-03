#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvResetPDEV {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvResetPDEV) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {DHPDEV} dhpdevOld 
     * @param {DHPDEV} dhpdevNew 
     * @returns {BOOL} 
     */
    Call(dhpdevOld, dhpdevNew) {
        result := DllCall(this.value, DHPDEV, dhpdevOld, DHPDEV, dhpdevNew, BOOL)
        return result
    }

    /**
     * A PFN_DrvResetPDEV that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvResetPDEV {
        /**
         * Creates a PFN_DrvResetPDEV pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, DHPDEV) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, DHPDEV, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
