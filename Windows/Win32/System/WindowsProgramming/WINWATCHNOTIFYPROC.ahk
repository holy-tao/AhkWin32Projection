#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\HWINWATCH.ahk" { HWINWATCH }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct WINWATCHNOTIFYPROC {
    value : IntPtr

    __value {
        set {
            if (value is WINWATCHNOTIFYPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWINWATCH} hww 
     * @param {HWND} _hwnd 
     * @param {Integer} code 
     * @param {LPARAM} _lParam 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hww, _hwnd, code, _lParam) {
        DllCall(this.value, HWINWATCH, hww, HWND, _hwnd, UInt32, code, LPARAM, _lParam)
    }

    /**
     * A WINWATCHNOTIFYPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WINWATCHNOTIFYPROC {
        /**
         * Creates a WINWATCHNOTIFYPROC pointer that invokes the given AHK function when called.
         * @param {Func(HWINWATCH, HWND, UInt32, LPARAM) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWINWATCH, HWND, UInt32, LPARAM, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
