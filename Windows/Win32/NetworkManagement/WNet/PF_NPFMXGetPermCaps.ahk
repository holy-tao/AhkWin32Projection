#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPFMXGetPermCaps {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPFMXGetPermCaps) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpDriveName 
     * @returns {Integer} 
     */
    Call(lpDriveName) {
        lpDriveName := lpDriveName is String ? StrPtr(lpDriveName) : lpDriveName

        result := DllCall(this.value, "ptr", lpDriveName, UInt32)
        return result
    }

    /**
     * A PF_NPFMXGetPermCaps that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPFMXGetPermCaps {
        /**
         * Creates a PF_NPFMXGetPermCaps pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
