#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.Media.Audio
 * @charset ANSI
 */
export default struct ACMFORMATCHOOSEHOOKPROCA {
    value : IntPtr

    __value {
        set {
            if (value is ACMFORMATCHOOSEHOOKPROCA) {
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
     * @param {Integer} uMsg 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {Integer} 
     */
    Call(_hwnd, uMsg, _wParam, _lParam) {
        result := DllCall(this.value, HWND, _hwnd, UInt32, uMsg, WPARAM, _wParam, LPARAM, _lParam, UInt32)
        return result
    }

    /**
     * A ACMFORMATCHOOSEHOOKPROCA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ACMFORMATCHOOSEHOOKPROCA {
        /**
         * Creates a ACMFORMATCHOOSEHOOKPROCA pointer that invokes the given AHK function when called.
         * @param {Func(HWND, UInt32, WPARAM, LPARAM) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, UInt32, WPARAM, LPARAM, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
