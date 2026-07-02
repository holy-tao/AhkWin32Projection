#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPDeviceMode {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPDeviceMode) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} hParent 
     * @returns {Integer} 
     */
    Call(hParent) {
        result := DllCall(this.value, HWND, hParent, UInt32)
        return result
    }

    /**
     * A PF_NPDeviceMode that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPDeviceMode {
        /**
         * Creates a PF_NPDeviceMode pointer that invokes the given AHK function when called.
         * @param {Func(HWND) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
