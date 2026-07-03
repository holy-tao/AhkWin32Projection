#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPDirectoryNotify {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPDirectoryNotify) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} _hwnd 
     * @param {PWSTR} lpDir 
     * @param {Integer} dwOper 
     * @returns {Integer} 
     */
    Call(_hwnd, lpDir, dwOper) {
        lpDir := lpDir is String ? StrPtr(lpDir) : lpDir

        result := DllCall(this.value, HWND, _hwnd, "ptr", lpDir, UInt32, dwOper, UInt32)
        return result
    }

    /**
     * A PF_NPDirectoryNotify that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPDirectoryNotify {
        /**
         * Creates a PF_NPDirectoryNotify pointer that invokes the given AHK function when called.
         * @param {Func(HWND, PWSTR, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, PWSTR, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
