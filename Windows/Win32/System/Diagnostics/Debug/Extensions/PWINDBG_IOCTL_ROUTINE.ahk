#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PWINDBG_IOCTL_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PWINDBG_IOCTL_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} IoctlType 
     * @param {Pointer<Void>} lpvData 
     * @param {Integer} cbSize 
     * @returns {Integer} 
     */
    Call(IoctlType, lpvData, cbSize) {
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt16, IoctlType, lpvDataMarshal, lpvData, UInt32, cbSize, UInt32)
        return result
    }

    /**
     * A PWINDBG_IOCTL_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINDBG_IOCTL_ROUTINE {
        /**
         * Creates a PWINDBG_IOCTL_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(UInt16, "ptr", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt16, "ptr", UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
