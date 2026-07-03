#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct LPFNSHOWJOYCPL {
    value : IntPtr

    __value {
        set {
            if (value is LPFNSHOWJOYCPL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_hWnd) {
        DllCall(this.value, HWND, _hWnd)
    }

    /**
     * A LPFNSHOWJOYCPL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNSHOWJOYCPL {
        /**
         * Creates a LPFNSHOWJOYCPL pointer that invokes the given AHK function when called.
         * @param {Func(HWND) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
