#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPCloseEnum {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPCloseEnum) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hEnum 
     * @returns {Integer} 
     */
    Call(hEnum) {
        result := DllCall(this.value, HANDLE, hEnum, UInt32)
        return result
    }

    /**
     * A PF_NPCloseEnum that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPCloseEnum {
        /**
         * Creates a PF_NPCloseEnum pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
