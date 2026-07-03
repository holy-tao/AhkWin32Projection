#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPFMXEditPerm {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPFMXEditPerm) {
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
     * @param {HWND} hwndFMX 
     * @param {Integer} nDialogType 
     * @returns {Integer} 
     */
    Call(lpDriveName, hwndFMX, nDialogType) {
        lpDriveName := lpDriveName is String ? StrPtr(lpDriveName) : lpDriveName

        result := DllCall(this.value, "ptr", lpDriveName, HWND, hwndFMX, UInt32, nDialogType, UInt32)
        return result
    }

    /**
     * A PF_NPFMXEditPerm that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPFMXEditPerm {
        /**
         * Creates a PF_NPFMXEditPerm pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, HWND, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, HWND, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
